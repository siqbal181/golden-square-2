require "count_words"

RSpec.describe "count words method" do
    it "takes a string and returns the word count" do
        expect(count_words("Hello this is me")).to eq 4
    end

    it "returns 0 with an empty string" do
        expect(count_words("")).to eq 0
    end
end