From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 11 Jul 2013 00:41:56 +0000
Subject: build regressions 2013-07-10
Message-Id: <51ddff54.p0Y54NEpQajfE8XQ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
net/wireless/core.c:467:14: error: 'struct wiphy' has no member named 'wowlan'
net/wireless/core.c:467:14: error: 'struct wiphy' has no member named 'wowlan'
net/wireless/core.c:467:14: error: 'struct wiphy' has no member named 'wowlan'
drivers/spi/spi_opencores.c:656:14: error: expected declaration specifiers or '...' before string constant
drivers/spi/spi_opencores.c:700:20: error: expected declaration specifiers or '...' before string constant
drivers/spi/spi_opencores.c:701:15: error: expected declaration specifiers or '...' before string constant
drivers/spi/spi_opencores.c:702:16: error: expected declaration specifiers or '...' before string constant
drivers/spi/spi_opencores.c:99:15: error: 'struct cpuinfo' has no member named 'clock_frequency'
drivers/spi/spi_opencores.c:103:63: error: 'struct cpuinfo' has no member named 'clock_frequency'
drivers/spi/spi_opencores.c:602:26: error: 'struct cpuinfo' has no member named 'clock_frequency'
drivers/spi/spi_opencores.c:603:26: error: 'struct cpuinfo' has no member named 'clock_frequency'
drivers/spi/spi_opencores.c:569:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ocspi_probe'
drivers/spi/spi_opencores.c:638:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ocspi_remove'
drivers/spi/spi_opencores.c:664:11: error: 'ocspi_probe' undeclared here (not in a function)
drivers/spi/spi_opencores.c:665:2: error: implicit declaration of function '__devexit_p' [-Werror=implicit-function-declaration]
drivers/spi/spi_opencores.c:665:24: error: 'ocspi_remove' undeclared here (not in a function)
drivers/char/scet.c:255:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'scet_probe'
drivers/char/scet.c:298:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'scet_remove'
drivers/char/scet.c:319:11: error: 'scet_probe' undeclared here (not in a function)
drivers/char/scet.c:320:2: error: implicit declaration of function '__devexit_p' [-Werror=implicit-function-declaration]
drivers/char/scet.c:320:24: error: 'scet_remove' undeclared here (not in a function)
drivers/usb/host/ohs900-hcd.c:1555:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ohs900h_remove'
drivers/usb/host/ohs900-hcd.c:1572:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ohs900h_probe'
drivers/usb/host/ohs900-hcd.c:1738:6: error: 'phase' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1738:15: error: 'SUSPEND_POWER_DOWN' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1741:6: error: 'state' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1741:15: error: 'PM_SUSPEND_MEM' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1746:6: error: 'struct platform_device' has no member named 'power'
drivers/usb/host/ohs900-hcd.c:1754:6: error: 'phase' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1754:15: error: 'RESUME_POWER_ON' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1760:46: error: 'struct usb_hcd' has no member named 'can_wakeup'
drivers/usb/host/ohs900-hcd.c:1788:11: error: 'ohs900h_probe' undeclared here (not in a function)
drivers/usb/host/ohs900-hcd.c:1789:2: error: implicit declaration of function '__devexit_p' [-Werror=implicit-function-declaration]
drivers/usb/host/ohs900-hcd.c:1789:24: error: 'ohs900h_remove' undeclared here (not in a function)
drivers/spi/spi_opencores.c:22:25: fatal error: asm/cpuinfo.h: No such file or directory
drivers/input/serio/opencores_ps2.c:113:2: error: implicit declaration of function 'platform_get_resource' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:119:2: error: implicit declaration of function 'platform_get_irq' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:125:7: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:142:10: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:146:2: error: dereferencing pointer to incomplete type
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
fs/nfs/write.c:903:2: error: implicit declaration of function 'nfs_have_delegation' [-Werror=implicit-function-declaration]
include/linux/dmabuf-sync.h:111:1: error: expected identifier or '(' before '{' token
/bin/bash: lz4c: command not found
i915_sysfs.c:(.text+0x1e44fc): undefined reference to `i915_error_state_buf_init'
i915_sysfs.c:(.text+0x1e4513): undefined reference to `i915_error_state_get'
i915_sysfs.c:(.text+0x1e4522): undefined reference to `i915_error_state_to_str'
i915_sysfs.c:(.text+0x1e4548): undefined reference to `i915_error_state_put'

[warnings]
drivers/iio/dac/mcp4725.c:115:8: warning: initialization from incompatible pointer type [enabled by default]
drivers/iio/dac/mcp4725.c:115:8: warning: (near initialization for 'iio_dev_attr_store_eeprom.dev_attr.store') [enabled by default]
include/linux/ceph/decode.h:164: warning: comparison is always false due to limited range of data type
include/linux/ceph/decode.h:166: warning: comparison is always false due to limited range of data type
drivers/spi/spi_opencores.c:654:1: warning: data definition has no type or storage class [enabled by default]
drivers/spi/spi_opencores.c:654:1: warning: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Wimplicit-int]
drivers/spi/spi_opencores.c:654:1: warning: parameter names (without types) in function declaration [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/linux/dynamic_debug.h:64:16: warning: format '%d' expects argument of type 'int', but argument 5 has type 'size_t' [-Wformat=]
include/linux/dynamic_debug.h:64:16: warning: format '%d' expects argument of type 'int', but argument 5 has type 'size_t' [-Wformat=]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
drivers/usb/host/ohs900-hcd.c:1735:9: warning: passing argument 1 of 'dev_get_drvdata' from incompatible pointer type [enabled by default]
drivers/usb/host/ohs900-hcd.c:1752:9: warning: passing argument 1 of 'dev_get_drvdata' from incompatible pointer type [enabled by default]
drivers/usb/host/ohs900-hcd.c:1791:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/usb/host/ohs900-hcd.c:1791:2: warning: (near initialization for 'ohs900h_driver.suspend') [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
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
include/linux/dmabuf-sync.h:108:19: warning: 'dmabuf_sync_single_lock' used but never defined [enabled by default]

[sparse]
fs/ceph/caps.c:809:5: sparse: symbol '__ceph_caps_revoking_other' was not declared. Should it be static?
net/sunrpc/rpc_pipe.c:496:31: sparse: symbol 'rpc_dir_inode_operations' was not declared. Should it be static?
fs/nfs/write.c:903:13: sparse: undefined identifier 'nfs_have_delegation'
drivers/mfd/tps65912-irq.c:220:5: sparse: symbol 'tps65912_irq_exit' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
