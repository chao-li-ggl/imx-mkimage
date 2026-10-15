#!/bin/bash

set -e

[[ -f "mkimage_imx8" ]] || make bin

SOC=iMX95
cp -v ../../download/firmware-ele-imx/mx95b0-ahab-container.img $SOC/

cp -v ../../download/firmware-imx/firmware-imx-8.33-7ce4783/firmware/ddr/synopsys/lpddr4x_imem_v202409.bin $SOC/
cp -v ../../download/firmware-imx/firmware-imx-8.33-7ce4783/firmware/ddr/synopsys/lpddr4x_dmem_v202409.bin $SOC/
cp -v ../../download/firmware-imx/firmware-imx-8.33-7ce4783/firmware/ddr/synopsys/lpddr4x_imem_qb_v202409.bin $SOC/
cp -v ../../download/firmware-imx/firmware-imx-8.33-7ce4783/firmware/ddr/synopsys/lpddr4x_dmem_qb_v202409.bin $SOC/

cp -v ../imx-oei/build/mx95lp4x-15/ddr/oei-m33-ddr.bin $SOC/
cp -v ../imx-sm/build/mx95evk/m33_image.bin $SOC/

cp -v ../uboot-imx/output/spl/u-boot-spl.bin $SOC/
cp -v ../uboot-imx/output/u-boot.bin $SOC/

cp -v ../imx-atf/build/imx95/debug/bl31.bin $SOC/

cp -v ../optee_os/out/arm-plat-imx/core/tee-raw.bin $SOC/tee.bin
# cp -v ../imx-optee-os/out/arm-plat-imx/core/tee-raw.bin $SOC/tee.bin

# make SOC=iMX95 REV=B0 LPDDR_TYPE=lpddr4x boot_test
make SOC=iMX95 REV=B0 LPDDR_TYPE=lpddr4x flash_only
OUTPUT=../../output
mkdir -p $OUTPUT
cp -vf $SOC/flash.bin $SOC/u-boot-atf-container.img $OUTPUT/


