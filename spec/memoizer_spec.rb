require_relative '../lib/interactors'

describe Memoizer do
  let(:important_thing) { Interactors::ImportantThing.new }

  context "memoized methods" do
    it "memoizes the call method with no arguments" do
      expect(important_thing.call).to equal(important_thing.call)
    end

    it "memoizes the call method with the same arguments" do
      expect(important_thing.call([1, 2, 3])).to equal(
        important_thing.call([1, 2, 3])
      )
    end

    it "does not memoize the call method with different arguments" do
      expect(important_thing.call([1, 2, 3])).to_not equal(
        important_thing.call([4, 5, 6])
      )
    end
  end

  context "non-memoized methods" do
    it "does not memoize the call method with no arguments" do
      expect(important_thing.non_memoized_method).to_not equal(
        important_thing.non_memoized_method
      )
    end

    it "does not memoize the call method with the same arguments" do
      expect(important_thing.non_memoized_method([1, 2, 3])).to_not equal(
        important_thing.non_memoized_method([1, 2, 3])
      )
    end

    it "does not memoize the call method with different arguments" do
      expect(important_thing.non_memoized_method([1, 2, 3])).to_not equal(
        important_thing.non_memoized_method([4, 5, 6])
      )
    end
  end
end
