From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 22 Jun 2013 23:28:42 +0000
Subject: build regressions 2013-06-22
Message-Id: <51c6332a.Ow9fB32D+uY+7JPR%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-omap2/omap4-restart.c:21:40: error: parameter 1 ('mode') has incomplete type
ERROR: "i2c_verify_client" [drivers/media/v4l2-core/videodev.ko] undefined!
fs/binfmt_aout.c:99:18: error: 'cprt' undeclared (first use in this function)
(.text+0x399c76): undefined reference to `snd_card_create'
(.text+0x399d70): undefined reference to `snd_ac97_bus'
(.text+0x399dd8): undefined reference to `snd_ac97_mixer'
(.text+0x399e22): undefined reference to `snd_card_register'
(.text+0x399e8e): undefined reference to `snd_card_free'
(.text+0x399f4e): undefined reference to `snd_card_free'
include/linux/fmc.h:198:36: error: macro "readl" passed 2 arguments, but takes just 1
(.entry.text+0x122b): undefined reference to `smp_trace_threshold_interrupt'
(.entry.text+0x132b): undefined reference to `smp_trace_thermal_interrupt'
amilo-rfkill.c:(.text+0x198f7c): undefined reference to `i8042_lock_chip'
amilo-rfkill.c:(.text+0x198f92): undefined reference to `i8042_command'
amilo-rfkill.c:(.text+0x198fa1): undefined reference to `i8042_unlock_chip'
v4l2-async.c:(.text+0x22923e): undefined reference to `i2c_verify_client'

[warnings]
arch/arm/kernel/smp.c:436:2: warning: initialization from incompatible pointer type [enabled by default]
arch/arm/kernel/smp.c:436:2: warning: (near initialization for 'ipi_types[1].handler') [enabled by default]
arch/arm/mach-omap2/omap4-restart.c:21:28: warning: 'enum reboot_mode' declared inside parameter list [enabled by default]
arch/arm/mach-omap2/omap4-restart.c:21:28: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
arch/arm/mach-omap2/omap4-restart.c:21:6: warning: function declaration isn't a prototype [-Wstrict-prototypes]
include/linux/dynamic_debug.h:64:16: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' [-Wformat=]
Warning(fs/splice.c:1298): No description found for parameter 'opos'
fs/binfmt_aout.c:48:15: warning: unused variable 'file' [-Wunused-variable]
include/linux/fmc.h:198:3: warning: return makes integer from pointer without a cast [enabled by default]
drivers/media/v4l2-core/v4l2-async.c:228:1: warning: 'v4l2_async_notifier_unregister' uses dynamic stack allocation [enabled by default]
fs/binfmt_elf_fdpic.c:1807:10: warning: format '%lld' expects argument of type 'long long int', but argument 2 has type 'long unsigned int' [-Wformat]
fs/binfmt_elf_fdpic.c:1807:10: warning: format '%td' expects argument of type 'ptrdiff_t', but argument 2 has type 'long unsigned int' [-Wformat]

[sparse]
fs/ext4/inode.c:3192:51: sparse: incorrect type in assignment (different base types)
fs/ext4/xattr.c:1296:29: sparse: incorrect type in assignment (different base types)

[coccinelle]
sound/soc/soc-fw.c:945:9-16: ERROR: se is NULL but dereferenced.
sound/soc/soc-fw.c:1523:8-9: ERROR: reference preceded by free on line 1523
sound/soc/soc-fw.c:1443:8-9: ERROR: reference preceded by free on line 1443
sound/soc/soc-fw.c:1483:8-9: ERROR: reference preceded by free on line 1483
sound/soc/soc-fw.c:1528:6-8: ERROR: invalid reference to the index variable of the iterator on line 1513
sound/soc/soc-fw.c:1448:6-8: ERROR: invalid reference to the index variable of the iterator on line 1433
sound/soc/soc-fw.c:1488:6-8: ERROR: invalid reference to the index variable of the iterator on line 1473
sound/soc/codecs/twl6040.c:1146:7-27: ERROR: Threaded IRQ with no primary handler requested without IRQF_ONESHOT

[cppcheck]
drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h:312: error: "Unkown compiler"
drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h:312: error: "Unkown compiler"

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
