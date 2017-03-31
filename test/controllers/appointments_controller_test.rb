require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
    @user = User.create(id: 1, first_name: "Nick", last_name: "April", username: "nick", email: "nick@brandeis.edu", university_id: 1, password:"foobar", password_confirmation: "foobar")
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_appointment_url
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post appointments_url, params: { appointment: { confirmed: @appointment.confirmed, course_id: @appointment.course_id, end: @appointment.end, start: @appointment.start, student_id: @appointment.student_id, ta_id: @appointment.ta_id } }
    end

    assert_redirected_to appointment_url(Appointment.last)
  end

  test "should show appointment" do
    get appointment_url(@appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_appointment_url(@appointment)
    assert_response :success
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: { appointment: { confirmed: @appointment.confirmed, course_id: @appointment.course_id, end: @appointment.end, start: @appointment.start, student_id: @appointment.student_id, ta_id: @appointment.ta_id } }
    assert_redirected_to appointment_url(@appointment)
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete appointment_url(@appointment)
    end

    assert_redirected_to appointments_url
  end
end
