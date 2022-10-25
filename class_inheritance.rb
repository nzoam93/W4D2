class Employee
    attr_accessor :name, :title, :salary, :boss
    def initialize(name, title, salary, boss) #boss is not a name. It's the instance
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        unless boss.nil? 
            boss.employees << self
        end
        
        # unless self.employees.nil?
        #     boss.employees += self.employees
        # end
    end

    def bonus(multiplier)
        bonus = salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :name, :title, :salary, :boss, :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end


    def bonus(multiplier)

         return salary if self.employees.nil? #they don't have employees
         total_salary = 0
         @employees.each do |employee|
            if employee.is_a?(Manager)
                total_salary += employee.salary +  employee.bonus(multiplier)
            else
                total_salary += employee.salary

            end
         end
         return total_salary 
    end
end

Ned = Manager.new("Ned", "Founder", 1000000, nil)
Darren = Manager.new("Darren", "TA Manager", 78000, Ned)
Shawna = Employee.new("Shawna", "TA", 12000, Darren)
David = Employee.new("David", "TA", 10000, Darren)

p Ned
puts
p Darren
puts
p Shawna
puts
p David
puts
p David.bonus(5)
p Darren.bonus(4)
p Ned.bonus(3)
