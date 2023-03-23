class MusicManager
    def initialize
        @track_list = []
    end

    def add_track(track) # string
          fail "This track is already in your track list." if @track_list.include?(track)
          @track_list << track
    end


    def list_tracks
        fail "No tracks are in your track list." if @track_list.empty?
        return @track_list
    end
end