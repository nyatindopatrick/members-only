# frozen_string_literal: true

class Post < ApplicationRecord
#   validates :title, presence: true
#   validates :text, presence: true, length: {maximum: 70}
    belongs_to :user
end
