# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apt-get update
apt-get -qq install python3.7 -y 

pip3 install tox==3.14.5 wheel
pip3 install -r requirements.txt
tox
test_result=$?
if [[ "${test_result}" != 0 ]]; then
  echo "tests failed"
  exit 1
fi
python3 setup.py bdist_wheel
pip3 install ./dist/*.whl 
