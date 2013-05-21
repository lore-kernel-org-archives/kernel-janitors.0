From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 21 May 2013 22:02:11 +0000
Subject: build regressions 2013-05-21
Message-Id: <519beee3.290CMDJPFpZwgl1z%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/mutex.c:720:2: error: implicit declaration of function '__mutex_fastpath_lock_retval_arg' [-Werror=implicit-function-declaration]
drivers/platform/x86/panasonic-laptop.c:269:38: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:268:3: error: 'ACPI_ACTUAL_DEBUG' undeclared (first use in this function)
drivers/platform/x86/panasonic-laptop.c:285:38: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:284:3: error: 'ACPI_ACTUAL_DEBUG' undeclared (first use in this function)
drivers/platform/x86/panasonic-laptop.c:291:58: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:298:39: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:309:34: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:464:38: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:463:3: error: 'ACPI_ACTUAL_DEBUG' undeclared (first use in this function)
drivers/platform/x86/panasonic-laptop.c:473:44: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 3 given
drivers/platform/x86/panasonic-laptop.c:498:51: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:497:3: error: 'ACPI_ACTUAL_DEBUG' undeclared (first use in this function)
drivers/platform/x86/panasonic-laptop.c:512:47: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:519:43: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:576:60: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:576:3: error: 'ACPI_ACTUAL_DEBUG' undeclared (first use in this function)
drivers/platform/x86/panasonic-laptop.c:583:39: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:603:45: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:609:38: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:659:43: error: macro "ACPI_ACTUAL_DEBUG" requires 6 arguments, but only 2 given
drivers/platform/x86/panasonic-laptop.c:658:3: error: 'ACPI_ACTUAL_DEBUG' undeclared (first use in this function)
drivers/platform/x86/xo15-ebook.c:74:3: error: '_COMPONENT' undeclared (first use in this function)
drivers/i2c/busses/i2c-scmi.c:201:2: error: '_COMPONENT' undeclared (first use in this function)
drivers/i2c/busses/i2c-scmi.c:327:4: error: '_COMPONENT' undeclared (first use in this function)
lib/locking-selftest.c:1117:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1119:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1121:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1123:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1157:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1168:57: error: 'struct reservation_object' has no member named 'dep_map'
lib/locking-selftest.c:1168:171: error: 'struct reservation_object' has no member named 'dep_map'
lib/locking-selftest.c:1181:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1182:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1198:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1199:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1215:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1216:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1230:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1231:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1243:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1244:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1257:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1260:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1274:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1275:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1287:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1288:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1301:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1304:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1319:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1325:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1338:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1344:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1360:2: error: too many arguments to function 'object_reserve'
lib/locking-selftest.c:1366:2: error: too many arguments to function 'object_reserve'
drivers/gpu/drm/i915/i915_gem_dmabuf.c:229:2: error: too few arguments to function 'dma_buf_export'
drivers/media/v4l2-core/videobuf2-dma-contig.c:409:2: error: too few arguments to function 'dma_buf_export'
include/scsi/scsi_device.h:8:26: fatal error: linux/blk-mq.h: No such file or directory
drivers/scsi/scsi-mq.c:4:26: fatal error: linux/blk-mq.h: No such file or directory
block/blk-exec.c:8:26: fatal error: linux/blk-mq.h: No such file or directory
drivers/scsi/scsi_lib.c:23:26: fatal error: linux/blk-mq.h: No such file or directory
block/scsi_ioctl.c:31:26: fatal error: linux/blk-mq.h: No such file or directory
drivers/scsi/sg.c:55:26: fatal error: linux/blk-mq.h: No such file or directory

[warnings]
WARNING: vmlinux.o(.text.unlikely+0xc6): Section mismatch in reference from the function .prom_rtas_call() to the variable .init.data:dt_string_start
drivers/media/i2c/saa7115.c:1647:1: warning: 'saa711x_detect_chip.constprop.2' uses dynamic stack allocation [enabled by default]
lib/locking-selftest.c:1119:2: warning: passing argument 3 of 'object_reserve' makes pointer from integer without a cast [enabled by default]
lib/locking-selftest.c:1121:2: warning: passing argument 3 of 'object_reserve' makes pointer from integer without a cast [enabled by default]
lib/locking-selftest.c:1123:2: warning: passing argument 3 of 'object_reserve' makes pointer from integer without a cast [enabled by default]
lib/locking-selftest.c:1168:94: warning: comparison of distinct pointer types lacks a cast [enabled by default]
lib/locking-selftest.c:1168:22: warning: passing argument 1 of 'spinlock_check' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1169:2: warning: passing argument 1 of 'spin_unlock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1199:2: warning: passing argument 3 of 'object_reserve' makes pointer from integer without a cast [enabled by default]
lib/locking-selftest.c:1230:2: warning: passing argument 3 of 'object_reserve' makes pointer from integer without a cast [enabled by default]
lib/locking-selftest.c:1243:2: warning: passing argument 3 of 'object_reserve' makes pointer from integer without a cast [enabled by default]
lib/locking-selftest.c:1244:2: warning: passing argument 3 of 'object_reserve' makes pointer from integer without a cast [enabled by default]
lib/locking-selftest.c:1257:2: warning: passing argument 3 of 'object_reserve' makes pointer from integer without a cast [enabled by default]
lib/locking-selftest.c:1288:2: warning: passing argument 3 of 'object_reserve' makes pointer from integer without a cast [enabled by default]
lib/locking-selftest.c:1316:2: warning: passing argument 1 of 'spin_lock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1317:2: warning: passing argument 1 of 'spin_unlock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1320:2: warning: passing argument 1 of 'spin_lock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1321:2: warning: passing argument 1 of 'spin_unlock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1324:2: warning: passing argument 1 of 'spin_lock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1327:2: warning: passing argument 1 of 'spin_unlock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1335:2: warning: passing argument 1 of 'spin_lock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1336:2: warning: passing argument 1 of 'spin_unlock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1338:2: warning: passing argument 3 of 'object_reserve' makes pointer from integer without a cast [enabled by default]
lib/locking-selftest.c:1339:2: warning: passing argument 1 of 'spin_lock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1340:2: warning: passing argument 1 of 'spin_unlock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1343:2: warning: passing argument 1 of 'spin_lock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1344:2: warning: passing argument 3 of 'object_reserve' makes pointer from integer without a cast [enabled by default]
lib/locking-selftest.c:1346:2: warning: passing argument 1 of 'spin_unlock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1355:2: warning: passing argument 1 of 'spin_lock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1356:2: warning: passing argument 1 of 'spin_unlock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1361:2: warning: passing argument 1 of 'spin_lock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1362:2: warning: passing argument 1 of 'spin_unlock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1365:2: warning: passing argument 1 of 'spin_lock' from incompatible pointer type [enabled by default]
lib/locking-selftest.c:1368:2: warning: passing argument 1 of 'spin_unlock' from incompatible pointer type [enabled by default]
drivers/base/fence-helper.c:194:57: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/base/fence-helper.c:196:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/base/fence-helper.c:198:8: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/base/fence-helper.c:281:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/base/fence-helper.c:284:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/base/fence-helper.c:286:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/base/fence-helper.c:329:34: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/base/dma-buf.c:249:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/i915/i915_gem_dmabuf.c:230:1: warning: control reaches end of non-void function [-Wreturn-type]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
