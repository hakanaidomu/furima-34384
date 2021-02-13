class OrderProfile
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel, :user_id, :item_id

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :tel
    validates :user_id
    validates :item_id
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}


  def save
    order = Order.create(item: item, user_id: user_id)
    Profile.create(postal_code: postal_code, prefecture: prefecture, 
                  city: city, house_number: house_number, building_name: building_name, tel: tel, order_id: order.id)
  end
end

