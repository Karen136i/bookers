class Book < ApplicationRecord
#バリデーション設定済み
  validates :title, presence: true
  validates :body, presence: true
  
end
