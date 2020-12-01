class Order < ActiveRecord::Base
  belongs_to :user
  has_one :billing_address,  as: 'addressable', class_name: 'Address', conditions: { kind: 'billing' }
  has_one :shipping_address, as: 'addressable', class_name: 'Address', conditions: { kind: 'shipping' }

  validates_presence_of :package

  accepts_nested_attributes_for :user, :billing_address, :shipping_address

  before_validation do
    self.total = package.price unless read_attribute(:total)
  end

  class << self
    def total
      sum(:total).to_f / 100
    end

    def active
      where(active: true)
    end

    def stats
      stats = Hash[*connection.select_rows('SELECT package, count(id) FROM orders GROUP BY package').flatten].symbolize_keys
      stats.each { |key, value| stats[key] = value.to_i }
    end
  end

  attr_accessor :card_number

  def package
    @package ||= Package.new(read_attribute(:package), subscription?)
  end

  def total
    read_attribute(:total) || package.price
  end

  def total_in_dollars
    total.to_f / 100
  end

  def cancelled?
    !active?
  end

  def cancel!
    update_attributes!(active: false, cancelled_at: Time.now)
    user.cancel_subscription
  end

  def save_with_payment!
    subscription? ? user.subscribe(self) : user.charge(self)
    save!
  end

  JSON_ATTRS = [:subscription, :created_at, :comment]

  def as_json(options = {})
    super(only: JSON_ATTRS).merge(total: total_in_dollars, user: user.as_json, package: read_attribute(:package))
  end
end
