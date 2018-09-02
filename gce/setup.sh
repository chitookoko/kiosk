# gcloud auth login
# gcloud config set project kiosk-api
# gcloud compute instances list

NAME=kiosk-3

gcloud compute --project=kiosk-api \
	instances create $NAME \
	--zone=us-west1-a \
	--machine-type=n1-standard-1 \
	--subnet=default \
	--network-tier=PREMIUM \
	--metadata-from-file startup-script=gce-startup.sh \
	--maintenance-policy=MIGRATE \
	--service-account=839937343109-compute@developer.gserviceaccount.com \
	--scopes=https://www.googleapis.com/auth/cloud-platform \
	--image=ubuntu-1604-lts-drawfork-v20180810 \
	--image-project=eip-images \
	--boot-disk-size=10GB \
	--boot-disk-type=pd-standard
	
#--machine-type=f1-micro \
	
# gcloud compute instances delete kiosk-2
	
