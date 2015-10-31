describe Vote do
  describe "validations" do

  	before do     
      2.times { @vote.create(value: 1) }
      3.times { @vote.create(value: -1) }
      2.times { @vote.create(value: 3) }
    end
    
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect ( @vote.value ).to eq(-1)
      end

      it "only allows -1 or 1 as values" do
        expect ( @vote.value ).to eq(1)
      end
    end
  end
end