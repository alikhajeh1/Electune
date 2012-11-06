require_relative '../../app/models/song'

describe Song, "#voting" do

  let(:song) { FactoryGirl.build(:song) }
  let(:user) { FactoryGirl.create(:user) }

  it "should have one vote when initialised" do
    song.votes.should eq(1)
  end

  it "should increase the votes when upvoted" do
    song = FactoryGirl.create(:song)
    song.upvote user
    song.votes.should eq(2)
  end

  it "should decreate the votes when vetoed" do
   song.votes = 2
   song.veto
   song.votes.should eq(1)
  end

  it "should allow duplicate name" do
    FactoryGirl.create(:song)
    duplicate = FactoryGirl.build(:song)
    duplicate.should be_valid
  end

  it "should not allow empty name" do
    song = FactoryGirl.build(:song, name: '')
    song.should_not be_valid
  end

  it "should not allow name to be blanks" do
    song = FactoryGirl.build(:song, name: '      ')
    song.should_not be_valid
  end

  it "should persist an upvote" do
    song = FactoryGirl.create(:song, name: 'upvote')
    song.upvote user
    from_database = Song.find_by_name 'upvote'
    from_database.votes.should eq(2)
  end

  it "should be able to upvote a song" do
    song = FactoryGirl.create(:song)
    song.votes.should eq(1)
    song.upvote user
    song.votes.should eq(2)
  end

  it "should be able to veto a song" do
    song = FactoryGirl.create(:song)
    song.votes.should eq(1)
    song.upvote user
    song.veto
    song.votes.should eq(1)
  end

  it { should respond_to(:upvoters) }
  it { should respond_to(:upvotements) }
end
