class Employee 

attr_accessor :id, :first_name, :last_name, :full_name, :title, :phone, :team, :university

def initialize(input_hash)
	@id = input_hash[:id]
	@first_name = input_hash[:first_name]
	@last_name = input_hash[:last_name]
	@full_name = input_hash[:full_name]
	@title = input_hash[:title]
	@phone = input_hash[:phone]
	@team = input_hash[:team]
	@university = input_hash[:university]
end

def self.find(input_id)
	employee = Unirest.get("http://localhost:3000/api/v1/employees/#{input_id}", headers:{ "Accept" => "application/json", "Authorization" => "Token token=iamin", "x-user-Email" => "ron@acupera.com"}).body
	Employee.new(id: employee['id'], first_name: employee['first_name'], last_name: employee['last_name'], full_name: employee['full_name'], title: employee['title'], phone: employee['phone'], team: employee['team'], university: employee['university'])
end

def self.all
	@employees_hashes = Unirest.get("http://localhost:3000/api/v1/employees", headers:{ "Accept" => "application/json", "Authorization" => "Token token=iamin", "x-user-Email" => "ron@acupera.com"}).body
	employees = []
		@employees_hashes.each do |employee_hash|
			 @employees << Employee.new(id: employee_hash['id'], first_name: employee_hash['first_name'], last_name: employee_hash['last_name'], full_name: employee_hash['full_name'], title: employee_hash['title'], phone: employee_hash['phone'], team: employee_hash['team'], university: employee_hash['university'])
		end
		return employees
end

def self.create(input_hash)
	employee_hash = Unirest.post("http://localhost:3000/api/v1/employees", 
                        headers:{"Accept" => "application/json", "Authorization" => "Token token=iamin", "x-user-Email" => "ron@acupera.com"}).body 
                        parameters:{ :first_name => input_hash[:first_name], :last_name => input_hash[:last_name], :title => input_hash[:title], :phone_number => input_hash[:phone_number], :team => input_hash[:team], :university => input_hash[:university]}).body
	return Employee.new(employee_hash)
end

def self.edit

def self.update(input_hash)
	employee = Unirest.patch("http://localhost:3000/api/v1/employees/#{params["id"]}", 
                        headers:{ "Accept" => "application/json" }, 
                        parameters:{ :first_name => params[:form_first_name] ||@employee.first_name, :last_name => params[:form_last_name] ||@employee.last_name, :title => params[:form_title] ||@employee.title, :phone_number => params[:form_phone_number] ||@employee.phone_number, :team => params[:form_team] ||@employee.team, :university => params[:form_university] ||@employee.university}).body

end

def destroy

	@employee = Unirest.delete("http://localhost:3000/api/v1/employees/#{id}").body

end