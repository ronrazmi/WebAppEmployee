class EmployeesController < ApplicationController

	def index
		@employees = Employee.all		
		render 'index.html.erb'
	end

	def show
		@employee = Employee.find(params[:id])

		render 'show.html.erb'
	end

	

	def new
		render 'new.html.erb'

	end


	def create
		@employee = Employee.create(first_name: params["form_first_name"], last_name: params["form_last_name"],title: params["form_title"], phone_number: params["form_phone_number"], team: params["form_team"], university: params["form_university"])
        redirect_to "/employees/#{@employee["id"]}"
	end

	def edit

		@employee = Emplyee.find(params[:id])
		@employee = Unirest.get("http://localhost:3000/api/v1/employees/#{params[:id]}").body
		render 'edit.html.erb'
	end

	def update

		@employee = Employee.find(params[:id])
		@employee.update(first_name: params[:form_first_name])
		
           redirect_to "/employees/#{@employee.id}"

	end

	def destroy
		
		@employee = Employee.find(params[:id])
		redirect_to '/employees'
	end

end