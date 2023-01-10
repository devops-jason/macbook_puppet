class dbirepos {

	file {
		"/Users/${::whoami}/DevOps":
			ensure  => present,
			owner   => $::whoami,
			group   => 'admin',
			mode    => '0750';
	}

	vcsrepo {
	"/Users/${::whoami}/DevOps/dbi-phoenix-terraform":
    	ensure   => present,
    	provider => git,
    	user     => $::whoami,
    	owner    => $::whoami,
    	group    => 'admin',
    	source   => 'git@bitbucket.org:dbi_general/dbi-phoenix-terraform.git',
  		require  => File["/Users/${::whoami}/DevOps"];

  	"/Users/${::whoami}/DevOps/dbi-phoenix-infra":
    	ensure   => present,
    	provider => git,
    	user     => $::whoami,
    	owner    => $::whoami,
    	group    => 'admin',
    	source   => 'git@bitbucket.org:dbi_general/dbi-phoenix-infra.git',
  		require  => File["/Users/${::whoami}/DevOps"];
  }

}