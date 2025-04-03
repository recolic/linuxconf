set -e
tar -cvzf /tmp/test.tgz examples
netpush /tmp/test.tgz linuxconf

echo "
TEST >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
rm /mnt/fsdisk/svm/vm/archtest/ -r
pgkill archtest

ssh -p 30476  r@hms.r

sudo su

cd /
curl https://recolic.cc/tmp/test.tgz | tar xvzf -
cd examples/archlinux-gnome/
./linuxconf.wrapper register masterconf.sh
"
