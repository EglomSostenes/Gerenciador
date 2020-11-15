class Company < Person
    has_many :alliances
    has_many :projects, through: :alliances

    def investment
        self.projects.sum(:cost)
    end
end