require 'rails_helper'

feature 'tagging' do
  before do
    @video = create(:video)
    @video.video = fixture_file_upload('spec/fixtures/videos/mouse.mp4')
  end

  scenario 'should add a tag to a video' do
    all_videos_count = Video.count

    visit video_path(@video)
    click_link 'Delete the video'
    expect(page).to have_text('The video was deleted successfully.')
    expect(Video.count).to eq(all_videos_count - 1)
  end
end
