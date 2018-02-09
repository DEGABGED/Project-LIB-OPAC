class AddStatusToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :status, :integer
  end
end

## LICENSE
## This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018.
##
