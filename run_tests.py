import os
import sys
import subprocess

sys.path.append(os.getcwd())
os.environ["BPP_CLS_PATH"] = os.getcwd()
test_env = os.environ.copy()


def runBPP(command):
    command = "/bin/bash bin/bpp %s" % command
    process = subprocess.Popen(command,
                               env=test_env,
                               shell=True,
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE,
                               universal_newlines=True)
    try:
        stdout, stderr = process.communicate(timeout=15)
    except subprocess.TimeoutExpired:
        process.kill()
        stdout, stderr = process.communicate()

    return stdout.strip(), stderr.strip(), process.returncode


def test_lower_to_upper():
    command = "tests/lower_to_upper.sh"
    out, err, rc = runBPP(command)
    want = "I'M LOWERCASE"
    if rc != 0 and err:
        assert err is None
    else:
        assert out == want


def test_upper_to_lower():
    command = "tests/upper_to_lower.sh"
    out, err, rc = runBPP(command)
    want = "i'm uppercase"
    if rc != 0 and err:
        assert err is None
    else:
        assert out == want


def test_formatting():
    command = "tests/formatting.sh"
    out, err, rc = runBPP(command)
    want = "I am Bash with Class and you can't teach that."
    if rc != 0 and err:
        assert err is None
    else:
        assert out == want
