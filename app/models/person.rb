class Person < ApplicationRecord
    self.inheritance_column = :type

    validates :name, :type_document, :document, presence: true
    validates :type_contract, presence: true, if: :is_employee?
    validates :type_user, presence: true, if: :is_user?
    validates :coverage, presence: true, if: :is_institution?
    validates :cnae, presence: true, if: :is_company?

    enum type_document: ["CPF", "CNPJ"]
    enum type_contract: ["PJ", "CLT"] #Necessário apenas para Employee
    enum type_user: ["admin", "normal"] #Necessário apenas para User
    enum coverage: ["city", "state", "federal"] #Necessário apenas para Institution

    def self.types
        %w(Institution Company Employee User)
    end

    def is_employee?
        self.type == "Employee"
    end

    def is_user?
        self.type == "User"
    end

    def is_institution?
        self.type == "Institution"
    end

    def is_company?
        self.type == "Company"
    end
end
