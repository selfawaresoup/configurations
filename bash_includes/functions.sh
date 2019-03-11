# usage: lines 11 foo.txt     #get line 11
# or:    lines 5 14 foo.txt   #get lines 5-14
function lines {
    if [[ ! -z "$3" ]]; then
        sed -n "$1,$2p" "$3"
    else
        sed -n "$1p" "$2"
    fi
}

# usage: notify "foo is fooing"         # just a message
# or:    notify "foo" "foo is fooing"  # title and message
function notify {
    if [[ ! -z "$2" ]]; then
        local title="$1"
        local message="$2"
    else
        local title="Notification"
        local message="$1"
    fi

    if [[ $(which notify-send) ]]; then
        # ubuntu (gnome) version
        notify-send "$title" "$message"
    elif [[ $(which osascript) ]]; then
        # mac osx version
        local as_command="display notification \"$message\" with title \"$title\""
        osascript -e "$as_command"
    else
        # terminal fallback version
        echo "$title"
        echo
        echo "$message"
    fi
}

# usage: remind 5m "Tea is ready"
function remind {
    if [ ! -z "$2" ]; then
        sleep $1 && notify "Reminder" "$2" > /dev/null 2>&1 &
    else
        echo "Usage: remind 15m 'you gotta leave!'"
    fi
}

# removes all "dotfiles" from the specified directories recursively
function rmdotfiles {
    find $1 -type f -name ".*" -print0 | xargs -0 rm
}

function getLastThreeDirsOfPath {
    local dir=$(pwd)
    local lvl0=$(echo $dir | awk -F/ '{print $(NF-0)}')
    local lvl1=$(echo $dir | awk -F/ '{print $(NF-1)}')
    local lvl2=$(echo $dir | awk -F/ '{print $(NF-2)}')

    local out="$lvl0/"

    if [ ! -z $lvl1 ]; then
        out="$lvl1/$out"
    fi

    if [ ! -z $lvl2 ]; then
        out="$lvl2/$out"
    fi

    echo $out
}

# sets the terminal title to the current working directory (last three levels)
function set_terminal_title {
    local p=$(getLastThreeDirsOfPath)
    echo -ne "\033]0;$p\007"
}

# compiles the ssh config from smaller partial files in .ssh/config.d
function compile-ssh-config {
    cat ~/.ssh/config.d/* > ~/.ssh/config
}

# creates directory and changes into it
function mdir {
    mkdir -p $1 && cd $1;
}

# plays a stream of bytes (8bit samples) from STDIN at 8kHz
function 8bitplay {
  play -traw -r8000 -b8 -e unsigned-integer - -tcoreaudio
}

function video2gif {
    local FFMPEGTMPDIR=/tmp/ffmpeg/$1
    local PALLETEPATH=$FFMPEGTMPDIR/palette.png
    mkdir -p $FFMPEGTMPDIR
    ffmpeg -y -i $1 -vf fps=15,scale=320:-1:flags=lanczos,palettegen $PALLETEPATH
    ffmpeg -i $1 -i $PALLETEPATH -filter_complex "fps=15,scale=320:-1:flags=lanczos[x];[x][1:v]paletteuse" $2
    rm -rf $FFMPEGTMPDIR
}

function goprodump {
    local BASE_PATH=10.5.5.9:8080/videos/DCIM/100GOPRO/
    local TMP_DIR=.goprodump-tmp
    mkdir $TMP_DIR
    cd $TMP_DIR

    wget -r http://$BASE_PATH
    cd ..
    mv $TMP_DIR/$BASE_PATH/* .
    rm -rf $TMP_DIR index.html*
}

function cleardnsmacos {
  sudo killall -HUP mDNSResponder
  sudo killall mDNSResponderHelper
  sudo dscacheutil -flushcache
}

function unbork-my-wifi {
    echo "Turning it off ..."
    networksetup -setairportpower en0 off
    sleep 2
    echo "... and on again."
    networksetup -setairportpower en0 on
}

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

function clear-screenshots {
    echo "Screenshot files:"
    ls -1 ~/Desktop/Screen\ Shot\ *
    confirm "Sure?" && rm  ~/Desktop/Screen\ Shot\ *
}
