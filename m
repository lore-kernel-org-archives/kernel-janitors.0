From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 27 Mar 2013 17:02:25 +0000
Subject: build regressions 2013-03-27
Message-Id: <51532621.U8gTgPcL+fiTxz7x%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-shmobile/board-marzen.c:107:15: error: 'MMC_CAP_SD_HIGHSPEED' undeclared here (not in a function)
drivers/video/console/fonts.c:71:2: error: #error No fonts configured.
ERROR: "snd_soc_register_component" undefined!
ERROR: "snd_soc_unregister_component" undefined!
drivers/md/bcache/btree.c:733:11: error: 'struct shrinker' has no member named 'shrink'
drivers/md/bcache/sysfs.c:538:12: error: 'struct shrinker' has no member named 'shrink'
initramfs.c:(.init.text+0x32f6): undefined reference to `__initramfs_size'
sound/soc/mid-x86/sst_platform.c:661:26: error: 'struct compress_sst_ops' has no member named 'set_metadata'
ubuntu/aufs/file.h:289:5: error: 'struct vm_area_struct' has no member named 'vm_prfile'
ubuntu/aufs/file.h:289:5: error: 'struct vm_area_struct' has no member named 'vm_prfile'
ubuntu/aufs/hfsnotify.c:74:2: error: too few arguments to function 'fsnotify_destroy_mark'
ubuntu/aufs/file.h:289:5: error: 'struct vm_area_struct' has no member named 'vm_prfile'
ubuntu/aufs/vdir.c:525:2: error: implicit declaration of function '__getname_gfp' [-Werror=implicit-function-declaration]
(*ABS*+0xbce71ec4): multiple definition of `__crc_bio_alloc_pages'
(.text+0x13b1542): multiple definition of `bio_alloc_pages'
fs/built-in.o:(.text+0x2a318): first defined here
sound/soc/codecs/wm5102.c:815:1: error: implicit declaration of function 'SOC_VAL_ENUM' [-Werror=implicit-function-declaration]
sound/soc/codecs/wm5102.c:815:1: error: initializer element is not constant
sound/soc/codecs/wm5102.c:816:1: error: initializer element is not constant
sound/soc/codecs/wm5102.c:817:1: error: initializer element is not constant
sound/soc/codecs/wm5102.c:819:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:819:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:819:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:819:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:819:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:819:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:820:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:820:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:820:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:820:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:820:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:820:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:822:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:822:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:822:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:822:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:822:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:822:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:825:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:825:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:825:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:825:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:825:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:825:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:827:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:827:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:827:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:827:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:827:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:827:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:827:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:827:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:829:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:829:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:829:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:829:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:829:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:829:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:831:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:831:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:831:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:831:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:831:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:831:1: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:831:203: error: unknown field 'iface' specified in initializer
sound/soc/codecs/wm5102.c:831:203: error: unknown field 'name' specified in initializer
sound/soc/codecs/wm5102.c:831:203: error: unknown field 'info' specified in initializer
sound/soc/codecs/wm5102.c:831:203: error: unknown field 'get' specified in initializer
sound/soc/codecs/wm5102.c:831:203: error: unknown field 'put' specified in initializer
sound/soc/codecs/wm5102.c:831:203: error: unknown field 'private_value' specified in initializer
sound/soc/codecs/wm5102.c:831:525: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:831:525: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:831:525: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:831:525: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:831:525: error: field name not in record or union initializer
sound/soc/codecs/wm5102.c:831:525: error: field name not in record or union initializer
fs/super.c:98:22: error: macro "mult_frac" requires 3 arguments, but only 2 given
fs/super.c:97:16: error: 'mult_frac' undeclared (first use in this function)
ERROR: "dev_pm_qos_flags" [drivers/usb/core/usbcore.ko] undefined!
bgrt.c:(.text+0xe5a71): undefined reference to `bgrt_tab'
bgrt.c:(.text+0xe5a91): undefined reference to `bgrt_tab'
bgrt.c:(.text+0xe5b51): undefined reference to `bgrt_tab'
bgrt.c:(.text+0xe5b71): undefined reference to `bgrt_tab'
bgrt.c:(.text+0xe5c31): undefined reference to `bgrt_tab'
ERROR: "memory_start" [fs/udf/udf.ko] undefined!
ERROR: "memory_end" [fs/udf/udf.ko] undefined!
ERROR: "memory_end" [drivers/scsi/sg.ko] undefined!
ERROR: "memory_start" [drivers/scsi/sg.ko] undefined!
ERROR: "memory_end" [drivers/i2c/i2c-dev.ko] undefined!
ERROR: "memory_start" [drivers/i2c/i2c-dev.ko] undefined!
ERROR: "memory_start" [fs/udf/udf.ko] undefined!
ERROR: "memory_end" [fs/udf/udf.ko] undefined!
ERROR: "memory_end" [drivers/scsi/sg.ko] undefined!
ERROR: "memory_start" [drivers/scsi/sg.ko] undefined!
ERROR: "memory_end" [drivers/i2c/i2c-dev.ko] undefined!
ERROR: "memory_start" [drivers/i2c/i2c-dev.ko] undefined!
ERROR: "strlen" [net/ipv4/ip_tunnel.ko] undefined!
mm/huge_memory.c:221:7: error: incompatible types when assigning to type 'pmd_t' from type 'int'
mm/huge_memory.c:250:9: error: incompatible types when assigning to type 'pmd_t' from type 'int'
mm/huge_memory.c:252:9: error: incompatible types when assigning to type 'pmd_t' from type 'int'
mm/huge_memory.c:352:6: error: incompatible types when assigning to type 'pmd_t' from type 'int'
mm/huge_memory.c:481:9: error: incompatible types when assigning to type 'pmd_t' from type 'int'
mm/huge_memory.c:514:9: error: incompatible types when assigning to type 'pmd_t' from type 'int'
mm/huge_memory.c:516:9: error: incompatible types when assigning to type 'pmd_t' from type 'int'
mm/huge_memory.c:555:8: error: incompatible types when assigning to type 'pmd_t' from type 'int'
drivers/net/ethernet/3com/3c59x.c:1038:3: error: implicit declaration of function 'pci_iounmap' [-Werror=implicit-function-declaration]
kernel/signal.c:489:9: error: 'struct sigaction' has no member named 'sa_restorer'
lib/mpi/generic_mpih-mul1.c:50:3: error: inconsistent operand constraints in an 'asm'
lib/mpi/generic_mpih-mul2.c:49:3: error: inconsistent operand constraints in an 'asm'
lib/mpi/generic_mpih-mul3.c:49:3: error: inconsistent operand constraints in an 'asm'
lib/mpi/mpih-div.c:97:5: error: inconsistent operand constraints in an 'asm'
lib/mpi/mpih-div.c:97:5: error: inconsistent operand constraints in an 'asm'
lib/mpi/mpih-div.c:106:4: error: inconsistent operand constraints in an 'asm'
lib/mpi/mpih-div.c:106:4: error: inconsistent operand constraints in an 'asm'
lib/mpi/mpih-div.c:135:5: error: inconsistent operand constraints in an 'asm'
lib/mpi/mpih-div.c:135:5: error: inconsistent operand constraints in an 'asm'
drivers/md/dm-raid.c:1308:4: error: expected declaration specifiers or '...' before '{' token
drivers/md/dm-raid.c:1604:19: error: storage class specified for parameter 'dm_raid_init'
drivers/md/dm-raid.c:1604:19: error: section attribute not allowed for 'dm_raid_init'
drivers/md/dm-raid.c:1604:19: error: 'no_instrument_function' attribute applies only to functions
drivers/md/dm-raid.c:1605:1: error: expected ';', ',' or ')' before '{' token
drivers/net/wireless/libertas/if_cs.c:786:3: error: implicit declaration of function 'ioport_unmap' [-Werror=implicit-function-declaration]
drivers/net/wireless/libertas/if_cs.c:841:2: error: implicit declaration of function 'ioport_map' [-Werror=implicit-function-declaration]
drivers/net/wireless/orinoco/orinoco_cs.c:154:2: error: implicit declaration of function 'ioport_map' [-Werror=implicit-function-declaration]
drivers/net/wireless/orinoco/orinoco_cs.c:206:3: error: implicit declaration of function 'ioport_unmap' [-Werror=implicit-function-declaration]
drivers/net/wireless/orinoco/spectrum_cs.c:217:2: error: implicit declaration of function 'ioport_map' [-Werror=implicit-function-declaration]
drivers/net/wireless/orinoco/spectrum_cs.c:274:3: error: implicit declaration of function 'ioport_unmap' [-Werror=implicit-function-declaration]
drivers/net/can/sja1000/peak_pcmcia.c:626:2: error: implicit declaration of function 'ioport_unmap' [-Werror=implicit-function-declaration]
drivers/net/can/sja1000/peak_pcmcia.c:672:2: error: implicit declaration of function 'ioport_map' [-Werror=implicit-function-declaration]
include/asm-generic/gpio.h:270:2: error: implicit declaration of function '__gpio_get_value' [-Werror=implicit-function-declaration]
include/asm-generic/gpio.h:276:2: error: implicit declaration of function '__gpio_set_value' [-Werror=implicit-function-declaration]
ERROR: "__ashrdi3" [fs/xfs/xfs.ko] undefined!
ERROR: "min_low_pfn" [drivers/block/aoe/aoe.ko] undefined!
ERROR: "max_low_pfn" [drivers/block/aoe/aoe.ko] undefined!
usr/include/linux/types.h:27:1: error: unknown type name '__u16'
usr/include/linux/types.h:28:1: error: unknown type name '__u16'
usr/include/linux/types.h:29:1: error: unknown type name '__u32'
usr/include/linux/types.h:30:1: error: unknown type name '__u32'
usr/include/linux/types.h:31:1: error: unknown type name '__u64'
usr/include/linux/types.h:32:1: error: unknown type name '__u64'
usr/include/linux/types.h:34:1: error: unknown type name '__u16'
usr/include/linux/types.h:35:1: error: unknown type name '__u32'
usr/include/linux/netlink.h:37:2: error: unknown type name '__u32'
usr/include/linux/netlink.h:38:9: error: unknown type name '__u32'
usr/include/linux/netlink.h:42:2: error: unknown type name '__u32'
usr/include/linux/netlink.h:43:2: error: unknown type name '__u16'
usr/include/linux/netlink.h:44:2: error: unknown type name '__u16'
usr/include/linux/netlink.h:45:2: error: unknown type name '__u32'
usr/include/linux/netlink.h:46:2: error: unknown type name '__u32'
usr/include/linux/netlink.h:110:2: error: unknown type name '__u32'
usr/include/linux/netlink.h:130:2: error: unknown type name '__u16'
usr/include/linux/netlink.h:131:2: error: unknown type name '__u16'
usr/include/linux/genetlink.h:13:2: error: unknown type name '__u8'
usr/include/linux/genetlink.h:14:2: error: unknown type name '__u8'
usr/include/linux/genetlink.h:15:2: error: unknown type name '__u16'
usr/include/linux/taskstats.h:46:2: error: unknown type name '__u16'
usr/include/linux/taskstats.h:47:2: error: unknown type name '__u32'
usr/include/linux/taskstats.h:52:2: error: unknown type name '__u8'
usr/include/linux/taskstats.h:53:2: error: unknown type name '__u8'
usr/include/linux/taskstats.h:71:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:72:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:79:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:80:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:83:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:84:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:92:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:100:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:106:2: error: unknown type name '__u8'
usr/include/linux/taskstats.h:108:2: error: unknown type name '__u8'
usr/include/linux/taskstats.h:109:2: error: unknown type name '__u32'
usr/include/linux/taskstats.h:111:2: error: unknown type name '__u32'
usr/include/linux/taskstats.h:112:2: error: unknown type name '__u32'
usr/include/linux/taskstats.h:113:2: error: unknown type name '__u32'
usr/include/linux/taskstats.h:114:2: error: unknown type name '__u32'
usr/include/linux/taskstats.h:115:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:117:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:118:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:119:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:120:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:130:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:134:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:139:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:140:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:143:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:144:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:145:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:146:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:151:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:152:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:153:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:155:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:156:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:159:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:160:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:161:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:164:2: error: unknown type name '__u64'
usr/include/linux/taskstats.h:165:2: error: unknown type name '__u64'
usr/include/linux/cgroupstats.h:32:2: error: unknown type name '__u64'
usr/include/linux/cgroupstats.h:33:2: error: unknown type name '__u64'
usr/include/linux/cgroupstats.h:34:2: error: unknown type name '__u64'
usr/include/linux/cgroupstats.h:35:2: error: unknown type name '__u64'
usr/include/linux/cgroupstats.h:37:2: error: unknown type name '__u64'
Documentation/accounting/getdelays.c:118:29: error: unknown type name '__u16'
Documentation/accounting/getdelays.c:118:47: error: unknown type name '__u32'
Documentation/accounting/getdelays.c:119:7: error: unknown type name '__u8'
Documentation/accounting/getdelays.c:119:22: error: unknown type name '__u16'
Documentation/accounting/getdelays.c:189:10: error: '__u16' undeclared (first use in this function)
Documentation/accounting/getdelays.c:189:17: error: expected expression before ')' token
Documentation/accounting/getdelays.c:259:2: error: unknown type name '__u16'
Documentation/accounting/getdelays.c:260:2: error: unknown type name '__u32'
Documentation/accounting/getdelays.c:416:33: error: '__u32' undeclared (first use in this function)
usr/include/linux/types.h:27:1: error: unknown type name '__u16'
usr/include/linux/types.h:28:1: error: unknown type name '__u16'
usr/include/linux/types.h:29:1: error: unknown type name '__u32'
usr/include/linux/types.h:30:1: error: unknown type name '__u32'
usr/include/linux/types.h:31:1: error: unknown type name '__u64'
usr/include/linux/types.h:32:1: error: unknown type name '__u64'
usr/include/linux/types.h:34:1: error: unknown type name '__u16'
usr/include/linux/types.h:35:1: error: unknown type name '__u32'
usr/include/linux/netlink.h:37:2: error: unknown type name '__u32'
usr/include/linux/netlink.h:38:9: error: unknown type name '__u32'
usr/include/linux/netlink.h:42:2: error: unknown type name '__u32'
usr/include/linux/netlink.h:43:2: error: unknown type name '__u16'
usr/include/linux/netlink.h:44:2: error: unknown type name '__u16'
usr/include/linux/netlink.h:45:2: error: unknown type name '__u32'
usr/include/linux/netlink.h:46:2: error: unknown type name '__u32'
usr/include/linux/netlink.h:110:2: error: unknown type name '__u32'
usr/include/linux/netlink.h:130:2: error: unknown type name '__u16'
usr/include/linux/netlink.h:131:2: error: unknown type name '__u16'
usr/include/linux/if_link.h:9:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:10:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:11:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:12:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:13:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:14:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:15:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:16:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:17:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:18:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:21:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:22:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:23:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:24:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:25:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:26:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:29:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:30:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:31:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:32:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:33:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:36:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:37:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:42:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:43:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:44:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:45:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:46:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:47:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:48:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:49:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:50:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:51:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:54:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:55:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:56:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:57:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:58:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:59:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:62:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:63:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:64:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:65:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:66:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:69:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:70:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:75:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:76:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:77:2: error: unknown type name '__u64'
usr/include/linux/if_link.h:78:2: error: unknown type name '__u16'
usr/include/linux/if_link.h:79:2: error: unknown type name '__u8'
usr/include/linux/if_link.h:80:2: error: unknown type name '__u8'
usr/include/linux/if_link.h:225:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:226:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:227:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:228:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:255:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:256:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:268:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:269:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:339:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:340:2: error: unknown type name '__u8'
usr/include/linux/if_link.h:344:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:345:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:346:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:350:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:351:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:355:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:356:2: error: unknown type name '__u32'
usr/include/linux/if_link.h:425:2: error: unknown type name '__u8'
usr/include/linux/if_link.h:426:2: error: unknown type name '__u8'
usr/include/linux/if_link.h:427:2: error: unknown type name '__u8'
usr/include/linux/if_link.h:428:2: error: unknown type name '__u8'
usr/include/linux/if_addr.h:8:2: error: unknown type name '__u8'
usr/include/linux/if_addr.h:9:2: error: unknown type name '__u8'
usr/include/linux/if_addr.h:10:2: error: unknown type name '__u8'
usr/include/linux/if_addr.h:11:2: error: unknown type name '__u8'
usr/include/linux/if_addr.h:12:2: error: unknown type name '__u32'
usr/include/linux/if_addr.h:49:2: error: unknown type name '__u32'
usr/include/linux/if_addr.h:50:2: error: unknown type name '__u32'
usr/include/linux/if_addr.h:51:2: error: unknown type name '__u32'
usr/include/linux/if_addr.h:52:2: error: unknown type name '__u32'
usr/include/linux/neighbour.h:8:2: error: unknown type name '__u8'
usr/include/linux/neighbour.h:9:2: error: unknown type name '__u8'
usr/include/linux/neighbour.h:10:2: error: unknown type name '__u16'
usr/include/linux/neighbour.h:11:2: error: unknown type name '__s32'
usr/include/linux/neighbour.h:12:2: error: unknown type name '__u16'
usr/include/linux/neighbour.h:13:2: error: unknown type name '__u8'
usr/include/linux/neighbour.h:14:2: error: unknown type name '__u8'
usr/include/linux/neighbour.h:61:2: error: unknown type name '__u32'
usr/include/linux/neighbour.h:62:2: error: unknown type name '__u32'
usr/include/linux/neighbour.h:63:2: error: unknown type name '__u32'
usr/include/linux/neighbour.h:64:2: error: unknown type name '__u32'
usr/include/linux/neighbour.h:93:2: error: unknown type name '__u64'
usr/include/linux/neighbour.h:94:2: error: unknown type name '__u64'
usr/include/linux/neighbour.h:95:2: error: unknown type name '__u64'
usr/include/linux/neighbour.h:96:2: error: unknown type name '__u64'
usr/include/linux/neighbour.h:97:2: error: unknown type name '__u64'
usr/include/linux/neighbour.h:98:2: error: unknown type name '__u64'
usr/include/linux/neighbour.h:99:2: error: unknown type name '__u64'
usr/include/linux/neighbour.h:100:2: error: unknown type name '__u64'
usr/include/linux/neighbour.h:101:2: error: unknown type name '__u64'
usr/include/linux/neighbour.h:102:2: error: unknown type name '__u64'
usr/include/linux/neighbour.h:128:2: error: unknown type name '__u8'
usr/include/linux/neighbour.h:129:2: error: unknown type name '__u8'
usr/include/linux/neighbour.h:130:2: error: unknown type name '__u16'
usr/include/linux/neighbour.h:134:2: error: unknown type name '__u16'
usr/include/linux/neighbour.h:135:2: error: unknown type name '__u16'
usr/include/linux/neighbour.h:136:2: error: unknown type name '__u32'
usr/include/linux/neighbour.h:137:2: error: unknown type name '__u32'
usr/include/linux/neighbour.h:138:2: error: unknown type name '__u32'
usr/include/linux/neighbour.h:139:2: error: unknown type name '__u32'
usr/include/linux/neighbour.h:140:2: error: unknown type name '__u32'
usr/include/linux/neighbour.h:141:2: error: unknown type name '__u32'
usr/include/linux/neighbour.h:142:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:344:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:345:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:346:2: error: unknown type name '__s32'
usr/include/linux/rtnetlink.h:347:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:348:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:351:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:352:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:353:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:400:2: error: unknown type name '__u8'
usr/include/linux/rtnetlink.h:401:2: error: unknown type name '__u8'
usr/include/linux/rtnetlink.h:402:2: error: unknown type name '__u16'
usr/include/linux/rtnetlink.h:406:4: error: unknown type name '__u16'
usr/include/linux/rtnetlink.h:407:4: error: unknown type name '__u16'
usr/include/linux/rtnetlink.h:411:4: error: unknown type name '__u8'
usr/include/linux/rtnetlink.h:412:4: error: unknown type name '__u8'
usr/include/linux/rtnetlink.h:413:4: error: unknown type name '__u16'
usr/include/linux/rtnetlink.h:416:3: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:421:2: error: unknown type name '__u64'
usr/include/linux/rtnetlink.h:422:2: error: unknown type name '__u64'
usr/include/linux/rtnetlink.h:423:2: error: unknown type name '__u64'
usr/include/linux/rtnetlink.h:478:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:479:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:492:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:493:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:494:2: error: unknown type name '__u32'
usr/include/linux/rtnetlink.h:524:2: error: unknown type name '__u8'
usr/include/linux/rtnetlink.h:525:2: error: unknown type name '__u8'
usr/include/linux/connector.h:62:2: error: unknown type name '__u32'
usr/include/linux/connector.h:63:2: error: unknown type name '__u32'
usr/include/linux/connector.h:69:2: error: unknown type name '__u32'
usr/include/linux/connector.h:70:2: error: unknown type name '__u32'
usr/include/linux/connector.h:72:2: error: unknown type name '__u16'
usr/include/linux/connector.h:73:2: error: unknown type name '__u16'
usr/include/linux/connector.h:74:2: error: unknown type name '__u8'
Documentation/connector/ucon.c:58:1: error: unknown type name '__u32'
usr/include/linux/types.h:27:1: error: unknown type name '__u16'
usr/include/linux/types.h:28:1: error: unknown type name '__u16'
usr/include/linux/types.h:29:1: error: unknown type name '__u32'
usr/include/linux/types.h:30:1: error: unknown type name '__u32'
usr/include/linux/types.h:31:1: error: unknown type name '__u64'
usr/include/linux/types.h:32:1: error: unknown type name '__u64'
usr/include/linux/types.h:34:1: error: unknown type name '__u16'
usr/include/linux/types.h:35:1: error: unknown type name '__u32'
usr/include/linux/uuid.h:28:2: error: unknown type name '__u8'
usr/include/linux/uuid.h:32:2: error: unknown type name '__u8'
usr/include/linux/mei.h:95:2: error: unknown type name '__u32'
usr/include/linux/mei.h:96:2: error: unknown type name '__u8'
usr/include/linux/mei.h:97:2: error: unknown type name '__u8'
usr/include/linux/types.h:27:1: error: unknown type name '__u16'
usr/include/linux/types.h:28:1: error: unknown type name '__u16'
usr/include/linux/types.h:29:1: error: unknown type name '__u32'
usr/include/linux/types.h:30:1: error: unknown type name '__u32'
usr/include/linux/types.h:31:1: error: unknown type name '__u64'
usr/include/linux/types.h:32:1: error: unknown type name '__u64'
usr/include/linux/types.h:34:1: error: unknown type name '__u16'
usr/include/linux/types.h:35:1: error: unknown type name '__u32'
usr/include/linux/if_bonding.h:96:2: error: unknown type name '__s32'
usr/include/linux/if_bonding.h:97:2: error: unknown type name '__s32'
usr/include/linux/if_bonding.h:98:2: error: unknown type name '__s32'
usr/include/linux/if_bonding.h:102:2: error: unknown type name '__s32'
usr/include/linux/if_bonding.h:104:2: error: unknown type name '__s8'
usr/include/linux/if_bonding.h:105:2: error: unknown type name '__s8'
usr/include/linux/if_bonding.h:106:2: error: unknown type name '__u32'
usr/include/linux/if_bonding.h:110:2: error: unknown type name '__u16'
usr/include/linux/if_bonding.h:111:2: error: unknown type name '__u16'
usr/include/linux/if_bonding.h:112:2: error: unknown type name '__u16'
usr/include/linux/if_bonding.h:113:2: error: unknown type name '__u16'
usr/include/linux/if_bonding.h:114:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:21:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:22:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:23:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:24:2: error: unknown type name '__u16'
usr/include/linux/ethtool.h:28:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:29:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:30:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:34:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:35:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:36:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:39:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:40:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:41:2: error: unknown type name '__u16'
usr/include/linux/ethtool.h:45:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:46:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:49:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:50:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:54:7: error: unknown type name '__u32'
usr/include/linux/ethtool.h:61:1: error: unknown type name '__u32'
usr/include/linux/ethtool.h:84:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:99:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:100:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:101:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:102:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:103:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:109:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:110:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:111:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:112:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:117:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:118:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:123:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:124:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:125:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:126:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:131:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:132:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:133:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:134:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:135:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:156:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:157:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:158:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:159:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:160:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:161:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:162:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:163:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:164:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:178:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:179:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:180:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:181:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:257:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:258:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:259:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:260:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:261:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:262:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:263:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:264:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:265:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:266:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:267:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:268:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:269:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:270:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:271:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:272:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:273:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:274:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:275:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:276:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:277:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:278:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:279:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:284:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:290:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:291:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:292:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:293:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:298:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:299:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:300:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:301:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:321:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:322:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:323:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:324:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:325:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:326:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:327:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:328:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:329:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:334:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:346:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:347:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:348:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:362:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:363:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:364:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:365:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:369:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:370:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:371:2: error: unknown type name '__u64'
usr/include/linux/ethtool.h:373:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:398:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:399:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:400:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:401:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:402:2: error: unknown type name '__u64'
usr/include/linux/ethtool.h:407:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:408:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:409:2: error: unknown type name '__u64'
usr/include/linux/ethtool.h:413:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:414:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:415:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:456:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:472:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:490:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:491:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:492:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:503:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:518:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:542:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:547:2: error: unknown type name '__u64'
usr/include/linux/ethtool.h:548:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:604:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:605:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:606:2: error: unknown type name '__u64'
usr/include/linux/ethtool.h:608:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:609:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:627:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:628:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:629:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:649:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:658:3: error: unknown type name '__u8'
usr/include/linux/ethtool.h:661:2: error: unknown type name '__u16'
usr/include/linux/ethtool.h:662:2: error: unknown type name '__u16'
usr/include/linux/ethtool.h:663:2: error: unknown type name '__u64'
usr/include/linux/ethtool.h:664:2: error: unknown type name '__u64'
usr/include/linux/ethtool.h:666:2: error: unknown type name '__s32'
usr/include/linux/ethtool.h:677:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:688:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:689:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:711:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:712:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:713:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:714:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:715:2: error: unknown type name '__u8'
usr/include/linux/ethtool.h:728:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:729:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:730:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:731:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:742:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:743:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:753:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:754:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:764:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:765:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:783:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:784:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:785:2: error: unknown type name '__s32'
usr/include/linux/ethtool.h:786:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:787:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:788:2: error: unknown type name '__u32'
usr/include/linux/ethtool.h:789:2: error: unknown type name '__u32'
usr/include/linux/types.h:27:1: error: unknown type name '__u16'
usr/include/linux/types.h:28:1: error: unknown type name '__u16'
usr/include/linux/types.h:29:1: error: unknown type name '__u32'
usr/include/linux/types.h:30:1: error: unknown type name '__u32'
usr/include/linux/types.h:31:1: error: unknown type name '__u64'
usr/include/linux/types.h:32:1: error: unknown type name '__u64'
usr/include/linux/types.h:34:1: error: unknown type name '__u16'
usr/include/linux/types.h:35:1: error: unknown type name '__u32'
usr/include/linux/spi/spidev.h:86:2: error: unknown type name '__u64'
usr/include/linux/spi/spidev.h:87:2: error: unknown type name '__u64'
usr/include/linux/spi/spidev.h:89:2: error: unknown type name '__u32'
usr/include/linux/spi/spidev.h:90:2: error: unknown type name '__u32'
usr/include/linux/spi/spidev.h:92:2: error: unknown type name '__u16'
usr/include/linux/spi/spidev.h:93:2: error: unknown type name '__u8'
usr/include/linux/spi/spidev.h:94:2: error: unknown type name '__u8'
usr/include/linux/spi/spidev.h:95:2: error: unknown type name '__u32'
Documentation/spi/spidev_test.c:171:18: error: '__u8' undeclared (first use in this function)
Documentation/spi/spidev_test.c:193:18: error: '__u32' undeclared (first use in this function)
usr/include/linux/types.h:27:1: error: unknown type name '__u16'
usr/include/linux/types.h:28:1: error: unknown type name '__u16'
usr/include/linux/types.h:29:1: error: unknown type name '__u32'
usr/include/linux/types.h:30:1: error: unknown type name '__u32'
usr/include/linux/types.h:31:1: error: unknown type name '__u64'
usr/include/linux/types.h:32:1: error: unknown type name '__u64'
usr/include/linux/types.h:34:1: error: unknown type name '__u16'
usr/include/linux/types.h:35:1: error: unknown type name '__u32'
usr/include/linux/spi/spidev.h:86:2: error: unknown type name '__u64'
usr/include/linux/spi/spidev.h:87:2: error: unknown type name '__u64'
usr/include/linux/spi/spidev.h:89:2: error: unknown type name '__u32'
usr/include/linux/spi/spidev.h:90:2: error: unknown type name '__u32'
usr/include/linux/spi/spidev.h:92:2: error: unknown type name '__u16'
usr/include/linux/spi/spidev.h:93:2: error: unknown type name '__u8'
usr/include/linux/spi/spidev.h:94:2: error: unknown type name '__u8'
usr/include/linux/spi/spidev.h:95:2: error: unknown type name '__u32'
Documentation/spi/spidev_fdx.c:81:2: error: unknown type name '__u8'
Documentation/spi/spidev_fdx.c:82:2: error: unknown type name '__u32'
Documentation/spi/spidev_fdx.c:84:16: error: '__u8' undeclared (first use in this function)
Documentation/spi/spidev_fdx.c:96:16: error: '__u32' undeclared (first use in this function)
usr/include/linux/types.h:27:1: error: unknown type name '__u16'
usr/include/linux/types.h:28:1: error: unknown type name '__u16'
usr/include/linux/types.h:29:1: error: unknown type name '__u32'
usr/include/linux/types.h:30:1: error: unknown type name '__u32'
usr/include/linux/types.h:31:1: error: unknown type name '__u64'
usr/include/linux/types.h:32:1: error: unknown type name '__u64'
usr/include/linux/types.h:34:1: error: unknown type name '__u16'
usr/include/linux/types.h:35:1: error: unknown type name '__u32'
usr/include/linux/errqueue.h:7:2: error: unknown type name '__u32'
usr/include/linux/errqueue.h:8:2: error: unknown type name '__u8'
usr/include/linux/errqueue.h:9:2: error: unknown type name '__u8'
usr/include/linux/errqueue.h:10:2: error: unknown type name '__u8'
usr/include/linux/errqueue.h:11:2: error: unknown type name '__u8'
usr/include/linux/errqueue.h:12:2: error: unknown type name '__u32'
usr/include/linux/errqueue.h:13:2: error: unknown type name '__u32'
drivers/ptp/ptp_pch.c:567:3: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]
drivers/ptp/ptp_pch.c:617:2: error: implicit declaration of function 'ioremap' [-Werror=implicit-function-declaration]
drivers/net/ethernet/marvell/mvmdio.c:191:3: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]
make[2]: *** No rule to make target `drivers/net/wan/syncppp.c', needed by `Documentation/DocBook/networking.xml'.
make[2]: *** No rule to make target `arch/x86/include/asm/atomic_32.h', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `arch/x86/include/asm/io_32.h', needed by `Documentation/DocBook/deviceiobook.xml'.
make[2]: *** No rule to make target `block/blk-barrier.c', needed by `Documentation/DocBook/kernel-api.xml'.
unifdef: can't open usr/include/linux/aufs_type.h.tmp: No such file or directory
fs/xfs/xfs_super.c:1538:2: error: void value not ignored as it ought to be
security/integrity/ima/ima_policy.c:538:4: error: implicit declaration of function 'part_pack_uuid' [-Werror=implicit-function-declaration]
drivers/built-in.o:(.data+0x6f470): undefined reference to `il_pm_ops'
drivers/built-in.o:(.data+0x6fad0): undefined reference to `il_pm_ops'

