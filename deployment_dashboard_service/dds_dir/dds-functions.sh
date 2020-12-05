DDS_DIR=$HOME/dds_dir
DJANGO_PROJECT_PORT=8081
DJANGO_PROJECT_HOST=localhost
DJANGO_PROJECT_HOST=10.50.140.54
DJANGO_PROJECT_HOST=deploy-dashboard.mirage.percipient.ai
DJANGO_PROJECT=deploymentDashboard
DJANGO_APPS=(instanceInfo machineInfo)
DJANGO_APPS=(instanceInfo)

##############################################
[ ! -d $DDS_DIR ] && echo "== Creating $DDS_DIR #" && mkdir -p $DDS_DIR

dds_createPythonVenv () {
	echo
	# Deactivate the environment if it is already active
	deactivate 2> /dev/null
	echo "== Creating python virtual environment in $DDS_DIR"
	cd $DDS_DIR
	cat > requirements.txt <<!
django==3.0.3
!
	# Create and activate the environment. Install the required packages
	virtualenv .
	# python3 -m venv tutorial-env
	deactivate 2> /dev/null
	source ${DDS_DIR}/bin/activate
	pip3 install -r requirements.txt
	rehash
}

dds_createDjangoProjectAndApp () {
	echo
	cd $DDS_DIR
	echo "== Creating project:$DJANGO_PROJECT in $DDS_DIR"
	django-admin startproject $DJANGO_PROJECT
	echo

	cd $DJANGO_PROJECT
	for app in `echo $DJANGO_APPS`
	do
	    echo "== Creating Django App:$app in $DJANGO_PROJECT"
	    python manage.py startapp $app
	    echo "== Creating/Bootstrapping App:$app template directory"
	    echo "== Creating/Bootstrapping App:$app static directory"
	    
	done
	echo
}

dds_createsuperuser () {
	echo "== Create super user =="
        cd $DDS_DIR/$DJANGO_PROJECT/
        python manage.py createsuperuser --username system
        #python manage.py createsuperuser --username system --email musa@percipient.ai
}

dds_start () {
	echo "== Starting Django app =="
	dds_env
        cd $DDS_DIR/$DJANGO_PROJECT/
        python manage.py runserver ${DJANGO_PROJECT_HOST}:${DJANGO_PROJECT_PORT}
}


dds_settings () {
	echo "== Django settings =="
        cd $DDS_DIR/$DJANGO_PROJECT/
	python manage.py diffsettings
	#python manage.py diffsettings | egrep "STATIC_URL|STATIC_ROOT|BASE_DIR"
}

dds_env () {
	cd $DDS_DIR
	echo
	source ${DDS_DIR}/bin/activate
	#echo "== Django settings =="
	#python manage.py diffsettings | egrep "STATIC_URL|STATIC_ROOT|BASE_DIR"
}

dds_rmEnv () {
	echo "== Removing $DDS_DIR virtual environment =="
	deactivate 2> /dev/null
	cd
	rm -rf $DDS_DIR 2> /dev/null
}

dds_mm () {
	echo "== makemigrations =="
        cd $DDS_DIR/$DJANGO_PROJECT/
	python manage.py makemigrations
}

dds_sm () {
	echo "== showmigrations =="
        cd $DDS_DIR/$DJANGO_PROJECT/
	python manage.py showmigrations
}

dds_m () {
	echo "== migrate =="
        cd $DDS_DIR/$DJANGO_PROJECT/
	python manage.py migrate
}

f () {
	typeset -f $1
}

dw () {
	cd ~/work/dds
	source dds-functions.sh
}

