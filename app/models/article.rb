class Article < ApplicationRecord
  include Tenantable
end

author = Author.find(1)
Article.for_author(author)