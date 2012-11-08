From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 08 Nov 2012 01:04:18 +0000
Subject: build regressions 2012-11-07
Message-Id: <20121108010418.GB17232@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-shmobile/board-marzen.c:316:15: error: 'GPIO_FN_USB_PENC2' undeclared (first use in this function)
drivers/usb/musb/tusb6010.c:249:5: error: implicit declaration of function 'ioread32_rep' [-Werror=implicit-function-declaration]
drivers/usb/musb/tusb6010.c:202:5: error: implicit declaration of function 'iowrite32_rep' [-Werror=implicit-function-declaration]
mm/rmap.c:59:23: fatal error: linux/rtm.h: No such file or directory
fs/btrfs/locking.c:22:25: fatal error: linux/elide.h: No such file or directory
include/linux/list_bl.h:65:2: error: implicit declaration of function '_xtest' [-Werror=implicit-function-declaration]
include/linux/list_bl.h:65:2: error: implicit declaration of function '_xtest' [-Werror=implicit-function-declaration]
net/ceph/ceph_common.c:249:2: error: implicit declaration of function 'request_key' [-Werror=implicit-function-declaration]
net/ceph/ceph_common.c:272:13: error: dereferencing pointer to incomplete type
net/ceph/crypto.c:429:23: error: dereferencing pointer to incomplete type
net/ceph/crypto.c:437:2: error: implicit declaration of function 'key_payload_reserve' [-Werror=implicit-function-declaration]
net/ceph/crypto.c:473:8: error: variable 'key_type_ceph' has initializer but incomplete type
net/ceph/crypto.c:474:2: error: unknown field 'name' specified in initializer
net/ceph/crypto.c:475:2: error: unknown field 'instantiate' specified in initializer
net/ceph/crypto.c:476:2: error: unknown field 'match' specified in initializer
net/ceph/crypto.c:477:2: error: unknown field 'destroy' specified in initializer
net/ceph/crypto.c:481:2: error: implicit declaration of function 'register_key_type' [-Werror=implicit-function-declaration]
net/ceph/crypto.c:485:2: error: implicit declaration of function 'unregister_key_type' [-Werror=implicit-function-declaration]
net/dns_resolver/dns_key.c:67:23: error: dereferencing pointer to incomplete type
net/dns_resolver/dns_key.c:150:2: error: implicit declaration of function 'key_payload_reserve' [-Werror=implicit-function-declaration]
net/dns_resolver/dns_key.c:215:2: error: implicit declaration of function 'key_is_instantiated' [-Werror=implicit-function-declaration]
net/dns_resolver/dns_key.c:236:8: error: variable 'key_type_dns_resolver' has initializer but incomplete type
net/dns_resolver/dns_key.c:237:2: error: unknown field 'name' specified in initializer
net/dns_resolver/dns_query.c:124:2: error: implicit declaration of function 'request_key' [-Werror=implicit-function-declaration]
net/dns_resolver/dns_query.c:132:17: error: dereferencing pointer to incomplete type
net/dns_resolver/dns_query.c:133:16: error: 'KEY_USR_VIEW' undeclared (first use in this function)
include/uapi/linux/byteorder/big_endian.h:43:22: error: redefinition of '__cpu_to_le64p'
include/uapi/linux/byteorder/big_endian.h:47:21: error: redefinition of '__le64_to_cpup'
include/uapi/linux/byteorder/big_endian.h:51:22: error: redefinition of '__cpu_to_le32p'
include/uapi/linux/byteorder/big_endian.h:55:21: error: redefinition of '__le32_to_cpup'
include/uapi/linux/byteorder/big_endian.h:59:22: error: redefinition of '__cpu_to_le16p'
include/uapi/linux/byteorder/big_endian.h:63:21: error: redefinition of '__le16_to_cpup'
include/uapi/linux/byteorder/big_endian.h:67:22: error: redefinition of '__cpu_to_be64p'
include/uapi/linux/byteorder/big_endian.h:71:21: error: redefinition of '__be64_to_cpup'
include/uapi/linux/byteorder/big_endian.h:75:22: error: redefinition of '__cpu_to_be32p'
include/uapi/linux/byteorder/big_endian.h:79:21: error: redefinition of '__be32_to_cpup'
include/uapi/linux/byteorder/big_endian.h:83:22: error: redefinition of '__cpu_to_be16p'
include/uapi/linux/byteorder/big_endian.h:87:21: error: redefinition of '__be16_to_cpup'
include/asm-generic/bitops/le.h:11:29: error: conflicting types for 'find_next_zero_bit_le'
include/asm-generic/bitops/le.h:17:29: error: conflicting types for 'find_next_bit_le'
include/asm-generic/bitops/le.h:23:29: error: conflicting types for 'find_first_zero_bit_le'
fs/far/far-path.c:42:2: error: implicit declaration of function 'IS_ERR' [-Werror=implicit-function-declaration]
fs/far/far-path.c:121:3: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
drivers/s390/block/dasd_ioctl.c:335:2: error: implicit declaration of function 'ccw_device_get_schid' [-Werror=implicit-function-declaration]
drivers/s390/cio/qdio_setup.c:436:2: error: implicit declaration of function 'ccw_device_get_schid' [-Werror=implicit-function-declaration]
ERROR: "far_attr_put_acl" undefined!
ERROR: "far_attr_put_timespec" undefined!
ERROR: "far_attr_put_string" undefined!
ERROR: "far_attr_put_u32" undefined!
ERROR: "far_attr_put_u64" undefined!
ERROR: "far_attr_put_path" undefined!
ERROR: "far_path_to_string" undefined!
ERROR: "far_attr_put_volume_identifier" undefined!
ERROR: "__far_debug" undefined!
ERROR: "far_attr_put" undefined!
ERROR: "far_error" undefined!
ERROR: "far_stream_read_cmd" undefined!
ERROR: "far_path_free" undefined!
ERROR: "far_attr_get_acl" undefined!
ERROR: "far_attr_get_timespec" undefined!
ERROR: "far_attr_get_string" undefined!
ERROR: "far_attr_get" undefined!
ERROR: "far_attr_get_path" undefined!
ERROR: "far_attr_get_volume_identifier" undefined!
drivers/usb/musb/tusb6010.c:202:5: error: implicit declaration of function 'iowrte32_rep' [-Werror=implicit-function-declaration]
drivers/regulator/max8925-regulator.c:311:64: error: macro "max8925_regulator_dt_init" passed 4 arguments, but takes just 3
drivers/regulator/max8925-regulator.c:311:6: error: 'max8925_regulator_dt_init' undeclared (first use in this function)
gcc: error: arch/x86/lib/memmove_64.c: No such file or directory
net/socket.c:623:2: error: too many arguments to function 'sock_update_classid'
drivers/net/tun.c:590:2: error: too many arguments to function 'sock_update_classid'

