From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 13 Apr 2013 16:12:23 +0000
Subject: build regressions 2013-04-13
Message-Id: <516983e7.9cs2Y/k8BO51jBfM%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(*ABS*+0x15ee601): multiple definition of `__crc_pwm_free'
(*ABS*+0xaee34e3d): multiple definition of `__crc_pwm_request'
(*ABS*+0xd83c7949): multiple definition of `__crc_pwm_enable'
(.text+0x377dc): multiple definition of `pwm_config'
drivers/pwm/built-in.o:(.text+0x7c): first defined here
(.text+0x37708): multiple definition of `pwm_free'
drivers/pwm/built-in.o:(.text+0x74c): first defined here
(.text+0x375f4): multiple definition of `pwm_request'
drivers/pwm/built-in.o:(.text+0xdf0): first defined here
(*ABS*+0xa4ee3c79): multiple definition of `__crc_pwm_disable'
(.text+0x37754): multiple definition of `pwm_enable'
drivers/pwm/built-in.o:(.text+0x18c): first defined here
(.text+0x37698): multiple definition of `pwm_disable'
drivers/pwm/built-in.o:(.text+0x1f4): first defined here
(*ABS*+0xdeebfb06): multiple definition of `__crc_pwm_config'
drivers/clk/clk-palmas.c:265:1: error: redefinition of '__inittest'
drivers/clk/clk-palmas.c:265:1: error: redefinition of 'init_module'
drivers/clk/clk-palmas.c:265:1: error: redefinition of '__exittest'
drivers/clk/clk-palmas.c:265:1: error: redefinition of 'cleanup_module'
drivers/pci/hotplug/ibmphp_ebda.o:(.bss+0x0): multiple definition of `ibmphp_hotplug_slot_ops'
drivers/pci/hotplug/ibmphp_core.o:(.data+0x0): first defined here
drivers/pci/hotplug/ibmphp_pci.o:(.bss+0x0): multiple definition of `ibmphp_hotplug_slot_ops'
drivers/pci/hotplug/ibmphp_core.o:(.data+0x0): first defined here
drivers/pci/hotplug/ibmphp_res.o:(.bss+0x0): multiple definition of `ibmphp_hotplug_slot_ops'
drivers/pci/hotplug/ibmphp_core.o:(.data+0x0): first defined here
drivers/pci/hotplug/ibmphp_hpc.o:(.bss+0x0): multiple definition of `ibmphp_hotplug_slot_ops'
drivers/pci/hotplug/ibmphp_core.o:(.data+0x0): first defined here
drivers/pwm/built-in.o:(.text.pwm_config+0x0): first defined here
drivers/pwm/built-in.o:(.text.pwm_free+0x0): first defined here
drivers/pwm/built-in.o:(.text.pwm_request+0x0): first defined here
drivers/pwm/built-in.o:(.text.pwm_enable+0x0): first defined here
drivers/pwm/built-in.o:(.text.pwm_disable+0x0): first defined here
drivers/pwm/built-in.o:(.opd+0x30): first defined here
drivers/pwm/built-in.o:(.opd+0x198): first defined here
drivers/pwm/built-in.o:(.opd+0x270): first defined here
drivers/pwm/built-in.o:(.opd+0x60): first defined here
drivers/pwm/built-in.o:(.opd+0x78): first defined here
drivers/pci/hotplug/acpiphp_core.c:359:2: error: 's' undeclared (first use in this function)
drivers/pci/hotplug/acpiphp_core.c:359:2: error: expected ')' before string constant
drivers/clk/clk-palmas.c:170:3: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]
drivers/iio/industrialio-triggered-buffer.c:20:16: error: 'iio_sw_buffer_preenable' undeclared here (not in a function)
drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c:176:3: error: implicit declaration of function 'iio_push_to_buffers' [-Werror=implicit-function-declaration]
kernel/trace/ftrace.c:4442:13: error: 'ftrace_filter_lseek' undeclared here (not in a function)
kernel/trace/trace_stack.c:325:12: error: 'ftrace_filter_lseek' undeclared here (not in a function)

