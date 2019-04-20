class User < ApplicationRecord
    validates :name, {uniqueness: true}
    validates :email, {uniqueness: true}

    validates :name, presence:{message:'は必須項目です。'}
    validates :email, presence:{message:'は必須項目です。'}

    validates :name, length:{maximum: 10, message:'は10文字以内にしてください'}
    validates :email, length:{maximum: 20, message:'は20文字以内にしてください。'}

    validates :password, presence: true
end
