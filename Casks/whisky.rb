cask "whisky" do
    version "pre-0.2.1"
    sha256 "64f1dc3b594b6f570232c2daea17c8828ffc7f721839d4179c977ce238eb903b"
  
    url "https://github.com/IsaacMarovitz/Whisky/releases/download/#{version}/Whisky.zip"
    name "Whisky"
    desc "Game Porting Toolkit + stuff"
    homepage "https://github.com/IsaacMarovitz/Whisky/"
  
    app "LaunchPadder.app"

    preflight do
        system_command '/usr/bin/unzip', args ['-d', staged_path, "#{staged_path}/{{zip_file}}"]
    end
    postflight do
        system_command '/bin/mv', args: ['-f', "#{appdir}/{{app_name}}", "#{appdir}/{{app_name}}.old"]
        system_command '/bin/cp', args: ['-R', "#{staged_path}/{{dmg_file}}", "#{appdir}/"]
    end
  end
  




