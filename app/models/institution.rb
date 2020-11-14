class Institution < Person
    has_many :alliances
    has_many :projects, through: :alliances
end