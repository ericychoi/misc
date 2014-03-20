# Some useful aliases.
alias texclean='rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky'
alias clean='echo -n "Really clean this directory?";
	read yorn;
	if test "$yorn" = "y"; then
	   rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	   echo "Cleaned.";
	else
	   echo "Not cleaned.";
	fi'

alias ls='ls --color=auto'
alias h='history'
alias j="jobs -l"
alias la="ls -al"
alias ll="ls -l"
#alias ls="ls -F"
alias pu="pushd"
alias po="popd"
#alias e="emacs -nw"
alias se="sudo emacs -nw"
alias ap="sudo /etc/init.d/apache2 restart"
alias l="less"
alias m="more"
alias expem="export EDITOR=emacs"
#alias emacs="emacs -nw"
alias ack="ack-grep"
alias mtail="multitail -cS error_log -l 'ssh app tail -f /app/local/logs/error_log'"
alias clipfix="sudo /etc/init.d/vboxadd start"

#
# Csh compatability:
#
alias unsetenv=unset
function setenv () {
  export $1="$2"
}

# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
add-alias ()
{
   local name=$1 value="$2"
   echo alias $name=\'$value\' >>~/.bash_aliases
   eval alias $name=\'$value\'
   alias $name
}

# "repeat" command.  Like:
#
#	repeat 10 echo foo
repeat ()
{ 
    local count="$1" i;
    shift;
    for i in $(seq 1 "$count");
    do
        eval "$@";
    done
}

# Subfunction needed by `repeat'.
seq ()
{ 
    local lower upper output;
    lower=$1 upper=$2;

    if [ $lower -ge $upper ]; then return; fi
    while [ $lower -le $upper ];
    do
	echo -n "$lower "
        lower=$(($lower + 1))
    done
    echo "$lower"
}