[warnings]
arch/arm/kernel/smp_twd.c:370:3: warning: 'return' with a value, in function returning void [enabled by default]
drivers/gpio/gpiolib-of.c:275:2: warning: passing argument 1 of 'gpiochip_remove_pin_ranges' from incompatible pointer type [enabled by default]
net/ceph/ceph_common.c:249:7: warning: assignment makes pointer from integer without a cast [enabled by default]
net/ceph/crypto.c:426:50: warning: 'struct key_preparsed_payload' declared inside parameter list [enabled by default]
net/ceph/crypto.c:426:50: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
net/ceph/crypto.c:474:2: warning: excess elements in struct initializer [enabled by default]
net/ceph/crypto.c:474:2: warning: (near initialization for 'key_type_ceph') [enabled by default]
net/ceph/crypto.c:464:1: warning: control reaches end of non-void function [-Wreturn-type]
net/dns_resolver/dns_key.c:237:2: warning: excess elements in struct initializer [enabled by default]
net/dns_resolver/dns_key.c:237:2: warning: (near initialization for 'key_type_dns_resolver') [enabled by default]
net/dns_resolver/dns_query.c:124:7: warning: assignment makes pointer from integer without a cast [enabled by default]
warning: (CEPH_LIB_USE_DNS_RESOLVER && NFS_USE_KERNEL_DNS && CIFS_UPCALL && CIFS_DFS_UPCALL && CIFS_SMB2 && AFS_FS) selects DNS_RESOLVER which has unmet direct dependencies (NET && KEYS)
WARNING: drivers/video/omap2/dss/omapdss.o(.init.text+0x4082): Section mismatch in reference from the function hdmi_probe_pdata() to the function .exit.text:hdmi_uninit_display.isra.10()
drivers/target/target_core_sbc.c:555:20: warning: assignment from incompatible pointer type [enabled by default]
include/uapi/linux/byteorder/big_endian.h:14:0: warning: "__constant_htonl" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:15:0: warning: "__constant_ntohl" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:16:0: warning: "__constant_htons" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:17:0: warning: "__constant_ntohs" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:18:0: warning: "__constant_cpu_to_le64" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:19:0: warning: "__constant_le64_to_cpu" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:20:0: warning: "__constant_cpu_to_le32" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:21:0: warning: "__constant_le32_to_cpu" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:22:0: warning: "__constant_cpu_to_le16" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:23:0: warning: "__constant_le16_to_cpu" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:24:0: warning: "__constant_cpu_to_be64" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:25:0: warning: "__constant_be64_to_cpu" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:26:0: warning: "__constant_cpu_to_be32" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:27:0: warning: "__constant_be32_to_cpu" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:28:0: warning: "__constant_cpu_to_be16" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:29:0: warning: "__constant_be16_to_cpu" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:30:0: warning: "__cpu_to_le64" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:31:0: warning: "__le64_to_cpu" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:32:0: warning: "__cpu_to_le32" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:33:0: warning: "__le32_to_cpu" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:34:0: warning: "__cpu_to_le16" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:35:0: warning: "__le16_to_cpu" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:36:0: warning: "__cpu_to_be64" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:37:0: warning: "__be64_to_cpu" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:38:0: warning: "__cpu_to_be32" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:39:0: warning: "__be32_to_cpu" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:40:0: warning: "__cpu_to_be16" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:41:0: warning: "__be16_to_cpu" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:91:0: warning: "__cpu_to_le64s" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:92:0: warning: "__le64_to_cpus" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:93:0: warning: "__cpu_to_le32s" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:94:0: warning: "__le32_to_cpus" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:95:0: warning: "__cpu_to_le16s" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:96:0: warning: "__le16_to_cpus" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:97:0: warning: "__cpu_to_be64s" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:98:0: warning: "__be64_to_cpus" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:99:0: warning: "__cpu_to_be32s" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:100:0: warning: "__be32_to_cpus" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:101:0: warning: "__cpu_to_be16s" redefined [enabled by default]
include/uapi/linux/byteorder/big_endian.h:102:0: warning: "__be16_to_cpus" redefined [enabled by default]
fs/far/far-path.c:121:3: warning: return makes pointer from integer without a cast [enabled by default]
drivers/md/persistent-data/dm-btree.c:282:22: warning: 'f' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/x86/include/asm/swab.h:21:2: warning: 'addr[0]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/asm-generic/gpio.h:74:10: warning: 'struct gpio_chip' declared inside parameter list [enabled by default]
include/asm-generic/gpio.h:74:10: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/asm-generic/gpio.h:76:1: warning: no return statement in function returning non-void [-Wreturn-type]
drivers/gpio/gpiolib.c:1128:2: warning: passing argument 1 of 'gpiochip_remove_pin_ranges' from incompatible pointer type [enabled by default]
drivers/target/target_core_alua.c:373:2: warning: 'rc' may be used uninitialized in this function [-Wuninitialized]
drivers/target/target_core_pr.c:2057:17: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/video/omap2/dss/dispc.c:3320:6: sparse: symbol 'dispc_dump_irqs' was not declared. Should it be static?
fs/far/far-stream.c:49:33: sparse: incorrect type in argument 2 (different address spaces)
fs/far/far-stream.c:188:63: sparse: restricted __le32 degrades to integer
fs/btrfs/send.c:1683:51: sparse: incorrect type in argument 5 (different base types)
fs/btrfs/send.c:3102:50: sparse: incorrect type in argument 2 (different address spaces)
drivers/target/target_core_spc.c:1008:21: sparse: incorrect type in assignment (different base types)
drivers/target/target_core_spc.c:1035:16: sparse: incorrect type in return expression (different base types)
drivers/target/target_core_sbc.c:555:34: sparse: incorrect type in assignment (different base types)
drivers/usb/musb/tusb6010.c:202:33: sparse: undefined identifier 'iowrte32_rep'
kernel/trace/trace_irqsoff.c:500:6: sparse: symbol 'trace_hardirqs_on_caller' was not declared. Should it be static?
kernel/trace/trace_irqsoff.c:507:6: sparse: symbol 'trace_hardirqs_off_caller' was not declared. Should it be static?

