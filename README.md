# Introduction
This container will create a bootable ISO image with CoreOS ignition files which can be selected during boot time to customize the fresh CoreOS installed on the hard disk.

# Usage
- Pull the docker-compose.yml
- Add a directory "profiles"
- Place the Linux config files (YAML) into the directory "profiles" (be cautious with special characters!)
- Run the container by "docker-compose run main"
- Find the created ISO image underneath the directory "tmp_iso" with the name "coreos-setup.iso"

# Remarks
- The YAML files will be automagically converted by the config transpiler tool to JSON ignition files.



