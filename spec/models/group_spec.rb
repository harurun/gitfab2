require "spec_helper"

describe Group do
  let(:user1){FactoryGirl.create :user}
  let(:user2){FactoryGirl.create :user}
  let(:group1){FactoryGirl.create :group, creator: user1}

  describe ".admins" do
    subject do
      group1.admins.map do |admin|
        group1.add_admin user2
        ms = admin.memberships.where(group_id: group1.id).first
        ms.admin?
      end.all?
    end
    it{should be true}
  end

  describe ".editors" do
    subject do
      group1.editors.map do |editor|
        group1.add_editor user2
        ms = editor.memberships.where(group_id: group1.id).first
        ms.editor?
      end.all?
    end
    it{should be true}
  end

  describe "on after create" do
    describe "#add_initial_member" do
      let(:user1){FactoryGirl.create :user}
      let(:new_group){FactoryGirl.create :group, creator: user1}
      before{new_group.save}
      subject{new_group.members}
      it{should eq [user1]}
    end
  end
end