[warnings]
drivers/dma/dmatest.c:642: warning: initialization makes pointer from integer without a cast
sound/soc/soc-dapm.c:824: warning: 'path' is used uninitialized in this function
drivers/usb/otg/palmas-usb.c:212: warning: 'palmas_set_vbus' defined but not used
drivers/usb/otg/palmas-usb.c:220: warning: 'palmas_start_srp' defined but not used
sound/soc/soc-fw.c:178: warning: format '%d' expects type 'int', but argument 4 has type 'size_t'
sound/soc/soc-fw.c:178: warning: format '%d' expects type 'int', but argument 5 has type 'size_t'
sound/soc/soc-fw.c:1177: warning: format '%x' expects type 'unsigned int', but argument 7 has type 'size_t'
sound/soc/soc-fw.c:1185: warning: format '%x' expects type 'unsigned int', but argument 7 has type 'size_t'
sound/soc/soc-fw.c:1193: warning: format '%x' expects type 'unsigned int', but argument 8 has type 'size_t'
include/linux/of_i2c.h:28:51: warning: 'struct i2c_adapter' declared inside parameter list [enabled by default]
include/linux/of_i2c.h:28:51: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/of_i2c.h:33:68: warning: 'struct device_node' declared inside parameter list [enabled by default]
include/linux/of_i2c.h:40:14: warning: 'struct device_node' declared inside parameter list [enabled by default]
drivers/staging/video/imageon/imageon-rx-driver.c:167:2: warning: passing argument 1 of 'of_find_i2c_adapter_by_node' from incompatible pointer type [enabled by default]
sound/soc/soc-fw.c:178:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat]
sound/soc/soc-fw.c:178:4: warning: format '%d' expects argument of type 'int', but argument 5 has type 'size_t' [-Wformat]
sound/soc/soc-fw.c:1177:4: warning: format '%x' expects argument of type 'unsigned int', but argument 7 has type 'size_t' [-Wformat]
sound/soc/soc-fw.c:1185:4: warning: format '%x' expects argument of type 'unsigned int', but argument 7 has type 'size_t' [-Wformat]
sound/soc/soc-fw.c:1193:4: warning: format '%x' expects argument of type 'unsigned int', but argument 8 has type 'size_t' [-Wformat]
drivers/dma/xilinx/cdmatest.c:488:1: warning: 'cdmatest_func' uses dynamic stack allocation [enabled by default]
drivers/dma/xilinx/vdmatest.c:457:1: warning: 'vdmatest_slave_func' uses dynamic stack allocation [enabled by default]
warning: (CAN_PEAK_PCIEC && SFC && DRM && FB_DDC && FB_BFIN_7393 && FB_VIA && FB_XYLON_PIXCLK_SI570 && SND_AOA_ONYX && SND_AOA_TAS && SND_SOC_BFIN_EVAL_ADAU1701 && FB_OLPC_DCON) selects I2C which has unmet direct dependencies (!S390)
warning: (CAN_PEAK_PCIEC && SFC && DRM && FB_DDC && FB_BFIN_7393 && FB_VIA && FB_XYLON_PIXCLK_SI570 && SND_AOA_ONYX && SND_AOA_TAS && SND_SOC_BFIN_EVAL_ADAU1701 && FB_OLPC_DCON) selects I2C which has unmet direct dependencies (!S390)
warning: (CAN_PEAK_PCIEC && SFC && DRM && FB_DDC && FB_BFIN_7393 && FB_VIA && FB_XYLON_PIXCLK_SI570 && SND_AOA_ONYX && SND_AOA_TAS && SND_SOC_BFIN_EVAL_ADAU1701 && FB_OLPC_DCON) selects I2C which has unmet direct dependencies (!S390)
warning: (CAN_PEAK_PCIEC && SFC && DRM && FB_DDC && FB_BFIN_7393 && FB_VIA && FB_XYLON_PIXCLK_SI570 && SND_AOA_ONYX && SND_AOA_TAS && SND_SOC_BFIN_EVAL_ADAU1701 && FB_OLPC_DCON) selects I2C which has unmet direct dependencies (!S390)
warning: (CAN_PEAK_PCIEC && SFC && DRM && FB_DDC && FB_BFIN_7393 && FB_VIA && FB_XYLON_PIXCLK_SI570 && SND_AOA_ONYX && SND_AOA_TAS && SND_SOC_BFIN_EVAL_ADAU1701 && FB_OLPC_DCON) selects I2C which has unmet direct dependencies (!S390)
warning: (CAN_PEAK_PCIEC && SFC && DRM && FB_DDC && FB_BFIN_7393 && FB_VIA && FB_XYLON_PIXCLK_SI570 && SND_AOA_ONYX && SND_AOA_TAS && SND_SOC_BFIN_EVAL_ADAU1701 && FB_OLPC_DCON) selects I2C which has unmet direct dependencies (!S390)
drivers/dma/xilinx/axidmatest.c:483:1: warning: 'dmatest_slave_func' uses dynamic stack allocation [enabled by default]
sound/soc/soc-fw.c:149:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/pci/hotplug/acpiphp_glue.c:943:1: warning: label 'err_exit' defined but not used [-Wunused-label]
drivers/pci/hotplug/acpiphp_glue.c:915:18: warning: unused variable 'bus' [-Wunused-variable]
drivers/usb/otg/palmas-usb.c:106:21: warning: unused variable 'palmas_usb' [-Wunused-variable]
drivers/usb/otg/palmas-usb.c:141:21: warning: unused variable 'palmas_usb' [-Wunused-variable]
drivers/mfd/palmas-resource.c:274:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (AD7606 && AD799X_RING_BUFFER && MXS_LRADC && IIO_ADIS_LIB_BUFFER && INV_MPU6050_IIO && HID_SENSOR_ACCEL_3D && AD_SIGMA_DELTA && AD7266 && AD7298 && AD7476 && AD7887 && AT91_ADC && MAX1363 && HID_SENSOR_GYRO_3D && ADJD_S311 && HID_SENSOR_ALS && HID_SENSOR_MAGNETOMETER_3D) selects IIO_TRIGGERED_BUFFER which has unmet direct dependencies (IIO && IIO_BUFFER)
warning: (AD7606 && AD799X_RING_BUFFER && MXS_LRADC && IIO_ADIS_LIB_BUFFER && INV_MPU6050_IIO && HID_SENSOR_ACCEL_3D && AD_SIGMA_DELTA && AD7266 && AD7298 && AD7476 && AD7887 && AT91_ADC && MAX1363 && HID_SENSOR_GYRO_3D && ADJD_S311 && HID_SENSOR_ALS && HID_SENSOR_MAGNETOMETER_3D) selects IIO_TRIGGERED_BUFFER which has unmet direct dependencies (IIO && IIO_BUFFER)
warning: (AD7606 && AD799X_RING_BUFFER && MXS_LRADC && IIO_ADIS_LIB_BUFFER && INV_MPU6050_IIO && HID_SENSOR_ACCEL_3D && AD_SIGMA_DELTA && AD7266 && AD7298 && AD7476 && AD7887 && AT91_ADC && MAX1363 && HID_SENSOR_GYRO_3D && ADJD_S311 && HID_SENSOR_ALS && HID_SENSOR_MAGNETOMETER_3D) selects IIO_TRIGGERED_BUFFER which has unmet direct dependencies (IIO && IIO_BUFFER)

