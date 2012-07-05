class apache2_php ($package = "libapache2-mod-php5", $module = "php5", 
                   $mysql_deps = true, $mysql_package = "php5-mysql") {

    include apache2

    if !defined("$package") {
        package { "$package":
            ensure => 'latest'
        }
    }

    if (!defined("$mysql_package") and $mysql_deps == true) {
        package { "$mysql_package":
            ensure => 'latest'
        }
    }

    apache2::module { "apache2_php_module":
        modname => "$module",
    }

}
