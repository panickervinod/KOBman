## Todo List for Test Script Install Functionality

- [ ] Init Stage<br>
    - [ ] Initialization of KOBman environment variables.<br>
    - [ ] Set  **Set path_to_kob_env_tests**, **kob_environment_under_test**, **kob_test_namespace**.<br>
    - [ ] Check **$kob** command<br>
    - [ ] Load function to **test kob_environment_under_test**.<br>
- [ ] Execute Stage
    - [ ] **kob install --environment ${ kob_environment_under_test } --namespace ${ kob_test_namespace }**. ---> output file.
    - [ ] Check output log file
- [ ] Verify/Validate Stage
    - [ ] Call function **__test_kobman_$(environment_under_name)_ validate_install( optional arguments)** --> output file
    - [ ] Check Output log file
- [ ] Cleanup Stage
    - [ ]  Unset environment variables , delete any temp file written by the test 
    - [ ]  Remove function **__test_kobman_$(environment_under_name)_ validate_install()**. 

 
  