[smatch]
fs/btrfs/send.c:4160 btrfs_ioctl_send() error: we previously assumed 'sctx->clone_roots' could be null (see line 4063)
drivers/staging/ced1401/ced_ioc.c:918 GetTransfer() error: potential null dereference 'tx'.  (kzalloc returns null)
drivers/staging/wlan-ng/prism2fw.c:773 read_cardpda() error: potential null dereference 'msg'.  (kmalloc returns null)
drivers/misc/lkdtm.c:270 recursive_loop() error: __builtin_memset() 'buf' too small (512 vs 1024)
drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:1123 vmw_execbuf_process() info: why not propagate 'ret' from mutex_lock_interruptible() instead of -512?
drivers/net/wireless/ti/wlcore/main.c:4994 wl1271_sysfs_read_fwlog() info: why not propagate 'ret' from mutex_lock_interruptible() instead of -512?
drivers/net/can/softing/softing_main.c:604 store_output() info: why not propagate 'ret' from mutex_lock_interruptible() instead of -512?
drivers/media/usb/pvrusb2/pvrusb2-eeprom.c:129 pvr2_eeprom_analyze() warn: function puts 568 bytes on stack
drivers/media/usb/dvb-usb-v2/mxl111sf.c:903 mxl111sf_init() warn: function puts 508 bytes on stack
drivers/media/usb/dvb-usb-v2/lmedm04.c:189 lme2510_usb_talk() info: why not propagate 'ret' from mutex_lock_interruptible() instead of -11?
drivers/media/pci/cx18/cx18-driver.c:328 cx18_read_eeprom() warn: function puts 744 bytes on stack
drivers/hid/usbhid/hiddev.c:357 hiddev_read() info: why not propagate 'retval' from mutex_lock_interruptible() instead of -512?
drivers/staging/wlan-ng/prism2fw.c:773 read_cardpda() warn: returning -1 instead of -ENOMEM is sloppy

[coccinelle]
drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:517:1-7: preceding lock on line 494

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
