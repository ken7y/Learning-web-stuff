class PigLatinizer

  attr_accessor :converttext

  def initialize(converttext)
    @converttext = converttext.downcase
  end

  def pigLatin

    newsplit = converttext.split(%r{[aeiou]},2)
    firstvowel = converttext.match(/[aeiou]/)[0]
    firsttext = newsplit[0]
    secondtext = firstvowel + newsplit[1]
    finaltext = secondtext + firsttext+"way"
    finaltext
  end

end
