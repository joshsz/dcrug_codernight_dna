require "spec_helper"

describe "DcrugDna" do
  it "encoding and decoding are reversible" do
    raw_string = <<-RAW
      I have a friend who's an artist and has sometimes taken a view which I don't agree with very
      well. He'll hold up a flower and say "look how beautiful it is," and I'll agree. Then he says
      "I as an artist can see how beautiful this is but you as a scientist take this all apart and it
      becomes a dull thing," and I think that he's kind of nutty. First of all, the beauty that he
      sees is available to other people and to me too, I believe. Although I may not be quite as
      refined aesthetically as he is ... I can appreciate the beauty of a flower. At the same time,
      I see much more about the flower than he sees. I could imagine the cells in there, the
      complicated actions inside, which also have a beauty. I mean it's not just beauty at this
      dimension, at one centimeter; there's also beauty at smaller dimensions, the inner structure,
      also the processes. The fact that the colors in the flower evolved in order to attract insects
      to pollinate it is interesting; it means that insects can see the color. It adds a question:
      does this aesthetic sense also exist in the lower forms? Why is it aesthetic? All kinds of
      interesting questions which the science knowledge only adds to the excitement, the mystery and
      the awe of a flower. It only adds. I don't understand how it subtracts.
    RAW

    # squish the string (stolen from Rails ActiveSupport)
    original_string = raw_string.
      gsub(/\A[[:space:]]+/, '').
      gsub(/[[:space:]]+\z/, '').
      gsub(/[[:space:]]+/, ' ')

    encoded_string = DcrugDna::Encoder.new(original_string).encode
    decoded_string = DcrugDna::Decoder.new(encoded_string).decode

    expect(decoded_string).to eq(original_string)
  end
end
