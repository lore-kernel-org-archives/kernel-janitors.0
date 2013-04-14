From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 14 Apr 2013 16:16:28 +0000
Subject: build regressions 2013-04-14
Message-Id: <516ad65c.sa0Abs9dC+ut7KcJ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sb_pci_mp.c:(.init.text+0x16941): undefined reference to `parport_pc_probe_port'
Error: can't open /tmp/ccgrHJyR.s for reading: No such file or directory
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:106:36: error: dereferencing pointer to incomplete type
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:109:21: error: variable 'inv_mpu_trigger_ops' has initializer but incomplete type
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:110:2: error: unknown field 'owner' specified in initializer
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:111:2: error: unknown field 'set_trigger_state' specified in initializer
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:119:2: error: implicit declaration of function 'iio_trigger_alloc' [-Werror=implicit-function-declaration]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:126:38: error: 'iio_trigger_generic_data_rdy_poll' undeclared (first use in this function)
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:132:10: error: dereferencing pointer to incomplete type
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:133:10: error: dereferencing pointer to incomplete type
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:134:10: error: dereferencing pointer to incomplete type
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:135:2: error: implicit declaration of function 'iio_trigger_register' [-Werror=implicit-function-declaration]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:145:2: error: implicit declaration of function 'iio_trigger_free' [-Werror=implicit-function-declaration]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:152:2: error: implicit declaration of function 'iio_trigger_unregister' [-Werror=implicit-function-declaration]
arch/m68k/include/asm/gpio.h:89:19: error: static declaration of 'gpio_request_one' follows non-static declaration
arch/m68k/include/asm/gpio.h:89:19: error: static declaration of 'gpio_request_one' follows non-static declaration
drivers/gpio/gpiolib.c:1507:5: error: redefinition of 'gpio_request_one'

[warnings]
WARNING: drivers/thermal/thermal_sys.o(.init.text+0x7a): Section mismatch in reference from the function _thermal_init() to the function .exit.text:_thermal_unregister_governors()
drivers/gpu/drm/drm_info.c:288:19: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/gpu/drm/drm_info.c:288:19: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
fs/btrfs/file-item.c:717:7: warning: comparison of distinct pointer types lacks a cast [enabled by default]
fs/btrfs/file-item.c:767:21: warning: comparison of distinct pointer types lacks a cast [enabled by default]
fs/btrfs/file-item.c:808:9: warning: comparison of distinct pointer types lacks a cast [enabled by default]
fs/btrfs/file-item.c:808:9: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/media/common/tuners/tua9001.c:161:5: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/nouveau/nv40_grctx.c:690:1: warning: the frame size of 1184 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/usb/storage/uas.c:261:15: warning: 'cmdinfo' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/btrfs/send.c:1033:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
fs/btrfs/send.c:1066:18: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
sound/pci/hda/patch_ca0132.c:1679:6: warning: 'status' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/x86/kernel/cpu/perf_event_intel_uncore.c:38:9: warning: 'config' is used uninitialized in this function [-Wuninitialized]
arch/x86/kernel/cpu/perf_event_intel_uncore.c:49:9: warning: 'config' is used uninitialized in this function [-Wuninitialized]
arch/x86/kernel/cpu/perf_event_intel_uncore.c:81:2: warning: 'count' is used uninitialized in this function [-Wuninitialized]
sound/soc/codecs/wm2000.c:543:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
WARNING: drivers/built-in.o(.text+0x354155): Section mismatch in reference from the function brcmf_sdio_init() to the function .init.text:platform_driver_probe()
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:110:2: warning: excess elements in struct initializer [enabled by default]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:110:2: warning: (near initialization for 'inv_mpu_trigger_ops') [enabled by default]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:111:2: warning: excess elements in struct initializer [enabled by default]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:111:2: warning: (near initialization for 'inv_mpu_trigger_ops') [enabled by default]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:119:11: warning: assignment makes pointer from integer without a cast [enabled by default]
WARNING: drivers/thermal/thermal_sys.o(.init.text+0x188): Section mismatch in reference from the function init_module() to the function .exit.text:thermal_unregister_governors()
WARNING: drivers/built-in.o(.init.text+0xaa34): Section mismatch in reference from the function thermal_init() to the function .exit.text:thermal_unregister_governors()
WARNING: drivers/thermal/thermal_sys.o(.init.literal+0x40): Section mismatch in reference from the (unknown reference) (unknown) to the function .exit.text:thermal_unregister_governors()

[smatch]
fs/fuse/dev.c:1030 fuse_dev_do_read() warn: inconsistent returns spin_lock:&fc->lock: locked (981, 1010 [(-19)], 1015 [s32min-(-1),1-s32max]) unlocked (1026 [0-u32max], 1030 [(-512)], 1030 [(-19)], 1030 [(-11)])
kernel/signal.c:1126 __lock_task_sighand() warn: inconsistent returns spin_lock:&sighand->siglock: locked (1126 [s32min-s32max]) unlocked (1126 [0])
kernel/signal.c:1126 __lock_task_sighand() warn: inconsistent returns irqsave:*flags: locked (1126 [s32min-s32max]) unlocked (1126 [0])
fs/dcache.c:318 dentry_kill() warn: inconsistent returns spin_lock:&dentry->d_lock: locked (318 [s32min-s32max]) unlocked (302 [4096-s64max])

[coccinelle]
drivers/block/mtip32xx/mtip32xx.c:1695:11-18: WARNING opportunity for memdup_user
drivers/block/mtip32xx/mtip32xx.c:1716:10-17: WARNING opportunity for memdup_user
drivers/block/mtip32xx/mtip32xx.c:1578:3-9: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
