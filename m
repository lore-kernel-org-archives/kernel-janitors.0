From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 30 Oct 2012 17:06:58 +0000
Subject: build regressions 2012-10-30
Message-Id: <20121030170658.GA24946@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/thermal/rcar_thermal.c:214:10: error: too few arguments to function 'thermal_zone_device_register'
cat: arch/arm/boot/work92105.dtb: No such file or directory
arch/frv/mm/tlb-miss.S:178: Error: operand out of range (4294963200 not between -32768 and 32767) `setlos.p 0xfffff000,gr31'
arch/frv/mm/tlb-miss.S:193: Error: operand out of range (4294963200 not between -32768 and 32767) `setlos #0xfffff000,gr31'
arch/frv/mm/tlb-flush.S:51: Error: operand out of range (4294967295 not between -32768 and 32767) `setlos #0xffffffff,gr4'
arch/frv/kernel/break.S:219: Error: operand out of range (4294959104 not between -32768 and 32767) `setlos #0xffffe000,gr3'
arch/frv/kernel/head.S:52: Error: operand out of range (0xffffffff31ff not between 0 and 0xffff) `sethi.p %hi(~(0x80000000|0x40000000|0x08000000|0x0...'
arch/frv/kernel/setup.c:187:47: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
arch/frv/kernel/setup.c:386:2: error: 'clock_cmodes' undeclared (first use in this function)
arch/frv/kernel/entry.S:871: Error: VLIW packing constraint violation
arch/frv/kernel/process.c:194:3: error: 'chilregs' undeclared (first use in this function)
ERROR: "pkcs7_parse_message" undefined!
ERROR: "pkcs7_free_message" undefined!
include/asm-generic/gpio.h:212:2: error: implicit declaration of function '__gpio_get_value'
include/asm-generic/gpio.h:218:2: error: implicit declaration of function '__gpio_set_value'
include/linux/gpio.h:60:19: error: redefinition of 'gpio_cansleep'
include/linux/gpio.h:62:2: error: implicit declaration of function '__gpio_cansleep'
include/linux/gpio.h:67:2: error: implicit declaration of function '__gpio_to_irq'
drivers/misc/work/work-disp.c:30:27: fatal error: mach/hardware.h: No such file or directory
sound/soc/codecs/uda1380.c:548:44: error: 'struct snd_soc_pcm_runtime' has no member named 'socdev'
sound/soc/codecs/uda1380.c:549:45: error: dereferencing pointer to incomplete type
drivers/misc/work/work-keys.c:24:27: fatal error: mach/hardware.h: No such file or directory
mm/slab.c:1425:4: error: implicit declaration of function 'on_slab_lock_classes_node' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-adnp.c:272:6: error: 'struct gpio_chip' has no member named 'of_node'
drivers/hwmon/gpio-fan.c:633:21: error: 'of_gpio_fan_match' undeclared here (not in a function)
drivers/leds/leds-gpio.c:289:21: error: 'of_gpio_leds_match' undeclared here (not in a function)
ERROR: "x509_cert_parse" undefined!
ERROR: "x509_free_certificate" undefined!
ERROR: "pkcs7_free_signature" undefined!
ERROR: "pkcs7_parse_signature" undefined!
ERROR: "pkcs7_verify" undefined!
ERROR: "modsign_keyring" undefined!
ERROR: "pkcs7_validate_trust" undefined!
ERROR: "x509_key_preparse" undefined!
drivers/net/ethernet/cadence/at91_ether.c:158:16: error: invalid application of 'sizeof' to incomplete type 'struct dma_desc'
include/xen/xen-ops.h:29:11: error: unknown type name 'xen_pfn_t'

[warnings]
drivers/thermal/rcar_thermal.c:214:10: warning: passing argument 3 of 'thermal_zone_device_register' makes integer from pointer without a cast [enabled by default]
drivers/tty/serial/sh-sci.c:533:2: warning: passing argument 1 of '__raw_readb' makes pointer from integer without a cast [enabled by default]
drivers/sh/intc/access.c:78:2: warning: passing argument 1 of '__raw_readb' makes pointer from integer without a cast [enabled by default]
drivers/sh/intc/access.c:84:2: warning: passing argument 1 of '__raw_readw' makes pointer from integer without a cast [enabled by default]
drivers/sh/intc/access.c:90:2: warning: passing argument 1 of '__raw_readl' makes pointer from integer without a cast [enabled by default]
drivers/sh/intc/access.c:96:2: warning: passing argument 2 of '__raw_writeb' makes pointer from integer without a cast [enabled by default]
drivers/sh/intc/access.c:104:2: warning: passing argument 2 of '__raw_writew' makes pointer from integer without a cast [enabled by default]
drivers/sh/intc/access.c:112:2: warning: passing argument 2 of '__raw_writel' makes pointer from integer without a cast [enabled by default]
drivers/sh/intc/chip.c:99:4: warning: passing argument 1 of '__raw_readb' makes pointer from integer without a cast [enabled by default]
drivers/sh/intc/chip.c:100:4: warning: passing argument 2 of '__raw_writeb' makes pointer from integer without a cast [enabled by default]
drivers/sh/intc/chip.c:103:4: warning: passing argument 1 of '__raw_readw' makes pointer from integer without a cast [enabled by default]
drivers/sh/intc/chip.c:104:4: warning: passing argument 2 of '__raw_writew' makes pointer from integer without a cast [enabled by default]
drivers/sh/intc/chip.c:107:4: warning: passing argument 1 of '__raw_readl' makes pointer from integer without a cast [enabled by default]
drivers/sh/intc/chip.c:108:4: warning: passing argument 2 of '__raw_writel' makes pointer from integer without a cast [enabled by default]
crypto/asymmetric_keys/pkcs7_parser.c:114:10: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'long unsigned int' [-Wformat]
arch/frv/mb93090-mb00/pci-frv.c:176:24: warning: ignoring return value of 'pci_assign_resource', declared with attribute warn_unused_result [-Wunused-result]
<stdin>:1184:2: warning: #warning syscall recvmmsg not implemented [-Wcpp]
<stdin>:1187:2: warning: #warning syscall fanotify_init not implemented [-Wcpp]
<stdin>:1190:2: warning: #warning syscall fanotify_mark not implemented [-Wcpp]
<stdin>:1193:2: warning: #warning syscall prlimit64 not implemented [-Wcpp]
<stdin>:1196:2: warning: #warning syscall name_to_handle_at not implemented [-Wcpp]
<stdin>:1199:2: warning: #warning syscall open_by_handle_at not implemented [-Wcpp]
<stdin>:1202:2: warning: #warning syscall clock_adjtime not implemented [-Wcpp]
<stdin>:1205:2: warning: #warning syscall syncfs not implemented [-Wcpp]
<stdin>:1208:2: warning: #warning syscall sendmmsg not implemented [-Wcpp]
<stdin>:1214:2: warning: #warning syscall process_vm_readv not implemented [-Wcpp]
<stdin>:1217:2: warning: #warning syscall process_vm_writev not implemented [-Wcpp]
<stdin>:1220:2: warning: #warning syscall kcmp not implemented [-Wcpp]
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_syslog' changed from 16 in kernel/printk.o to 8 in kernel/sys_ni.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_set_robust_list' changed from 8 in kernel/sys_ni.o to 48 in kernel/futex.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_get_robust_list' changed from 8 in kernel/sys_ni.o to 340 in kernel/futex.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_futex' changed from 8 in kernel/sys_ni.o to 468 in kernel/futex.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_chown16' changed from 8 in kernel/sys_ni.o to 56 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_lchown16' changed from 8 in kernel/sys_ni.o to 56 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_fchown16' changed from 8 in kernel/sys_ni.o to 56 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_setregid16' changed from 8 in kernel/sys_ni.o to 56 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_setgid16' changed from 8 in kernel/sys_ni.o to 40 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_setreuid16' changed from 8 in kernel/sys_ni.o to 56 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_setuid16' changed from 8 in kernel/sys_ni.o to 40 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_setresuid16' changed from 8 in kernel/sys_ni.o to 124 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_getresuid16' changed from 8 in kernel/sys_ni.o to 392 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_setresgid16' changed from 8 in kernel/sys_ni.o to 124 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_getresgid16' changed from 8 in kernel/sys_ni.o to 392 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_setfsuid16' changed from 8 in kernel/sys_ni.o to 40 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_setfsgid16' changed from 8 in kernel/sys_ni.o to 40 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_getgroups16' changed from 8 in kernel/sys_ni.o to 280 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_setgroups16' changed from 8 in kernel/sys_ni.o to 440 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_getuid16' changed from 8 in kernel/sys_ni.o to 84 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_geteuid16' changed from 8 in kernel/sys_ni.o to 84 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_getgid16' changed from 8 in kernel/sys_ni.o to 84 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `sys_getegid16' changed from 8 in kernel/sys_ni.o to 84 in kernel/uid16.o
/opt/cross/bin/frv-linux-ld: Warning: size of symbol `early_irq_init' changed from 8 in kernel/softirq.o to 236 in kernel/irq/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `read_persistent_clock' changed from 168 in arch/frv/kernel/built-in.o to 12 in kernel/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `thread_info_cache_init' changed from 4 in init/built-in.o to 96 in kernel/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sched_clock' changed from 56 in arch/frv/kernel/built-in.o to 40 in kernel/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `arch_show_interrupts' changed from 84 in arch/frv/kernel/built-in.o to 8 in kernel/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_munlockall' changed from 8 in kernel/built-in.o to 72 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_swapoff' changed from 8 in kernel/built-in.o to 1232 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_process_vm_writev' changed from 8 in kernel/built-in.o to 36 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_remap_file_pages' changed from 8 in kernel/built-in.o to 792 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_munlock' changed from 8 in kernel/built-in.o to 112 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_mincore' changed from 8 in kernel/built-in.o to 1364 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_msync' changed from 8 in kernel/built-in.o to 468 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_swapon' changed from 8 in kernel/built-in.o to 2664 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_madvise' changed from 8 in kernel/built-in.o to 1372 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_process_vm_readv' changed from 8 in kernel/built-in.o to 32 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_mlockall' changed from 8 in kernel/built-in.o to 292 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_mprotect' changed from 8 in kernel/built-in.o to 524 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_mlock' changed from 8 in kernel/built-in.o to 280 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_mremap' changed from 8 in kernel/built-in.o to 1096 in mm/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_signalfd4' changed from 8 in kernel/built-in.o to 564 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_io_setup' changed from 8 in kernel/built-in.o to 1060 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_io_cancel' changed from 8 in kernel/built-in.o to 548 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_eventfd' changed from 8 in kernel/built-in.o to 16 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_epoll_create' changed from 8 in kernel/built-in.o to 32 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_ioprio_set' changed from 8 in kernel/built-in.o to 636 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_epoll_pwait' changed from 8 in kernel/built-in.o to 360 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_epoll_ctl' changed from 8 in kernel/built-in.o to 2324 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_epoll_wait' changed from 8 in kernel/built-in.o to 932 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_inotify_add_watch' changed from 8 in kernel/built-in.o to 780 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_signalfd' changed from 8 in kernel/built-in.o to 16 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_eventfd2' changed from 8 in kernel/built-in.o to 128 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_epoll_create1' changed from 8 in kernel/built-in.o to 416 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_timerfd_settime' changed from 8 in kernel/built-in.o to 968 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_inotify_init' changed from 8 in kernel/built-in.o to 16 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_inotify_init1' changed from 8 in kernel/built-in.o to 284 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_io_submit' changed from 8 in kernel/built-in.o to 16 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_bdflush' changed from 8 in kernel/built-in.o to 132 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_timerfd_create' changed from 8 in kernel/built-in.o to 312 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_flock' changed from 8 in kernel/built-in.o to 416 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_timerfd_gettime' changed from 8 in kernel/built-in.o to 440 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_inotify_rm_watch' changed from 8 in kernel/built-in.o to 164 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_ioprio_get' changed from 8 in kernel/built-in.o to 724 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_io_getevents' changed from 8 in kernel/built-in.o to 1052 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_io_destroy' changed from 8 in kernel/built-in.o to 144 in fs/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_msgget' changed from 8 in kernel/built-in.o to 92 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_mq_getsetattr' changed from 8 in kernel/built-in.o to 600 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_mq_unlink' changed from 8 in kernel/built-in.o to 300 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_shmdt' changed from 8 in kernel/built-in.o to 460 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_msgrcv' changed from 8 in kernel/built-in.o to 160 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_mq_open' changed from 8 in kernel/built-in.o to 788 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_semget' changed from 8 in kernel/built-in.o to 144 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_mq_timedsend' changed from 8 in kernel/built-in.o to 728 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_semctl' changed from 8 in kernel/built-in.o to 256 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_mq_notify' changed from 8 in kernel/built-in.o to 916 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_semtimedop' changed from 8 in kernel/built-in.o to 1992 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_shmctl' changed from 8 in kernel/built-in.o to 1572 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_mq_timedreceive' changed from 8 in kernel/built-in.o to 1164 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_msgsnd' changed from 8 in kernel/built-in.o to 92 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_semop' changed from 8 in kernel/built-in.o to 16 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_shmat' changed from 8 in kernel/built-in.o to 52 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_msgctl' changed from 8 in kernel/built-in.o to 1156 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_shmget' changed from 8 in kernel/built-in.o to 104 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_ipc' changed from 8 in kernel/built-in.o to 640 in ipc/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `pcibios_setup' changed from 140 in arch/frv/mb93090-mb00/built-in.o to 4 in drivers/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_recv' changed from 8 in kernel/built-in.o to 20 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_setsockopt' changed from 8 in kernel/built-in.o to 204 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_recvfrom' changed from 8 in kernel/built-in.o to 300 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_accept4' changed from 8 in kernel/built-in.o to 468 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_socket' changed from 8 in kernel/built-in.o to 220 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_socketcall' changed from 8 in kernel/built-in.o to 508 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_listen' changed from 8 in kernel/built-in.o to 152 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_recvmsg' changed from 8 in kernel/built-in.o to 136 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_bind' changed from 8 in kernel/built-in.o to 180 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_send' changed from 8 in kernel/built-in.o to 20 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_accept' changed from 8 in kernel/built-in.o to 16 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_sendto' changed from 8 in kernel/built-in.o to 288 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_recvmmsg' changed from 8 in kernel/built-in.o to 320 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_getsockname' changed from 8 in kernel/built-in.o to 164 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_getsockopt' changed from 8 in kernel/built-in.o to 168 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_shutdown' changed from 8 in kernel/built-in.o to 128 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_sendmsg' changed from 8 in kernel/built-in.o to 136 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_connect' changed from 8 in kernel/built-in.o to 188 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_socketpair' changed from 8 in kernel/built-in.o to 568 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_sendmmsg' changed from 8 in kernel/built-in.o to 12 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_getpeername' changed from 8 in kernel/built-in.o to 168 in net/built-in.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_syslog' changed from 16 in kernel/printk.o to 8 in kernel/sys_ni.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_set_robust_list' changed from 8 in kernel/sys_ni.o to 48 in kernel/futex.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_get_robust_list' changed from 8 in kernel/sys_ni.o to 348 in kernel/futex.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_futex' changed from 8 in kernel/sys_ni.o to 448 in kernel/futex.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_chown16' changed from 8 in kernel/sys_ni.o to 56 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_lchown16' changed from 8 in kernel/sys_ni.o to 56 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_fchown16' changed from 8 in kernel/sys_ni.o to 56 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_setregid16' changed from 8 in kernel/sys_ni.o to 56 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_setgid16' changed from 8 in kernel/sys_ni.o to 40 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_setreuid16' changed from 8 in kernel/sys_ni.o to 56 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_setuid16' changed from 8 in kernel/sys_ni.o to 40 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_setresuid16' changed from 8 in kernel/sys_ni.o to 124 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_getresuid16' changed from 8 in kernel/sys_ni.o to 284 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_setresgid16' changed from 8 in kernel/sys_ni.o to 124 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_getresgid16' changed from 8 in kernel/sys_ni.o to 284 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_setfsuid16' changed from 8 in kernel/sys_ni.o to 40 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_setfsgid16' changed from 8 in kernel/sys_ni.o to 40 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_getgroups16' changed from 8 in kernel/sys_ni.o to 248 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_setgroups16' changed from 8 in kernel/sys_ni.o to 484 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_getuid16' changed from 8 in kernel/sys_ni.o to 40 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_geteuid16' changed from 8 in kernel/sys_ni.o to 40 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_getgid16' changed from 8 in kernel/sys_ni.o to 40 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `sys_getegid16' changed from 8 in kernel/sys_ni.o to 40 in kernel/uid16.o
/usr/local/gcc-4.6.3-nolibc/frv-linux/bin/frv-linux-ld: Warning: size of symbol `early_irq_init' changed from 8 in kernel/softirq.o to 240 in kernel/irq/built-in.o
drivers/power/lp8788-charger.c:564:3: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/telephony/ixj.c:7502:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/block/hd.c:327:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/ppa.c:261:3: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c:264:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/misc/altera-stapl/altera-lpt.c:34:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/nuvoton-cir.c:45:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/fintek-cir.c:45:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/isdn/icn/icn.c:89:3: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/hwmon/smsc47b397.c:121:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/hwmon/sch56xx-common.c:148:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/tty/rocket_int.h:45:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/block/paride/ppc6lnx.c:131:18: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
WARNING: drivers/built-in.o(.devinit.text+0xa9b48): Section mismatch in reference from the function bbc_i2c_probe() to the function .init.text:attach_one_i2c.constprop.1()
mm/memcontrol.c:3177:3: warning: passing argument 1 of 'cancel_delayed_work_sync' from incompatible pointer type [enabled by default]
crypto/asymmetric_keys/x509_cert_parser.c:55:1: warning: data definition has no type or storage class [enabled by default]
crypto/asymmetric_keys/x509_cert_parser.c:55:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
crypto/asymmetric_keys/x509_cert_parser.c:55:1: warning: parameter names (without types) in function declaration [enabled by default]
crypto/asymmetric_keys/pkcs7_parser.c:52:1: warning: data definition has no type or storage class [enabled by default]
crypto/asymmetric_keys/pkcs7_parser.c:52:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
crypto/asymmetric_keys/pkcs7_parser.c:52:1: warning: parameter names (without types) in function declaration [enabled by default]

[sparse]
drivers/net/wireless/ath/ar5523/ar5523.c:55:19: sparse: restricted __be32 degrades to integer
drivers/net/wireless/ath/ar5523/ar5523.c:66:24: sparse: cast to restricted __be32
drivers/net/wireless/ath/ar5523/ar5523.c:113:19: sparse: incorrect type in assignment (different base types)
drivers/scsi/gdth.c:1111:41: sparse: not an lvalue
drivers/staging/telephony/ixj.c:7732:52: sparse: Expected ; at end of statement
drivers/staging/telephony/ixj.c:7732:52: sparse: got pci_resource_start
drivers/input/misc/da9055_onkey.c:26:1: sparse: Expected ; at the end of type declaration
drivers/input/misc/da9055_onkey.c:26:1: sparse: got }
drivers/input/misc/da9055_onkey.c:32:41: sparse: using member 'da9055' in incomplete struct da9055_onkey
drivers/input/misc/da9055_onkey.c:42:47: sparse: using member 'input' in incomplete struct da9055_onkey
drivers/input/misc/da9055_onkey.c:52:45: sparse: using member 'work' in incomplete struct da9055_onkey
drivers/input/misc/da9055_onkey.c:58:38: sparse: expected structure or union
drivers/input/misc/da9055_onkey.c:58:38: sparse: unknown member
drivers/input/misc/da9055_onkey.c:58:38: sparse: cast from unknown type
drivers/input/misc/da9055_onkey.c:73:16: sparse: undefined identifier 'IRQ_HANDLED'

[smatch]
drivers/net/wireless/ath/ar5523/ar5523.c:1197 ar5523_create_rateset() error: we previously assumed 'sta' could be null (see line 1193)
drivers/net/usb/sierra_net.c:647 sierra_net_get_fw_attr() info: why not propagate 'result' from usbnet_read_cmd() instead of -5?

[coccinelle]
drivers/nfc/pn544/pn544.c:697:3-22: code aligned with following code on line 699

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
