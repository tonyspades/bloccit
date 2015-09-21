class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user

	default_scope { order('created_at DESC') }
	scope :ordered_by_title, -> { reorder(title: :asc) }
	scope :ordered_by_reverse_created_at, -> { reorder(created_at: :desc)}
end
