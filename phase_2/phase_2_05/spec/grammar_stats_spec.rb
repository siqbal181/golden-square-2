require "grammar_stats"

RSpec.describe GrammarStats do
    it "returns true when a text begins with a capital and ends with appropriate punctuation" do
        grammar_checker = GrammarStats.new
        expect(grammar_checker.check("This is a correct sentence.")).to eq true
    end

    it "returns false when a text begins with a capital and doesn't end with appropriate punctuation" do
        grammar_checker = GrammarStats.new
        expect(grammar_checker.check("This is not a correct sentence,")).to eq false
    end

    it "returns false when a text does not begin with a capital and doesn't end with appropriate punctuation" do
        grammar_checker = GrammarStats.new
        expect(grammar_checker.check("this is not a correct sentence,")).to eq false
    end

    it "fails if no string is provided" do
        grammar_checker = GrammarStats.new
        expect {grammar_checker.check("")}.to raise_error "There is no valid string input."
    end

    context "given there have been multiple strings checked" do
        it "returns an integer percentage of the ones which have passed over total checks" do
        grammar_checker = GrammarStats.new
        grammar_checker.check("This is a correct sentence.")
        grammar_checker.check("This is also a correct sentence.")
        grammar_checker.check("this is not a correct sentence.")
        grammar_checker.check("this is also not a correct sentence.")
        expect(grammar_checker.percentage_good).to eq 50
        end
    end
end