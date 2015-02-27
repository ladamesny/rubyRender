require 'erb'
require 'csv'

class CurriculumMaker

	include ERB::Util

	attr_reader :course_data, :template

	def initialize
		@course_data = []
		@template = 'Template missing'
	end

	def add_template(filepath)
		@template= File.read(filepath)
	end

	def add_course_data(filepath)
		courses = CSV.read(filepath)
		header = courses.shift
		@course_data << {header: header, courses: courses}
	end

	def render
		ERB.new(@template).result(binding)
	end
end