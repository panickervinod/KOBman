#!/bin/bash


function __kob_status {
file=($(find $KOBMAN_DIR/envs/ -type d -name "kobman-*" -print))
if [[ -z $file ]]; then
    
    __kobman_echo_white "Please install an environment first"
    return 1
fi
for f in "${file[@]}"; do
    n=${f##*-}
    if [[ ! -f $KOBMAN_DIR/envs/kobman-$n/current ]]; then
        __kobman_echo_white "No current file found for $n"
        return 1
    fi
done
__kobman_echo_white "Installed environments and their version"
__kobman_echo_white "---------------------------------------------"
for f in "${file[@]}"; do
    
    n=${f##*-}
    
    if [[ $n == $(cat $KOBMAN_DIR/var/current) ]]; then
        echo "~" $n $(ls $KOBMAN_DIR/envs/kobman-$n | grep -v $(cat $KOBMAN_DIR/envs/kobman-$n/current)) $(cat $KOBMAN_DIR/envs/kobman-$n/current)"*" > $KOBMAN_DIR/envs/kobman-$n/tmp.txt
        sed 's/current//g' $KOBMAN_DIR/envs/kobman-$n/tmp.txt
    else

        echo $n $(ls $KOBMAN_DIR/envs/kobman-$n | grep -v $(cat $KOBMAN_DIR/envs/kobman-$n/current)) $(cat $KOBMAN_DIR/envs/kobman-$n/current)"*" > $KOBMAN_DIR/envs/kobman-$n/tmp.txt
        sed 's/current//g' $KOBMAN_DIR/envs/kobman-$n/tmp.txt
    fi
    rm $KOBMAN_DIR/envs/kobman-$n/tmp.txt
    
done

unset n file f 

}