
class { 'homebrew':
	user                       => $::whoami,
	command_line_tools_package => 'Command_Line_Tools_for_Xcode_13.2.dmg',
	command_line_tools_source  => 'https://download.developer.apple.com/Developer_Tools/Command_Line_Tools_for_Xcode_13.2/Command_Line_Tools_for_Xcode_13.2.dmg';
}

package {
	'virtualbox':
		ensure   => present,
		source   => 'https://download.virtualbox.org/virtualbox/6.1.32/VirtualBox-6.1.32-149290-OSX.dmg',
		provider => pkgdmg;

	'sublimt_text_4':
		ensure   => present,
		source   => 'https://download.sublimetext.com/Sublime%20Text%20Build%203211.dmg',
		provider => appdmg;

	'vagrant':
		ensure   => present,
		source   => 'https://releases.hashicorp.com/vagrant/2.2.19/vagrant_2.2.19_x86_64.dmg',
		provider => pkgdmg;

	'docker_desktop':
		ensure   => present,
		source   => 'https://desktop.docker.com/mac/main/amd64/Docker.dmg',
		provider => appdmg;
}

package {
	'akamai':
		ensure   => present,
		provider => brew;

	'newrelic-cli':
		ensure   => present,
		provider => brew;

	'hashicorp/tap':
		ensure   => present,
		provider => tap;

	'hashicorp/tap/terraform':
		ensure   => present,
		provider => brew,
		require  => Package['hashicorp/tap'];

	'terragrunt':
		ensure   => present,
		provider => brew;

}

file {
	'/usr/local/bin/pip':
		ensure  => link,
		target  => '/usr/local/bin/pip3';

}

class { 'awscli':
		require => File['/usr/local/bin/pip'];
}

include profile
include rbenv
include dbirepos

