class Order < ApplicationRecord
  
  has_many :order_products, dependent: :destroy
  belongs_to :member

  enum payment_method:    { "クレジットカード": 0, "銀行振り込み": 1 }
  enum status:    { "入金待ち": 0, "入金確認": 1, "製作中": 2, "製作完了": 3, "発送準備中": 4, "発送済み":5 }

end