[smatch]
kernel/exit.c:1648 do_wait() warn: inconsistent returns read_lock:&tasklist_lock: locked (1648 [s32min-(-1),1-s32max]) unlocked (1648 [(-512)], 1648, 1648 [(-10)])
mm/memory.c:702 copy_pte_range() warn: inconsistent returns spin_lock:__ptl: locked (697 [(-12)], 702 [0]) unlocked (658 [(-12)])
fs/cachefiles/namei.c:365 cachefiles_delete_object() warn: inconsistent returns mutex:&dir->d_inode->i_mutex: locked (365 [s32min-s32max]) unlocked (365 [0])
fs/fuse/dev.c:1102 fuse_dev_do_write() warn: inconsistent returns spin_lock:&fc->lock: locked (1059 [(-2)], 1096) unlocked (1022 [(-22)], 1038, 1074 [16], 1102 [(-22)], 1102 [(-2)], 1102 [(-22)], 1102 [(-22)], 1102 [s32min-(-1),1-s32max])

[coccinelle]
drivers/usb/dwc3/core.c:452:5-11: inconsistent IS_ERR and PTR_ERR, PTR_ERR on line 453
drivers/usb/gadget/configfs.c:560:9-16: WARNING: ERR_CAST can be used with fi
drivers/usb/gadget/configfs.c:560:9-16: WARNING: ERR_CAST can be used with fi
drivers/staging/rtl8192u/r8192U_core.c:2218:1-14: alloc with no test, possible model on line 2233
drivers/staging/rtl8192u/r8192U_core.c:2218:1-14: alloc with no test, possible model on line 2233
drivers/gpu/drm/drm_edid_load.c:220:8-12: ERROR: reference preceded by free on line 179
drivers/gpu/drm/drm_edid_load.c:220:8-12: ERROR: reference preceded by free on line 202
drivers/gpu/drm/drm_edid_load.c:220:8-12: ERROR: reference preceded by free on line 179
drivers/gpu/drm/drm_edid_load.c:220:8-12: ERROR: reference preceded by free on line 202
drivers/mmc/card/block.c:254:14-21: WARNING opportunity for memdup_user
drivers/mmc/host/android-goldfish.c:487:24-25: WARNING comparing pointer to 0
drivers/mmc/host/android-goldfish.c:487:24-25: WARNING comparing pointer to 0

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
