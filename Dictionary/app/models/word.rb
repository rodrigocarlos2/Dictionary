class Word < ApplicationRecord
	has_many :meanings, dependent: :destroy
	has_many :synonymous
	accepts_nested_attributes_for :meanings, reject_if: :all_blank, allow_destroy: true
end
