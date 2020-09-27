require 'rails_helper'

feature 'tagging' do
  before do
    @video = create(:video)
    @tag = create(:tag)
  end

  scenario 'should add a tag to a video' do
    visit video_path(@video)
    click_link 'add'
  end
end
