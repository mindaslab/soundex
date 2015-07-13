require 'soundex'

describe 'soundex' do
  describe 'remove_neighbors' do
    let (:soundex) {Soundex.new ''}

    {
      'pf' => 'p',
      'bb' => 'b',
      'bhf' => 'b',
      'dwt' => 'd',
      'll' => 'l',
      'lhl' => 'l',
      'mn' => 'm',
      'rwr' => 'r'
    }.each do |original, expected_output|
      it "removes the neighbors for #{original}" do
        expect(soundex.remove_neighbors original).to eq expected_output
      end
    end
  end

  describe 'strip vowels' do
    it 'removes all vowels' do
      soundex = Soundex.new ''

      expect(soundex.strip_vowels 'baeiouyhwb').to eq 'bb'
    end
  end

  describe 'to_numbers' do
    let (:soundex) {Soundex.new ''}

    {
      'bfpv' => '1111',
      'cgjkqsxz' => '22222222',
      'dt' => '33',
      'l' => '4',
      'mn' => '55',
      'r' => '6'
    }.each do |original, expected_output|
      it "converts #{original} to #{expected_output}" do
        expect(soundex.to_numbers original).to eq expected_output
      end
    end
  end

  describe 'process' do
    {
      'Robert' => 'R163',
      'Rupert' => 'R163',
      'Rubin' => 'R150',
      'Ashcraft' => 'A261',
      'Ashcroft' => 'A261',
      'Tymczak' => 'T522',
      'Pfister' => 'P236',
      'Bob' => 'B100'
    }.each do |original, expected_output|
      fit "it processes #{original} to #{expected_output}" do
        soundex = Soundex.new original
        expect(soundex.soundex).to eq expected_output
        expect(soundex.original).to eq original
      end
    end
  end

  describe 'initialize' do
    it 'skips processing if the input has no content' do
      expect_any_instance_of(Soundex).not_to receive(:process)
      Soundex.new ''
    end

    it 'skips processing if the input is nil' do
      expect_any_instance_of(Soundex).not_to receive(:process)
      Soundex.new nil
    end

    it 'processes if input has content' do
      expect_any_instance_of(Soundex).to receive(:process)
      Soundex.new 'bob'
    end
  end

  describe 'to_s' do
    it 'overrides to_s for easy use' do
      expect("#{Soundex.new 'bob'}").to eq 'b100'
    end
  end
end