define-command \
compile -docstring \
"Run compilation command" \
%{
    evaluate-commands %sh{
        output=/tmp/kak-compile
        outputLast=/tmp/kak-compile-last

        # create a script and save it in /tmp
        echo "#!/bin/sh
        defaultCommand=\"\$(cat $outputLast)\"
        read -p \"Compile [\$defaultCommand]: \" command
        command=\${command:-\$defaultCommand}
        echo \$command > $outputLast
        sh $outputLast
        read -p 'press enter to continue'" \
            > /tmp/kak-compile

        chmod +x $output
    }

    # run the script
    terminal /tmp/kak-compile
}

define-command \
compile-quick -docstring \
"Run compilation command without prompting" \
%{
    evaluate-commands %sh{
        output=/tmp/kak-compile
        outputLast=/tmp/kak-compile-last

        # create a script and save it in /tmp
        echo "#!/bin/sh
        defaultCommand=\"\$(cat $outputLast)\"
        if [[ -z \"\$defaultCommand\" ]]; then
            read -p \"Compile [\$defaultCommand]: \" command
            command=\${command:-\$defaultCommand}
            echo \$command > $outputLast
        else
            command=\$defaultCommand
        fi
       sh $outputLast
        " \
            > $output

        chmod +x $output
    }

    # run the script
    terminal /tmp/kak-compile
}
