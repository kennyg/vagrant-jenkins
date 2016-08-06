
node default {

  class { 'firewall': }
  ->
  class { 'jenkins': 
    configure_firewall => true,
    config_hash => {
      'JENKINS_JAVA_OPTIONS' => { 'value' => '-Djava.awt.headless=true -Xmx512m -Djenkins.install.runSetupWizard=false' }
    },
  }

  jenkins::plugin {
    'ansicolor': 
      version => '0.3.1';
  }

}

