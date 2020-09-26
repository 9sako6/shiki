require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validation' do
    it 'is invalid because there is no name' do
      tag = Tag.new
      expect(tag).to be_invalid
    end

    it 'is invalid because the name\'s length over the maximum length' do
      tag = Tag.new(name: 'a' * (Tag::MAX_NAME_LENGTH + 1))
      expect(tag).to be_invalid
    end

    it 'is valid' do
      tag = Tag.new(name: 'a' * Tag::MAX_NAME_LENGTH)
      expect(tag).to be_valid
    end
  end
end
