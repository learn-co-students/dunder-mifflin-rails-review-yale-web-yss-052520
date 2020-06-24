class Dog < ApplicationRecord
    has_many :employees 

    def self.sort_dogs 
        arr = self.all.sort_by{|a| a.employees.length}
        arr.reverse!
     end 
end
