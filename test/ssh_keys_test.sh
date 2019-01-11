#! /bin/sh
. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh


afterSetUp()
{
    cp  ${BUILDPACK_HOME}/test/id_rsa ${ENV_DIR}/GIT_DEPLOY_KEY
}

testSSHKeysDroppedOnDisk()
{
  compile
  assertCapturedSuccess
  assertFileMD5 "156b541999de8da0623cf24ac82fd74f" "$HOME/.ssh/private_key"
  assertTrue "[ -e $HOME/.ssh/known_hosts ]"
}