[warnings]
init/main.c:303: warning: 'pass_all_bootoptions' defined but not used
net/ieee802154/6lowpan.c:795:4: warning: 'tag' may be used uninitialized in this function [-Wmaybe-uninitialized]
sound/soc/mid-x86/sst_platform.c:662:1: warning: control reaches end of non-void function [-Wreturn-type]
ubuntu/dm-raid4-5/dm-raid4-5.c:4501:2: warning: initialization from incompatible pointer type [enabled by default]
ubuntu/dm-raid4-5/dm-raid4-5.c:4501:2: warning: (near initialization for 'raid_target.map') [enabled by default]
ubuntu/dm-raid4-5/dm-raid4-5.c:4505:2: warning: initialization from incompatible pointer type [enabled by default]
ubuntu/dm-raid4-5/dm-raid4-5.c:4505:2: warning: (near initialization for 'raid_target.status') [enabled by default]
drivers/video/vesafb.c:70:84: warning: return from incompatible pointer type [enabled by default]
drivers/video/vesafb.c:71:82: warning: return from incompatible pointer type [enabled by default]
drivers/video/vesafb.c:72:83: warning: return from incompatible pointer type [enabled by default]
drivers/video/vesafb.c:73:84: warning: return from incompatible pointer type [enabled by default]
drivers/video/vesafb.c:75:84: warning: return from incompatible pointer type [enabled by default]
drivers/video/vesafb.c:77:82: warning: return from incompatible pointer type [enabled by default]
drivers/video/vesafb.c:79:84: warning: return from incompatible pointer type [enabled by default]
fs/exec.c:777:2: warning: passing argument 1 of 'trace_open_exec' discards 'const' qualifier from pointer target type [enabled by default]
drivers/pnp/isapnp/core.c:1107:1: warning: no return statement in function returning non-void [-Wreturn-type]
drivers/acpi/video.c:81:108: warning: return from incompatible pointer type [enabled by default]
security/apparmor/lsm.c:680:2: warning: initialization from incompatible pointer type [enabled by default]
security/apparmor/lsm.c:680:2: warning: (near initialization for 'apparmor_ops.sb_mount') [enabled by default]
ubuntu/aufs/vdir.c:525:8: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/open.c:986:5: warning: passing argument 1 of 'trace_do_sys_open' discards 'const' qualifier from pointer target type [enabled by default]
drivers/i2c/i2c-core.c:950:17: warning: unused variable 'dev' [-Wunused-variable]
drivers/ssbi/ssbi.c:330:66: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
sound/soc/codecs/wm5102.c:815:1: warning: missing braces around initializer [-Wmissing-braces]
sound/soc/codecs/wm5102.c:815:1: warning: (near initialization for 'wm5102_snd_controls[157]') [-Wmissing-braces]
sound/soc/codecs/wm5102.c:819:1: warning: braces around scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: (near initialization for 'wm5102_snd_controls[157].name') [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: initialization makes pointer from integer without a cast [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: (near initialization for 'wm5102_snd_controls[157].name') [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: (near initialization for 'wm5102_snd_controls[157].name') [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: (near initialization for 'wm5102_snd_controls[157].name') [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: (near initialization for 'wm5102_snd_controls[157].name') [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: (near initialization for 'wm5102_snd_controls[157].name') [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:819:1: warning: (near initialization for 'wm5102_snd_controls[157].name') [enabled by default]
sound/soc/codecs/wm5102.c:820:1: warning: braces around scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:820:1: warning: (near initialization for 'wm5102_snd_controls[157].index') [enabled by default]
sound/soc/codecs/wm5102.c:820:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:820:1: warning: (near initialization for 'wm5102_snd_controls[157].index') [enabled by default]
sound/soc/codecs/wm5102.c:820:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:820:1: warning: (near initialization for 'wm5102_snd_controls[157].index') [enabled by default]
sound/soc/codecs/wm5102.c:820:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:820:1: warning: (near initialization for 'wm5102_snd_controls[157].index') [enabled by default]
sound/soc/codecs/wm5102.c:820:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:820:1: warning: (near initialization for 'wm5102_snd_controls[157].index') [enabled by default]
sound/soc/codecs/wm5102.c:820:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:820:1: warning: (near initialization for 'wm5102_snd_controls[157].index') [enabled by default]
sound/soc/codecs/wm5102.c:822:1: warning: braces around scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:822:1: warning: (near initialization for 'wm5102_snd_controls[157].access') [enabled by default]
sound/soc/codecs/wm5102.c:822:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:822:1: warning: (near initialization for 'wm5102_snd_controls[157].access') [enabled by default]
sound/soc/codecs/wm5102.c:822:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:822:1: warning: (near initialization for 'wm5102_snd_controls[157].access') [enabled by default]
sound/soc/codecs/wm5102.c:822:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:822:1: warning: (near initialization for 'wm5102_snd_controls[157].access') [enabled by default]
sound/soc/codecs/wm5102.c:822:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:822:1: warning: (near initialization for 'wm5102_snd_controls[157].access') [enabled by default]
sound/soc/codecs/wm5102.c:822:191: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:822:191: warning: (near initialization for 'wm5102_snd_controls[157].access') [enabled by default]
sound/soc/codecs/wm5102.c:825:1: warning: braces around scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:825:1: warning: (near initialization for 'wm5102_snd_controls[157].count') [enabled by default]
sound/soc/codecs/wm5102.c:825:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:825:1: warning: (near initialization for 'wm5102_snd_controls[157].count') [enabled by default]
sound/soc/codecs/wm5102.c:825:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:825:1: warning: (near initialization for 'wm5102_snd_controls[157].count') [enabled by default]
sound/soc/codecs/wm5102.c:825:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:825:1: warning: (near initialization for 'wm5102_snd_controls[157].count') [enabled by default]
sound/soc/codecs/wm5102.c:825:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:825:1: warning: (near initialization for 'wm5102_snd_controls[157].count') [enabled by default]
sound/soc/codecs/wm5102.c:825:192: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:825:192: warning: (near initialization for 'wm5102_snd_controls[157].count') [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: braces around scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: (near initialization for 'wm5102_snd_controls[157].info') [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: initialization makes pointer from integer without a cast [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: (near initialization for 'wm5102_snd_controls[157].info') [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: (near initialization for 'wm5102_snd_controls[157].info') [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: (near initialization for 'wm5102_snd_controls[157].info') [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: (near initialization for 'wm5102_snd_controls[157].info') [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: (near initialization for 'wm5102_snd_controls[157].info') [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: (near initialization for 'wm5102_snd_controls[157].info') [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:827:1: warning: (near initialization for 'wm5102_snd_controls[157].info') [enabled by default]
sound/soc/codecs/wm5102.c:827:257: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:827:257: warning: (near initialization for 'wm5102_snd_controls[157].info') [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: braces around scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: (near initialization for 'wm5102_snd_controls[157].get') [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: initialization makes pointer from integer without a cast [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: (near initialization for 'wm5102_snd_controls[157].get') [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: (near initialization for 'wm5102_snd_controls[157].get') [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: (near initialization for 'wm5102_snd_controls[157].get') [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: (near initialization for 'wm5102_snd_controls[157].get') [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: (near initialization for 'wm5102_snd_controls[157].get') [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:829:1: warning: (near initialization for 'wm5102_snd_controls[157].get') [enabled by default]
sound/soc/codecs/wm5102.c:831:1: warning: braces around scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:1: warning: (near initialization for 'wm5102_snd_controls[157].put') [enabled by default]
sound/soc/codecs/wm5102.c:831:1: warning: initialization makes pointer from integer without a cast [enabled by default]
sound/soc/codecs/wm5102.c:831:1: warning: (near initialization for 'wm5102_snd_controls[157].put') [enabled by default]
sound/soc/codecs/wm5102.c:831:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:1: warning: (near initialization for 'wm5102_snd_controls[157].put') [enabled by default]
sound/soc/codecs/wm5102.c:831:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:1: warning: (near initialization for 'wm5102_snd_controls[157].put') [enabled by default]
sound/soc/codecs/wm5102.c:831:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:1: warning: (near initialization for 'wm5102_snd_controls[157].put') [enabled by default]
sound/soc/codecs/wm5102.c:831:1: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:1: warning: (near initialization for 'wm5102_snd_controls[157].put') [enabled by default]
sound/soc/codecs/wm5102.c:831:203: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:203: warning: (near initialization for 'wm5102_snd_controls[157].put') [enabled by default]
sound/soc/codecs/wm5102.c:831:203: warning: initialization makes pointer from integer without a cast [enabled by default]
sound/soc/codecs/wm5102.c:831:203: warning: (near initialization for 'wm5102_snd_controls[157].tlv.c') [enabled by default]
sound/soc/codecs/wm5102.c:831:203: warning: excess elements in union initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:203: warning: (near initialization for 'wm5102_snd_controls[157].tlv') [enabled by default]
sound/soc/codecs/wm5102.c:831:203: warning: excess elements in union initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:203: warning: (near initialization for 'wm5102_snd_controls[157].tlv') [enabled by default]
sound/soc/codecs/wm5102.c:831:203: warning: excess elements in union initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:203: warning: (near initialization for 'wm5102_snd_controls[157].tlv') [enabled by default]
sound/soc/codecs/wm5102.c:831:203: warning: excess elements in union initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:203: warning: (near initialization for 'wm5102_snd_controls[157].tlv') [enabled by default]
sound/soc/codecs/wm5102.c:831:525: warning: excess elements in union initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:525: warning: (near initialization for 'wm5102_snd_controls[157].tlv') [enabled by default]
sound/soc/codecs/wm5102.c:831:525: warning: braces around scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:525: warning: (near initialization for 'wm5102_snd_controls[157].private_value') [enabled by default]
sound/soc/codecs/wm5102.c:831:525: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:525: warning: (near initialization for 'wm5102_snd_controls[157].private_value') [enabled by default]
sound/soc/codecs/wm5102.c:831:525: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:525: warning: (near initialization for 'wm5102_snd_controls[157].private_value') [enabled by default]
sound/soc/codecs/wm5102.c:831:525: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:525: warning: (near initialization for 'wm5102_snd_controls[157].private_value') [enabled by default]
sound/soc/codecs/wm5102.c:831:525: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:525: warning: (near initialization for 'wm5102_snd_controls[157].private_value') [enabled by default]
sound/soc/codecs/wm5102.c:831:847: warning: excess elements in scalar initializer [enabled by default]
sound/soc/codecs/wm5102.c:831:847: warning: (near initialization for 'wm5102_snd_controls[157].private_value') [enabled by default]
drivers/base/regmap/internal.h:195:2: warning: return discards 'const' qualifier from pointer target type [enabled by default]
drivers/base/regmap/internal.h:195:2: warning: return discards 'const' qualifier from pointer target type [enabled by default]
drivers/md/bcache/alloc.c:184:19: warning: assignment from incompatible pointer type [enabled by default]
drivers/md/bcache/debug.c:208:19: warning: assignment from incompatible pointer type [enabled by default]
lib/dynamic_debug.c:1059:6: warning: passing argument 7 of 'parse_args' from incompatible pointer type [enabled by default]
warning: (VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
drivers/md/dm-raid.c:1605:1: warning: '__cold__' attribute ignored [-Wattributes]
drivers/tty/serial/8250/8250_core.c:1714:18: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/openvswitch/datapath.c:1791:1: warning: label 'exit_free' defined but not used [-Wunused-label]
fs/xfs/xfs_super.c:1539:1: warning: control reaches end of non-void function [-Wreturn-type]

[smatch]
drivers/firewire/net.c:1616 fwnet_probe() error: we previously assumed 'dev' could be null (see line 1561)
drivers/gpio/gpio-max730x.c:165 max7301_get_block() error: buffer overflow 'ts->port_config' 8 <= 8
drivers/media/common/siano/smsdvb-main.c:144 smsdvb_stats_not_ready() warn: missing break? reassigning 'n_layers'
drivers/media/common/siano/smscoreapi.c:395 smscore_translate_msg() error: buffer overflow 'siano_msgs' 401 <= 401
drivers/media/v4l2-core/v4l2-mem2mem.c:233 v4l2_m2m_try_schedule() error: double lock 'irqsave:flags'
drivers/media/v4l2-core/v4l2-mem2mem.c:236 v4l2_m2m_try_schedule() error: double unlock 'irqsave:flags'
drivers/media/v4l2-core/v4l2-mem2mem.c:242 v4l2_m2m_try_schedule() error: double unlock 'irqsave:flags'
drivers/usb/gadget/udc-core.c:245 usb_add_gadget_udc_release() warn: possible memory leak of 'udc'
drivers/net/caif/caif_virtio.c:743 cfv_probe() error: we previously assumed 'vdev->vringh_config' could be null (see line 674)
ipc/util.c:722 ipc_lock() warn: inconsistent returns spin_lock:&out->lock: locked (716) unlocked (722)
drivers/staging/dwc2/hcd_intr.c:1366 dwc2_hc_nyet_intr() warn: variable dereferenced before check 'qtd->urb' (see line 1365)
drivers/staging/dwc2/hcd_ddma.c:226 dwc2_update_frame_list() error: we previously assumed 'hsotg' could be null (see line 225)
drivers/usb/phy/phy-samsung-usb.c:115 samsung_usbphy_set_isolation() error: potential NULL dereference 'reg'.
drivers/usb/phy/phy-samsung-usb.h:315 samsung_usbphy_get_driver_data() error: potential NULL dereference 'match'.
mm/page_alloc.c:1958 get_page_from_freelist() warn: bitwise AND condition is false here
drivers/staging/media/go7007/go7007-driver.c:399 frame_boundary() warn: variable dereferenced before check 'vb' (see line 396)
drivers/staging/media/go7007/go7007-driver.c:549 go7007_parse_video_stream() error: we previously assumed 'vb' could be null (see line 548)
drivers/staging/media/go7007/go7007-usb.c:1040 go7007_usb_i2c_master_xfer() warn: was 'sizeof(*buf)' intended?
drivers/input/misc/ims-pcu.c:295 ims_pcu_setup_gamepad() warn: possible memory leak of 'gamepad'
drivers/media/usb/dvb-usb-v2/af9035.c:121 af9035_ctrl_msg() warn: inconsistent returns mutex:&d->usb_mutex: locked (105) unlocked (121)
drivers/media/dvb-frontends/mb86a20s.c:1919 mb86a20s_set_frontend() error: buffer overflow 'mb86a20s_subchannel' 8 <= 8
mm/page_alloc.c:1958 get_page_from_freelist() warn: bitwise AND condition is false here

[coccinelle]
drivers/usb/host/xhci-ring.c:1731:3-9: preceding lock on line 1789
drivers/usb/host/xhci-ring.c:1731:3-9: preceding lock on line 1789
drivers/usb/host/xhci-ring.c:1800:1-7: preceding lock on line 1789
drivers/md/bcache/btree.c:793:3-9: preceding lock on line 802

[cppcheck]
ubuntu/aufs/dbgaufs.c:27: error: DEBUG_FS depends upon SYSFS

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
