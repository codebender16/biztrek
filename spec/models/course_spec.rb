require 'rails_helper'

RSpec.describe Course, type: :model do
  # let(:category) { Category.new }
  subject { Course.new(title: 'Test Course', sub_title: 'Test Highlights', price: 500, description: 'Test Description') }

  context 'associations' do
    it 'belongs to Mentor' do
      relation = Course.reflect_on_association(:mentor) 
      expect(relation.macro).to eql(:belongs_to) 
    end

    it 'has many categories' do
      relation = Course.reflect_on_association(:categories)
      expect(relation.macro).to eql(:has_many)
    end
  end


  # context '#display_currency' do
  #   it 'converts the price to the string format' do
  #     expect(subject.display_currency).to eql('$5.00')
  #   end

  # end
end
