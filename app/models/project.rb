class Project < ApplicationRecord
    belongs_to :alliance
    has_and_belongs_to_many :employees
end
