class apache2_php ($mysql_deps = true) {

    include apache2

    if ($operatingsystem == "Gentoo") {
        $package = 'dev-lang/php'
        $mysql_package = ""
    } else {
        $package = "libapache2-mod-php5"
        $mysql_package = "php5-mysql"
        $module = "php5"
    }

    if !defined("$package") {
        package { "$package":
            ensure => 'latest'
        }
    }

    if ($mysql_package != "" and !defined("$mysql_package") and $mysql_deps == true) {
        package { "$mysql_package":
            ensure => 'latest'
        }
    }

    apache2::module { "apache2_php_module":
        modname => "$module",
    }

}
