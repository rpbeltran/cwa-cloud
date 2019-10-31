class Story < ApplicationRecord
    serialize :tags, Array
end