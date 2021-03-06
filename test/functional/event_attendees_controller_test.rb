require 'test_helper'

class EventAttendeesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_attendees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_attendee" do
    assert_difference('EventAttendee.count') do
      post :create, :event_attendee => { }
    end

    assert_redirected_to event_attendee_path(assigns(:event_attendee))
  end

  test "should show event_attendee" do
    get :show, :id => event_attendees(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => event_attendees(:one).to_param
    assert_response :success
  end

  test "should update event_attendee" do
    put :update, :id => event_attendees(:one).to_param, :event_attendee => { }
    assert_redirected_to event_attendee_path(assigns(:event_attendee))
  end

  test "should destroy event_attendee" do
    assert_difference('EventAttendee.count', -1) do
      delete :destroy, :id => event_attendees(:one).to_param
    end

    assert_redirected_to event_attendees_path
  end
end
