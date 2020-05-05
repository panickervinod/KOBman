#!/bin/bash

function __test_kobman_dummyenv_validate_install {

        if  echo $1 | grep "dummyenv" 
        then
                echo "Installation validated"
        else
                echo "Installation failed"
        fi

}
