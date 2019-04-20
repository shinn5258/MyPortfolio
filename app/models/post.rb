class Post < ApplicationRecord
    validates :title, presence:{message:'は必須項目です。'}
    validates :genre, presence:{message:'は必須項目です。'}
    validates :content, presence:{message:'は必須項目です。'}

    validates :title, :genre, length:{maximum: 20, message:'は20文字以内にしてください'}
    validates :content, length:{maximum: 200, message:'は200文字以内にしてください。'}
end
