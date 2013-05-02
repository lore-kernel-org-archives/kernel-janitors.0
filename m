From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 02 May 2013 21:03:47 +0000
Subject: build regressions 2013-05-02
Message-Id: <5182d4b3.+604CiTBpvQihrmL%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/namespace.c:2822:8: error: 'SYSFS_MAGIC' undeclared (first use in this function)
fs/namespace.c:2825:8: error: 'PROC_SUPER_MAGIC' undeclared (first use in this function)
block/blk-timeout.o:(.discard+0x0): first defined here
block/blk-timeout.o:(.discard+0x0): first defined here
block/blk-timeout.o:(.discard+0x0): first defined here
block/blk-timeout.o:(.discard+0x0): first defined here
block/blk-timeout.o:(.discard+0x0): first defined here
drivers/usb/host/ohs900-hcd.c:1781:6: error: 'phase' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1781:15: error: 'SUSPEND_POWER_DOWN' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1784:6: error: 'state' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1784:15: error: 'PM_SUSPEND_MEM' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1789:6: error: 'struct platform_device' has no member named 'power'
drivers/usb/host/ohs900-hcd.c:1798:6: error: 'phase' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1798:15: error: 'RESUME_POWER_ON' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1804:46: error: 'struct usb_hcd' has no member named 'can_wakeup'
drivers/input/serio/opencores_ps2.c:113:2: error: implicit declaration of function 'platform_get_resource' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:119:2: error: implicit declaration of function 'platform_get_irq' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:125:94: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:142:10: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:146:17: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:154:35: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:155:45: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:157:45: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:161:2: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:178:9: error: implicit declaration of function 'platform_get_drvdata' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:194:15: error: variable 'ocps2_driver' has initializer but incomplete type
drivers/input/serio/opencores_ps2.c:195:2: error: unknown field 'probe' specified in initializer
drivers/input/serio/opencores_ps2.c:196:2: error: unknown field 'remove' specified in initializer
drivers/input/serio/opencores_ps2.c:197:2: error: unknown field 'driver' specified in initializer
drivers/input/serio/opencores_ps2.c:197:2: error: extra brace group at end of initializer
drivers/input/serio/opencores_ps2.c:206:2: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:211:2: error: implicit declaration of function 'platform_driver_unregister' [-Werror=implicit-function-declaration]
drivers/spi/spi_opencores.c:22:25: fatal error: asm/cpuinfo.h: No such file or directory
drivers/char/scet.c:255:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'scet_probe'
drivers/char/scet.c:298:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'scet_remove'
drivers/char/scet.c:319:11: error: 'scet_probe' undeclared here (not in a function)
drivers/char/scet.c:320:2: error: implicit declaration of function '__devexit_p' [-Werror=implicit-function-declaration]
drivers/char/scet.c:320:24: error: 'scet_remove' undeclared here (not in a function)
drivers/usb/host/ohs900-hcd.c:1555:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ohs900h_remove'
drivers/usb/host/ohs900-hcd.c:1572:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ohs900h_probe'
drivers/usb/host/ohs900-hcd.c:1788:11: error: 'ohs900h_probe' undeclared here (not in a function)
drivers/usb/host/ohs900-hcd.c:1789:2: error: implicit declaration of function '__devexit_p' [-Werror=implicit-function-declaration]
drivers/usb/host/ohs900-hcd.c:1789:24: error: 'ohs900h_remove' undeclared here (not in a function)
drivers/s390/kvm/kvm_virtio.c:455:27: error: 'real_memory_size' undeclared (first use in this function)

[warnings]
drivers/usb/host/ohs900-hcd.c:236:192: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/host/ohs900-hcd.c:264:200: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/host/ohs900-hcd.c:1778:9: warning: passing argument 1 of 'dev_get_drvdata' from incompatible pointer type [enabled by default]
drivers/usb/host/ohs900-hcd.c:1796:9: warning: passing argument 1 of 'dev_get_drvdata' from incompatible pointer type [enabled by default]
drivers/usb/host/ohs900-hcd.c:1825:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/usb/host/ohs900-hcd.c:1825:2: warning: (near initialization for 'ohs900h_driver.suspend') [enabled by default]
drivers/input/serio/opencores_ps2.c:101:31: warning: 'struct platform_device' declared inside parameter list [enabled by default]
drivers/input/serio/opencores_ps2.c:101:31: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/input/serio/opencores_ps2.c:113:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/input/serio/opencores_ps2.c:176:32: warning: 'struct platform_device' declared inside parameter list [enabled by default]
drivers/input/serio/opencores_ps2.c:178:31: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/input/serio/opencores_ps2.c:195:2: warning: excess elements in struct initializer [enabled by default]
drivers/input/serio/opencores_ps2.c:195:2: warning: (near initialization for 'ocps2_driver') [enabled by default]
drivers/input/serio/opencores_ps2.c:196:2: warning: excess elements in struct initializer [enabled by default]
drivers/input/serio/opencores_ps2.c:196:2: warning: (near initialization for 'ocps2_driver') [enabled by default]
drivers/input/serio/opencores_ps2.c:201:2: warning: excess elements in struct initializer [enabled by default]
drivers/input/serio/opencores_ps2.c:201:2: warning: (near initialization for 'ocps2_driver') [enabled by default]
drivers/usb/host/ohs900-hcd.c:1517:25: warning: 'ohs900h_hc_driver' defined but not used [-Wunused-variable]
drivers/char/scet.c:145:2: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat]
drivers/char/scet.c:169:2: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat]

[coccinelle]
drivers/scsi/fnic/fnic_fcs.c:384:11-27: WARNING: casting value returned by k[cmz]alloc to (struct fcoe_vlan *) is useless.
drivers/scsi/fnic/fnic_fcs.c:477:9-26: WARNING: casting value returned by k[cmz]alloc to (struct fnic_event *) is useless.
drivers/scsi/fnic/fnic_fcs.c:384:11-27: WARNING: casting value returned by k[cmz]alloc to (struct fcoe_vlan *) is useless.
drivers/scsi/fnic/fnic_fcs.c:477:9-26: WARNING: casting value returned by k[cmz]alloc to (struct fnic_event *) is useless.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
