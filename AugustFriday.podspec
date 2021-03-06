#
#  Be sure to run `pod spec lint AugustFriday.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#



# PodUtility
module PodUtility

	def self.mapSwiftFiles(path, depth)
		extension = '/*.swift'
	  	source_files = mapFiles(path, depth, extension)
		source_files

	end

	def self.mapSBFiles(path, depth)
		extension = '/*.{storyboard,xib}'
	  	source_files = mapFiles(path, depth, extension)
		source_files

	end

	def self.mapResourceFiles(path, depth)
		extension = '/*.{storyboard,xib,otf,xcassets}'
	  	source_files = mapFiles(path, depth, extension)
		source_files

	end

	def self.mapFiles(path, depth, extension)
		running = 0
		key_lookup = '/**'
		key_current = ""
		source_files = Array.new
		loop do 
		  if running > 0 
		  	key_current += key_lookup
		  end 
		  str_next = path + key_current + extension
		  source_files << str_next
		  running += 1
		  break if running > depth

		end 
		source_files

	end

end



Pod::Spec.new do |s|



# Profile
s.name = 'AugustFriday'
s.version = '0.1.0'
s.license = 'MIT'
s.summary = 'Hello World'
s.homepage = 'https://github.com/ssankosik/AugustFriday'
# s.social_media_url = 'http://twitter.com/AugustFriday'
s.authors = { 'AugustFriday Software Foundation' => 'aimangtub.mond@gmail.com' }



# Setting
s.source = { :git => 'https://github.com/ssankosik/AugustFriday.git', :tag => s.version }
s.ios.deployment_target = '10.0'
s.platform = :ios, '10.0'
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
s.default_subspec = 'Core'



# Source
# Warning - beware of using the quote
str_source = 'Source'

# AGClasses
str_agc = "#{str_source}/AGClasses"
str_agc_main = "#{str_agc}/Main"
str_agc_uikit = "#{str_agc}/UIKit"
str_agc_foundation = "#{str_agc}/Foundation"

# Extensions
str_ext = "#{str_source}/Extensions"
str_ext_uikit = "#{str_ext}/UIKit"
str_ext_foundation = "#{str_ext}/Foundation"



# Core
s.subspec 'Core' do |c|
	c.frameworks = 'UIKit'
	c.source_files = PodUtility.mapSwiftFiles(str_source, 0)
	c.exclude_files = "Source/Exclude"
	# PodUtility.mapResourceFiles(str_source, 0) may crash app
	c.resource_bundle = {
		'AugustFriday' => PodUtility.mapResourceFiles(str_source, 0)
	}
	c.requires_arc = true
	c.dependency 'NVActivityIndicatorView', '~> 4.0.0'



	# AGClasses
	c.subspec 'AGClasses' do |agc|
		agc.source_files = PodUtility.mapSwiftFiles(str_agc, 0)

		# Main
		agc.subspec 'Main' do |m|
			m.source_files = PodUtility.mapSwiftFiles(str_agc_main, 2)

		end

		# UIKit
		agc.subspec 'UIKit' do |ui|
			ui.source_files = PodUtility.mapSwiftFiles(str_agc_uikit, 2)
			c.resource_bundle = {
				'AugustFriday' => PodUtility.mapSBFiles(str_agc_uikit, 2)
			}

		end

		# Foundation
		agc.subspec 'Foundation' do |fd|
			fd.source_files = PodUtility.mapSwiftFiles(str_agc_foundation, 2)

		end

	end



	# Extensions
	c.subspec 'Extensions' do |ext|
		ext.source_files = PodUtility.mapSwiftFiles(str_ext, 0)

		# UIKit
		ext.subspec 'UIKit' do |ui|
			ui.source_files = PodUtility.mapSwiftFiles(str_ext_uikit, 2)

		end

		# Foundation
		ext.subspec 'Foundation' do |fd|
			fd.source_files = PodUtility.mapSwiftFiles(str_ext_foundation, 2)

		end

	end

end

end
