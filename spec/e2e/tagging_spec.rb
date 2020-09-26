require 'rails_helper'

feature 'tagging' do
  before do
    @video = create(:video)
    @video.video = fixture_file_upload('./spec/fixtures/videos/mouse.mov', 'video/mov')
    @video.save!

    @tag = create(:tag)
    @tag.save!
  end

  scenario 'should add a tag to a video' do
    visit video_path(@video)
    click_link 'add'
  end
end
