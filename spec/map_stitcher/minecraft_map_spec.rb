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
end
