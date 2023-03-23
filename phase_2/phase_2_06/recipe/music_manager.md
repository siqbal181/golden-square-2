# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

> As a user
> So that I can keep track of my music listening
> I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class MusicManager
    def initialize
        @track_list = []
    end

    def add_track(track) # string
        # does not return anything
        # adds a track to the list
        @track_list << track
    end

    def list_tracks
        # returns a formatted list of tracks
        @track_list.each do |track|
            track"\n"
        end
    end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby

# 2
# music_manager = MusicManager.new
# music_manager.add_track("With or Without You")
# music_manager.add_track("All rise")
# expect(music_manager.list_tracks).to eq ("With or Without You"\n"All rise")

# 3
# music_manager = MusicManager.new
# expect {music_manager.list_tracks}.to raise_error "No tracks are in your track list."

# 4
music_manager = MusicManager.new
music_manager.add_track("All rise")
music_manager.add_track("All rise")
expect {music_manager.list_tracks}.to raise_error "This track is already in your track list."
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._