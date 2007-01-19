KERNEL_DIR=.
INSTALL_MOD_PATH=$PWD/../../buildroot/buildroot-1.0/ch_conf
OUTPUT_DIR=$PWD/../output
test -d $OUTPUT_DIR || mkdir -p $OUTPUT_DIR
test -d $INSTALL_MOD_PATH || mkdir -p $INSTALL_MOD_PATH

CPU=arm
TOOLCHAIN=$PWD/../../buildroot/buildroot-1.0/build_${CPU}/staging_dir/
PATH=$PATH:$TOOLCHAIN/bin
export PATH

# add path for u-boot mkimage tool
PATH=$PATH:$PWD/../../u-boot/u-boot-weiss/tools
export PATH

if [ "$1" == "" ]; then
set uImage modules modules_install
fi



make -C "$KERNEL_DIR" BUILD_VERBOSE=1 ARCH=arm CROSS_COMPILE="arm-linux-" INSTALL_MOD_PATH=$INSTALL_MOD_PATH O=$OUTPUT_DIR $@

cp $OUTPUT_DIR/arch/arm/boot/uImage ../../tftp_root/uImage-ccm2200dev.bin

# Local Variables:
# mode: shell-script
# compile-command: "./weiss.sh"
# End:
