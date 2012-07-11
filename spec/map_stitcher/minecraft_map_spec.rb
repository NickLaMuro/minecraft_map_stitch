require 'spec_helper'

describe MinecraftMap do

  describe "#initialize" do
    before(:each) do
      NBTFile.stubs(:load).with("map data").returns(["", {'data' => ""}])
    end

    it "sets @map_data to ''" do
      minecraft_map = MinecraftMap.new("map data")
      minecraft_map.instance_variable_get(:@map_data).should == ""
    end
  end

  describe "#map_pixel_coord" do
    before(:each) do
      NBTFile.stubs(:load).with("map data").returns(["", {'data' => ""}])
      @mine_map = MinecraftMap.new("map data")
    end

    context "when given 129" do
      it "returns [1,1]" do
        @mine_map.map_pixel_coord(129).should == [1, 1]
      end
    end

    context "when given 510" do
      it "returns [126, 3]" do
        @mine_map.map_pixel_coord(510).should == [126, 3]
      end
    end
  end

  describe "#center" do
    before(:each) do
      data = {'colors' => '02439205', 'xCenter' => 40, 'zCenter' => 64}
      NBTFile.stubs(:load).with("map data").returns(["", {'data' => data}])
      @mine_map = MinecraftMap.new("map data")
    end

    it "returns [40, 64]" do
      @mine_map.center.should == [40, 64]
    end
  end

  describe "#rounded" do
    before(:each) do
      NBTFile.stubs(:load => ["", {'data' => ""}])
      @mine_map = MinecraftMap.new("")
    end

    context "when given 8" do
      it "returns 8" do
        @mine_map.rounded(8).should == 8
      end
    end

    context "when given 16" do
      it "returns 16" do
        @mine_map.rounded(16).should == 16
      end
    end
  end

  describe "#color" do
    before(:each) do
      NBTFile.stubs(:load => ["", {'data' => ""}])
      @mine_map = MinecraftMap.new("")
    end

    context "when given 3" do
      it "returns the chunky png color for '255,255,255'" do
        @mine_map.color(3).should == ChunkyPNG::Color.rgb(*[255, 255, 255])
      end
    end

    context "when given 99" do
      it "returns the chunky png color for '0,0,0'" do
        @mine_map.color(99).should == ChunkyPNG::Color.rgb(*[0, 0, 0])
      end
    end
  end
end
