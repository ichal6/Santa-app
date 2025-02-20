require "test_helper"

class FriendshipTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @friend = users(:two)
    @status = status_friendships(:waiting)
    @friendship = friendships(:one)
    @wish_lists = wish_lists(:one)
  end

  test "should be valid" do
    assert @friendship.valid?
  end

  test "should require a user" do
    @friendship.user = nil
    assert_not @friendship.valid?
  end

  test "should require a friend" do
    @friendship.friend = nil
    assert_not @friendship.valid?
  end

  test "should require a status" do
    # act
    @friendship.status = nil
    # assert
    assert_not @friendship.valid?
  end

  test "should belong to a user" do
    assert_equal @user, @friendship.user
  end

  test "should belong to a friend" do
    assert_equal @friend, @friendship.friend
  end

  test "should belong to a status" do
    assert_equal @status, @friendship.status
  end

  test "should have many shared wish lists" do
    assert_respond_to @friendship, :shared_wish_lists
  end

  test "should destroy associated shared wish lists when destroyed" do
    # arrange
    @friendship.save

    # act
    @friendship.shared_wish_lists = shared_wish_lists(:one)
    # assert
    assert_difference("SharedWishList.count", -1) do
      @friendship.destroy
    end
  end
end
