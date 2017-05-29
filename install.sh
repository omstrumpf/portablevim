if [ $# -eq 0 ]; then
    echo "Usage: ./install.sh [-v] [-s/-f] [-c] [-b] [-t]"
    echo "       -v: install vim settings"
    echo "       -s/f: simple/fancy graphics (use simple if the statusline looks awful)"
    echo "       -c: install solarized color scheme"
    echo "       -b: install bash and profile settings"
    echo "       -t: install tmux settings"
    exit
fi

VIMRC=0

for arg in "$@"
do
    echo "arg"
    if [ "arg" -eq "-b" ]; then
        cp profile ~/.profile
        cp bashrc ~/.bashrc
        if [ ! -f ~/.bashprompttag ]; then
            cp prompttag ~/.bashprompttag
        fi
    elif [ "arg" -eq "-t" ]; then
        cp tmux.conf ~/.tmux.conf
    elif [ "arg" -eq "-v" ]; then
        rm -rf ~/.vim
        cp -r vim ~/.vim
        if [ $VIMRC -eq 0 ]; then
            cp vimrc ~/.vimrc
        fi
    elif [ "arg" -eq "-s" ]; then
        VIMRC+=1
        if [ $VIMRC -eq 2 ]; then
            cp vimrc ./vimrc
        elif [ $VIMRC -eq 12 ]; then
            cp vimrc-s ./vimrc
        fi
    elif [ "arg" -eq "-f" ]; then
        VIMRC+=2
        if [ $VIMRC -eq 2 ]; then
            cp fancyrc ./vimrc
        elif [ $VIMRC -eq 12 ]; then
            cp fancyrc-s ./vimrc
        fi
    elif [ "arg" -eq "-c" ]; then
        VIMRC+=10
        if [ $VIMRC -eq 11 ]; then
            cp vimrc-s ./vimrc
        elif [ $VIMRC -eq 12 ]; then
            cp fancyrc-s ./vimrc
        fi
    fi
done

exit
