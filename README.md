# mongod

TODO: Enter the cookbook description here.

This chef cookbook details my attempts to provision a machine with chef. and then create an image for docker using the tool packer. Therefore this cookbook could allow a dev to spin up an environment with and then seamlessly crate an image of the cookbook if they changed anything.

NOTE: Remember, packer will use the berks-cookbooks cookbook and not the main root one just outside the folder. So any changes must be applied to both. Also be careful to check the type of chef provisioner each tool is using, eg the kitchen.yml runs chef_zero while packer runs chef_solo,
so when creating an image you must delete the policy.lock.file

This is the second image I have made, the first being the app using the Dockerfile and provision.sh during the build and this one using chef and packer but NO Dockerfile :)

````
==> Builds finished. The artifacts of successful builds are:
--> docker: Imported Docker image: sha256:cb132771c3ca5ce204e19686f687014531c2a2e3200704135f20c651505e9c90

Builds finished. The artifacts of successful builds are:
--> docker: Imported Docker image: sha256:0fe2913c06b292aeef92b273f78060a8992ccce28171cdc67e1f034e2b7d29ac

successful build that can be accessed on dockerhub after adding post-processing in the packer.

==> Builds finished. The artifacts of successful builds are:
--> docker: Imported Docker image: sha256:90edcb8b076ad8f289d6d52118dcb40cb6d2fd42e89b5ce5c3041e479103ec1e
--> docker: Imported Docker image: abioluwade/mongodb:0.1

````
