class User < ApplicationRecord
  attribute :style_preferences, default: []
  attribute :bracelet_preferences, default: []
end
