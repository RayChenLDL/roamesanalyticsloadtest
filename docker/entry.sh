#!/usr/bin/env bash

echo "*************Running entry.sh file**********"
cd code/
pwd
ls

echo "Starting JMeter tests"
#Command
cd ../bin

sh jmeter -n -t /opt/apache-jmeter-5.4.1/code/scripts/${JMETER_TEST_PLAN}.jmx -l /opt/apache-jmeter-5.4.1/result/test_output.jtl -Jjmeterengine.force.system.exit=true -Jjmeter.save.saveservice.output_format=xml -Jenv=${TESTENV} -JEQ_VUs=${EQ_VUs} -JENW_VUs=${ENW_VUs} -JGP_VUs=${GP_VUs} -JWPD_VUs=${WPD_VUs} -JPSEG_VUs=${PSEG_VUs} -JMEC_VUs=${MEC_VUs} -JEntergy_VUs=${Entergy_VUs} -JTasNetworks_VUs=${TasNetworks_VUs} -JWELNetworks_VUs=${WELNetworks_VUs} -JDuration=${Duration}

echo "********entry.sh file RAN SUCCESSFULLY*******"