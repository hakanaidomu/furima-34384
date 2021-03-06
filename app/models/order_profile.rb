class OrderProfile
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :tel
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :tel, presence: true, format: { with: /\A\d{10,11}\z/ }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Profile.create(postal_code: postal_code, prefecture_id: prefecture_id,
                   city: city, house_number: house_number, building_name: building_name, tel: tel, order_id: order.id)
  end
end
