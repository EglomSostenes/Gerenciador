class Alliance < ApplicationRecord
  belongs_to :company
  belongs_to :institution
  has_many :projects

  validates :start_date, :end_date, :institution, :company, presence: true
  validate :interval_valid

  scope :expired, ->() {where(Alliance.arel_table[:end_date].lt(Date.today))}
  scope :active, ->() {where(Alliance.arel_table[:end_date].gt(Date.today))}

  def interval_valid
    if start_date and end_date
      errors.add(:base, 'start date cannot be greater than or equal to end date.') unless end_date > start_date
    end
  end

  def to_s
    if company and institution
      start_date.year.to_s + ' - ' + end_date.year.to_s + ' - ' + company.name + ' | ' + institution.name unless new_record?
    end
  end
end
