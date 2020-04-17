#!/bin/bash

function kob_init {

  #TODO:- Initialization of KOBman environment variables.(e.g- KOB_DIR ).
  #TODO:- Set path_to_kob_env_tests(e.g - src/tests/envs), kob_environment_under_test, kob_test_namespace.
  #TODO:- Check $kob command (e.g - $kob --version or $kob)
  #TODO:- Load function to test kob_environment_under_test(i.e source $path_to_kob_env_tests/test-$(kob_environment_under_test).sh).
  
}

function kob_execute {

  #TODO:- kob install --environment ${ kob_environment_under_test } --namespace ${ kob_test_namespace }. ---> output file.
  #TODO:- Check output log file.
  
}

function kob_verify {   

   #TODO:- Call function __test_kobman_$(environment_under_name)_ validate_install( optional arguments) --> output file.
   #TODO:- Check Output log file.
   
}

function kob_cleanup {

    #TODO:- Unset environment variables , delete any temp file written by the test.
    #TODO:- Remove function __test_kobman_$(environment_under_name)_ validate_install().
    
}

