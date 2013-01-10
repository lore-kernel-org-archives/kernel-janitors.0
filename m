From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 10 Jan 2013 16:58:01 +0000
Subject: build regressions 2013-01-10
Message-Id: <50eef319.cE5ghED5QURxQ3WS%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: Input tree has errors, aborting (use -f to force output)
ERROR: "iio_triggered_buffer_setup" [drivers/iio/adc/max1363.ko] undefined!
ERROR: "iio_triggered_buffer_cleanup" [drivers/iio/adc/max1363.ko] undefined!
arch/powerpc/kernel/kgdb.c:492:2: error: '__debugger_breakx_match' undeclared (first use in this function)
arch/powerpc/kernel/exceptions-64s.S:1204: Error: attempt to move .org backwards
drivers/tty/synclink_gt.c:160:12: error: conflicting types for 'set_break'
drivers/tty/synclinkmp.c:526:12: error: conflicting types for 'set_break'
include/trace/events/writeback.h:35:1: error: dereferencing pointer to incomplete type

[warnings]
arch/arm/kernel/return_address.c:62:2: warning: #warning "TODO: return_address should use unwind tables" [-Wcpp]
arch/arm/mach-at91/pm.h:78:2: warning: #warning Assuming EB1 SDRAM controller is *NOT* used [-Wcpp]
arch/arm/kernel/return_address.c:62:2: warning: #warning "TODO: return_address should use unwind tables" [-Wcpp]
arch/arm/kernel/return_address.c:61:2: warning: #warning "TODO: return_address should use unwind tables" [-Wcpp]
arch/arm/kernel/return_address.c:62:2: warning: #warning "TODO: return_address should use unwind tables" [-Wcpp]
arch/arm/kernel/return_address.c:61:2: warning: #warning "TODO: return_address should use unwind tables" [-Wcpp]
kernel/sched/debug.c:233:2: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'u64' [-Wformat]
<stdin>:725:2: warning: #warning syscall pread64 not implemented
<stdin>:728:2: warning: #warning syscall pwrite64 not implemented
<stdin>:1139:2: warning: #warning syscall timerfd_create not implemented
<stdin>:1145:2: warning: #warning syscall fallocate not implemented
<stdin>:1148:2: warning: #warning syscall timerfd_settime not implemented
<stdin>:1151:2: warning: #warning syscall timerfd_gettime not implemented
<stdin>:1154:2: warning: #warning syscall signalfd4 not implemented
<stdin>:1157:2: warning: #warning syscall eventfd2 not implemented
<stdin>:1160:2: warning: #warning syscall epoll_create1 not implemented
<stdin>:1163:2: warning: #warning syscall dup3 not implemented
<stdin>:1166:2: warning: #warning syscall pipe2 not implemented
<stdin>:1169:2: warning: #warning syscall inotify_init1 not implemented
<stdin>:1172:2: warning: #warning syscall preadv not implemented
<stdin>:1175:2: warning: #warning syscall pwritev not implemented
<stdin>:1178:2: warning: #warning syscall rt_tgsigqueueinfo not implemented
<stdin>:1181:2: warning: #warning syscall perf_event_open not implemented
<stdin>:1184:2: warning: #warning syscall recvmmsg not implemented
<stdin>:1187:2: warning: #warning syscall fanotify_init not implemented
<stdin>:1190:2: warning: #warning syscall fanotify_mark not implemented
<stdin>:1193:2: warning: #warning syscall prlimit64 not implemented
<stdin>:1196:2: warning: #warning syscall name_to_handle_at not implemented
<stdin>:1199:2: warning: #warning syscall open_by_handle_at not implemented
<stdin>:1202:2: warning: #warning syscall clock_adjtime not implemented
<stdin>:1205:2: warning: #warning syscall syncfs not implemented
<stdin>:1208:2: warning: #warning syscall sendmmsg not implemented
<stdin>:1214:2: warning: #warning syscall process_vm_readv not implemented
<stdin>:1217:2: warning: #warning syscall process_vm_writev not implemented
<stdin>:1220:2: warning: #warning syscall kcmp not implemented
lib/crc32.c:258: warning: passing argument 4 of 'crc32_be_generic' from incompatible pointer type
lib/crc32.c:196: warning: passing argument 4 of 'crc32_le_generic' from incompatible pointer type
include/linux/rbtree_augmented.h:123: warning: '__rb_erase_color' declared inline after being called
arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined
arch/avr32/include/uapi/asm/param.h:6:1: warning: this is the location of the previous definition
drivers/spi/spi-atmel.c:1007: warning: 'atmel_spi_remove' defined but not used
arch/avr32/kernel/process.c:310: warning: assignment makes integer from pointer without a cast
<stdin>:1223:2: warning: #warning syscall finit_module not implemented
net/sunrpc/svc.c:1045: warning: unused variable 'buf'
lib/percpu-refcount.c:57: warning: value computed is not used
<stdin>:725:2: warning: #warning syscall pread64 not implemented
<stdin>:728:2: warning: #warning syscall pwrite64 not implemented
<stdin>:1139:2: warning: #warning syscall timerfd_create not implemented
<stdin>:1145:2: warning: #warning syscall fallocate not implemented
<stdin>:1148:2: warning: #warning syscall timerfd_settime not implemented
<stdin>:1151:2: warning: #warning syscall timerfd_gettime not implemented
<stdin>:1154:2: warning: #warning syscall signalfd4 not implemented
<stdin>:1157:2: warning: #warning syscall eventfd2 not implemented
<stdin>:1160:2: warning: #warning syscall epoll_create1 not implemented
<stdin>:1163:2: warning: #warning syscall dup3 not implemented
<stdin>:1166:2: warning: #warning syscall pipe2 not implemented
<stdin>:1169:2: warning: #warning syscall inotify_init1 not implemented
<stdin>:1172:2: warning: #warning syscall preadv not implemented
<stdin>:1175:2: warning: #warning syscall pwritev not implemented
<stdin>:1178:2: warning: #warning syscall rt_tgsigqueueinfo not implemented
<stdin>:1181:2: warning: #warning syscall perf_event_open not implemented
<stdin>:1184:2: warning: #warning syscall recvmmsg not implemented
<stdin>:1187:2: warning: #warning syscall fanotify_init not implemented
<stdin>:1190:2: warning: #warning syscall fanotify_mark not implemented
<stdin>:1193:2: warning: #warning syscall prlimit64 not implemented
<stdin>:1196:2: warning: #warning syscall name_to_handle_at not implemented
<stdin>:1199:2: warning: #warning syscall open_by_handle_at not implemented
<stdin>:1202:2: warning: #warning syscall clock_adjtime not implemented
<stdin>:1205:2: warning: #warning syscall syncfs not implemented
<stdin>:1208:2: warning: #warning syscall sendmmsg not implemented
<stdin>:1214:2: warning: #warning syscall process_vm_readv not implemented
<stdin>:1217:2: warning: #warning syscall process_vm_writev not implemented
<stdin>:1220:2: warning: #warning syscall kcmp not implemented
lib/crc32.c:258: warning: passing argument 4 of 'crc32_be_generic' from incompatible pointer type
lib/crc32.c:196: warning: passing argument 4 of 'crc32_le_generic' from incompatible pointer type
include/linux/rbtree_augmented.h:123: warning: '__rb_erase_color' declared inline after being called
drivers/usb/gadget/fusb300_udc.c:1550:1: warning: data definition has no type or storage class [enabled by default]
drivers/usb/gadget/fusb300_udc.c:1550:1: warning: type defaults to 'int' in declaration of 'module_platform_driver_probe' [-Wimplicit-int]
drivers/usb/gadget/fusb300_udc.c:1550:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/usb/gadget/fusb300_udc.c:1542:31: warning: 'fusb300_driver' defined but not used [-Wunused-variable]
warning: (BPCTL) selects NET_CORE which has unmet direct dependencies (NETDEVICES)
warning: (DM9000 && IP1000 && JME && FEALNX && NET_NETX && ETHOC && SH_ETH && VORTEX && ADAPTEC_STARFIRE && AMD8111_ETH && PCNET32 && ATL2 && ATL1 && ATL1E && ATL1C && BFIN_MAC && B44 && BCM63XX_ENET && EP93XX_ETH && WINBOND_840 && SUNDANCE && FTMAC100 && FS_ENET && E100 && ARM_KS8695_ETHER && KS8851 && KS8851_MLL && KSZ884X_PCI && W90P910_ETH && PCH_GBE && HAMACHI && 8139CP && 8139TOO && R8169 && R6040 && SIS900 && SIS190 && SGI_IOC3_ETH && SMC91X && PCMCIA_SMC91C92 && EPIC100 && SMC911X && SMSC911X && STMMAC_ETH && VIA_RHINE && VIA_VELOCITY && USB_PEGASUS && USB_RTL8150 && USB_USBNET && BPCTL) selects MII which has unmet direct dependencies (NETDEVICES && NET_CORE)
warning: (SINGLE_MEMORY_CHUNK) selects NEED_MULTIPLE_NODES which has unmet direct dependencies (DISCONTIGMEM || NUMA)
warning: (PREEMPT && DEBUG_ATOMIC_SLEEP) selects PREEMPT_COUNT which has unmet direct dependencies (COLDFIRE)
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && KMEMCHECK) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300) || ARCH_WANT_FRAME_POINTERS)
warning: (DVB_USB_PCTV452E) selects TTPCI_EEPROM which has unmet direct dependencies (MEDIA_SUPPORT && MEDIA_PCI_SUPPORT && MEDIA_DIGITAL_TV_SUPPORT && I2C)
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && KMEMCHECK) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300) || ARCH_WANT_FRAME_POINTERS)
WARNING: arch/powerpc/mm/built-in.o(.cpuinit.text+0x292): Section mismatch in reference from the function .fake_numa_create_new_node() to the variable .init.data:cmdline
<stdin>:1220:2: warning: #warning syscall kcmp not implemented [-Wcpp]
<stdin>:1220:2: warning: #warning syscall kcmp not implemented [-Wcpp]
<stdin>:1220:2: warning: #warning syscall kcmp not implemented [-Wcpp]
drivers/usb/gadget/m66592-udc.c:1756:1: warning: data definition has no type or storage class [enabled by default]
drivers/usb/gadget/m66592-udc.c:1756:1: warning: type defaults to 'int' in declaration of 'module_platform_driver_probe' [-Wimplicit-int]
drivers/usb/gadget/m66592-udc.c:1756:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/usb/gadget/m66592-udc.c:1748:31: warning: 'm66592_driver' defined but not used [-Wunused-variable]
drivers/usb/gadget/r8a66597-udc.c:2035:1: warning: data definition has no type or storage class [enabled by default]
drivers/usb/gadget/r8a66597-udc.c:2035:1: warning: type defaults to 'int' in declaration of 'module_platform_driver_probe' [-Wimplicit-int]
drivers/usb/gadget/r8a66597-udc.c:2035:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/usb/gadget/r8a66597-udc.c:2028:31: warning: 'r8a66597_driver' defined but not used [-Wunused-variable]
drivers/usb/otg/gpio_vbus.c:412:1: warning: data definition has no type or storage class [enabled by default]
drivers/usb/otg/gpio_vbus.c:412:1: warning: type defaults to 'int' in declaration of 'module_platform_driver_probe' [-Wimplicit-int]
drivers/usb/otg/gpio_vbus.c:412:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/usb/otg/gpio_vbus.c:401:31: warning: 'gpio_vbus_driver' defined but not used [-Wunused-variable]

[sparse]
drivers/net/wireless/ath/ath9k/ar9002_phy.c:558:6: sparse: symbol 'ar9002_hw_spectral_scan_config' was not declared. Should it be static?
arch/x86/kvm/emulate.c:4532:13: sparse: arithmetics on pointers to functions

[smatch]
net/core/netpoll.c:669 netpoll_neigh_reply() warn: potential pointer math issue ('skb_transport_header(send_skb)' is a 128 bit pointer)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
