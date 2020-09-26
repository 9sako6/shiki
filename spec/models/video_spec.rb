require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'validation' do
    it 'is invalid because there is no title' do
      video = Video.new
      expect(video).to be_invalid
    end

    it 'is invalid because the title\'s length over the maximum length' do
      video = Video.new(title: 'a' * (Video::MAX_TITLE_LENGTH + 1))
      expect(video).to be_invalid
    end

    it 'is valid' do
      video = Video.new(title: 'a' * Video::MAX_TITLE_LENGTH)
      expect(video).to be_valid
    end
  end
end
