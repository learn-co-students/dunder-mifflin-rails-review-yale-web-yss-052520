class Employee < ApplicationRecord
    belongs_to :dog
    validates :alias, uniqueness: true
    validates :title, uniqueness: true
    # validates :name, presence: true
    # # validates :age, inclusion: 0...30
    # validates :age, numericality: { only_integer: true, greater_than: 0, less_than: 30}
    def to_s
        first_name + " " + last_name 
    end
end
