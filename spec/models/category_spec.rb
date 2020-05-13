require 'rails_helper'

RSpec.describe Category, type: :model do
  
  context 'associations' do

    it 'has many courses through courses_categories' do
      relation = Category.reflect_on_association(:courses) 
      expect(relation.macro).to eql(:has_many) 
    end


    # need to test the relationship between categories and courses through joined table

  end
  

end
