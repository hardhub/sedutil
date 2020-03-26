echo
echo 'Building the PBA program'
cd ./LinuxPBA
rm -rf dist
make CONF=Release
make CONF=Release_x86_64
make CONF=Debug
make CONF=Debug_x86_64
cd ../images

echo
echo 'Building sedutil-cli'
cd ../linux/CLI
rm -rf dist
make CONF=Release_i686
make CONF=Release_x86_64
make CONF=Debug_i686
make CONF=Debug_x86_64
cd ../../images

echo
echo 'Getting TinyCore and syslinux'
./getresources

echo
echo 'Build the PBA kernels and root filesystems'
./buildpbaroot

echo
echo 'Build BIOS image'
./buildbios Release

echo
echo 'Build UEFI image'
./buildUEFI64 Release

echo
echo 'Build rescue 32'
./buildrescue Rescue32

echo
echo 'Build rescue 64'
./buildrescue Rescue64
