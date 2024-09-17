class Article < ApplicationRecord
  include Tenantable
  validates :title, presence: true
  validates :content, presence: true
end

author = Author.find(1)
Article.for_author(author)