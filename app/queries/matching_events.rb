class MatchingEvents
  def self.call(*args)
    new(*args).call
  end

  def initialize(longitude:, latitude:, distance:,
                 price: nil, category: nil, 
                 starts_after: nil, starts_before: nil, 
                 min_age: nil, max_age: nil, sex: nil)
    @longitude = longitude
    @latitude = latitude
    @distance = distance
    @price = price
    @category = category
    @starts_after = starts_after
    @starts_before = starts_before
    @min_age = min_age
    @max_age = max_age
    @sex = sex
  end

  def call
    relation.within(@distance, origin: [@latitude, @longitude])
      .where('events.created_at >= :time', time: Time.now - 3.hours)
      .where(status: Event.statuses[:open])
      .within_price_class(@price)
      .for_category(@category)
      .starts_before(@starts_before)
      .starts_after(@starts_after)
      .for_sex(@sex)
      .within_age_range(@min_age, @max_age)
      .includes(:user)
  end

  private

  def relation
    @relation ||= Event.all.extend(Scopes)
  end

  module Scopes
    def within_price_class(price)
      return all unless price.present?
      where('price <= :price', price: price)
    end

    def for_category(category)
      return all unless category.present?
      where(category: category)
    end

    def starts_before(time)
      return all unless time
      where('time <= :time', time: time)
    end

    def starts_after(time)
      return all unless time
      where('time >= :time', time: time)
    end

    def for_sex(sex)
      return all unless sex.present?
      joins(:user).where(users: { sex: sex })
    end

    def within_age_range(min, max)
      return all unless min.present? and max.present?
      joins(:user).where(users: { age: min..max })
    end
  end
end
