require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'validation' do
    it 'is invalid because there is no video' do
      video = Video.new
      expect(video).to be_invalid
    end

    it 'is valid' do
      video = Video.new
      video.video = fixture_file_upload('spec/fixtures/videos/mouse.mp4')
      expect(video).to be_valid
    end
  end
end
