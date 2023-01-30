#!/bin/bash


echo "Starting ubuntu server setup"
echo """
update_mode=up
debug_mode=d
interactive_mode=i
"""

update_mode="off"
debug_mode="off"
interactive_mode="off"

for v in $@
    do
        if [ "i" = $v ]
            then
                interactive_mode="on"
        fi
        
        if [ "d" = $v ]
            then
                debug_mode="on"
        fi
        if [ "up" = $v ]
            then
                update_mode="on"
                update
        fi
    done

echo $interactive_mode
echo $debug_mode
echo $@

update() {
    apt update && apt dist-upgrade -y
    apt install curl git -y
    
}

checking () {
    which_x=$(which $1)
    key_x=$1
    file_x=$2
    if [ $which_x ]
        then
            echo '{"command":"'$key_x'","path":"'$which_x'"},' >> $file_x
        else

            echo '{"command":"'$key_x'","path":""},' >> $file_x
    fi
}

log_compgen() {
    file_x=$1
    option_x=$2
    echo '[{"date_timestemp": "'$(date)'", "compgen_option":"'$option_x'","file_path":"'$file_x'"},' > $file_x
    # Go through all available commands, aliases etc..
    for value in $(compgen $2)
    do
        checking $value $file_x
    done
    # Remove last "comma" from log because of JSON format
    sed -i '$ s/.$//' $file_x
    echo ']' >> $file_x
    cat $file_x
}

LOGGING_FOLDER='./logging/'
LOGGING_FOLDER_COMPGEN=$LOGGING_FOLDER'/compgen/'

if [ ! -d "$LOGGING_FOLDER" ];
    then
        mkdir $LOGGING_FOLDER
        echo "$LOGGING_FOLDER created." 
fi

if [ ! -d "$LOGGING_FOLDER_COMPGEN" ];
    then
        mkdir $LOGGING_FOLDER_COMPGEN
        echo "$LOGGING_FOLDER_COMPGEN created." 
fi

if [ $debug_mode = "on" ]
    then
        log_compgen $LOGGING_FOLDER_COMPGEN'commands.json' '-c'
        log_compgen $LOGGING_FOLDER_COMPGEN'aliases.json' '-a'
        log_compgen $LOGGING_FOLDER_COMPGEN'built_in.json' '-b'
        log_compgen $LOGGING_FOLDER_COMPGEN'keywords.json' '-k'
        log_compgen $LOGGING_FOLDER_COMPGEN'functions.json' '-A function'
        # log_compgen $LOGGING_FOLDER_COMPGEN'compgen_check.json' '-A function -abck'
fi

run_file=$LOGGING_FOLDER_COMPGEN'run.sh'
if [ ! -d "$run_file" ]
    then
        touch $run_file
        echo """
        #!/bin/bash
        
        bash ./setupUbuntuServer.sh d
        """ >> $run_file
fi

# Setup task folder
TASK_FOLDER='./tasks/'
TASK_FOLDER_COMPGEN=$TASK_FOLDER'/setup/'

if [ ! -d "$TASK_FOLDER" ];
    then
        mkdir $TASK_FOLDER
        echo "$TASK_FOLDER created." 
fi

if [ ! -d "$TASK_FOLDER_COMPGEN" ];
    then
        mkdir $TASK_FOLDER_COMPGEN
        echo "$TASK_FOLDER_COMPGEN created." 
fi

# Setup Python if not exists
python_path=$(which python)

install_python() {
    if [ $1 = "t"]
        then
            echo "Check Python Setup..."
            echo $(which python)
            echo $(which python3)
        else
            apt update && apt install python3 -y
    fi
}

check_python() {
    if [ ! $python_path ]
        then
            if [ $(which python3) ]
                then
                    python_path=$(which python3)
                    echo "$python_path"
                else
                    install_python $1
                    check_python t
            fi
    fi

}

check_python


# get resources
spec_file=$TASK_FOLDER_COMPGEN'/specification.sh'
groupeffect_file='groupeffect.py'
github_resource="https://github.com/Groupeffect/resources/blob/main/framework/utils/"$groupeffect_file
check_software() {

    if [ ! -f "$spec_file" ]
        then
            touch $spec_file
            echo """#!/bin/bash
python=$python_path
# get utils from github
curl $github_resource -O
bash $groupeffect_file

            """ > $spec_file
    fi

}

check_software
bash $spec_file

