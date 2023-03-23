require "music_manager"

RSpec.describe MusicManager do
    it "adds tracks to track list" do
        music_manager = MusicManager.new
        music_manager.add_track("With or Without You")
        music_manager.add_track("All rise")
        expect(music_manager.list_tracks).to eq ["With or Without You", "All rise"]
    end

    it "raises an error when listing an empty track list" do
        music_manager = MusicManager.new
        expect {music_manager.list_tracks}.to raise_error "No tracks are in your track list."
    end

    it "raises an error if the track is added repeatedly to the track list" do
        music_manager = MusicManager.new
        music_manager.add_track("All rise")
        expect {music_manager.add_track("All rise")}.to raise_error "This track is already in your track list."
    end
end