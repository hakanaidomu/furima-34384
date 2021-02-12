class OrderProfile
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel, :order, :user_id, :item_id

  with_options presence: true do
    validates :postal_code format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :tel
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}


  def save
    order = Order.create(item: item, user_id: user_id)
    Profile.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, tel: tel, order: order.id)
  end
end

