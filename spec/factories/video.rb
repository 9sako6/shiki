include ActionDispatch::TestProcess

FactoryBot.define do
  factory :video do
    title { 'hamster.mp4' }
    video { fixture_file_upload('spec/fixtures/videos/mouse.mp4') }
  end
end
