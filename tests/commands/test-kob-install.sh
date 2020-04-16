#!/bin/bash

function kob_init {

  TODO: - [ ] Initialization of KOBman environment variables.(e.g- **KOB_DIR** )<br>
  TODO: - [ ] Set  **Set path_to_kob_env_tests**(e.g - src/tests/envs), **kob_environment_under_test**, **kob_test_namespace**.<br>
  TODO: - [ ] Check **$kob** command (e.g - $kob --version or $kob)<br>
  TODO: - [ ] Load function to test **kob_environment_under_test**(i.e source $path_to_kob_env_tests/test-$(kob_environment_under_test).sh).<br>
  
}

function kob_execute {

  TODO: - [ ] **kob install --environment ${ kob_environment_under_test } --namespace ${ kob_test_namespace }**. ---> output file.<br>
  TODO: - [ ] Check output log file<br>
  
}

function kob_verify {

   TODO: - [ ] Call function **__test_kobman_$(environment_under_name)_ validate_install( optional arguments)** --> output file<br>
   TODO: - [ ] Check Output log file<br>
   
}

function kob_cleanup {

    TODO: - [ ] Unset environment variables , delete any temp file written by the test<br>
    TODO: - [ ] Remove function **__test_kobman_$(environment_under_name)_ validate_install()**.<br>
    
}

