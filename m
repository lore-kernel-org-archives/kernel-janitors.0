From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 29 Mar 2013 18:16:46 +0000
Subject: build regressions 2013-03-29
Message-Id: <5155da8e.T5VER/1Twk03ZYCZ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
/c/kernel-tests/src/stable/include/linux/math64.h:43:15: error: '__LINUX_ARM_ARCH__' undeclared (first use in this function)
/c/kernel-tests/src/stable/arch/arm/include/asm/glue-df.h:107:2: error: #error Unknown data abort handler type
/c/kernel-tests/src/stable/arch/arm/include/asm/glue-pf.h:54:2: error: #error Unknown prefetch abort handler type
/c/kernel-tests/src/stable/arch/arm/include/asm/glue-cache.h:129:2: error: #error Unknown cache maintenance model
arch/x86/kernel/cpu/mcheck/mce.c:1990:15: error: variable 'pattr' has initializer but incomplete type
arch/x86/kernel/cpu/mcheck/mce.c:1991:2: error: unknown field 'type' specified in initializer
arch/x86/kernel/cpu/mcheck/mce.c:1991:11: error: 'PERF_TYPE_TRACEPOINT' undeclared here (not in a function)
arch/x86/kernel/cpu/mcheck/mce.c:1992:2: error: unknown field 'size' specified in initializer
arch/x86/kernel/cpu/mcheck/mce.c:1992:17: error: invalid application of 'sizeof' to incomplete type 'struct perf_event_attr'
arch/x86/kernel/cpu/mcheck/mce.c:1993:2: error: unknown field 'sample_type' specified in initializer
arch/x86/kernel/cpu/mcheck/mce.c:1993:17: error: 'PERF_SAMPLE_RAW' undeclared here (not in a function)
arch/x86/kernel/cpu/mcheck/mce.c:1994:2: error: unknown field 'persistent' specified in initializer
arch/x86/kernel/cpu/mcheck/mce.c:2000:2: error: invalid use of undefined type 'struct perf_event_attr'
arch/x86/kernel/cpu/mcheck/mce.c:2000:17: error: 'event_mce_record' undeclared (first use in this function)
arch/x86/kernel/cpu/mcheck/mce.c:2001:2: error: invalid use of undefined type 'struct perf_event_attr'
arch/x86/kernel/cpu/mcheck/mce.c:2002:2: error: invalid use of undefined type 'struct perf_event_attr'
arch/x86/kernel/cpu/mcheck/mce.c:2004:2: error: implicit declaration of function 'perf_add_persistent_event' [-Werror=implicit-function-declaration]
drivers/gpu/drm/radeon/radeon_i2c.c:108:12: error: conflicting types for 'get_clock'
drivers/gpu/drm/radeon/radeon_i2c.c:134:13: error: conflicting types for 'set_clock'
drivers/video/udlfb.c:300:52: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/tty/serial/serial_core.c:694:2: error: implicit declaration of function 'irq_canonicalize' [-Werror=implicit-function-declaration]
drivers/usb/musb/tusb6010.c:946:2: error: implicit declaration of function 'irq_set_irq_type' [-Werror=implicit-function-declaration]
drivers/usb/host/oxu210hp-hcd.c:3835:2: error: implicit declaration of function 'irq_set_irq_type' [-Werror=implicit-function-declaration]
drivers/video/smscufx.c:795:52: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/base/regmap/regmap-irq.c:44:9: error: implicit declaration of function 'irq_data_get_irq_chip_data' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:148:4: error: implicit declaration of function 'handle_nested_irq' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:178:2: error: implicit declaration of function 'irq_alloc_descs' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:233:3: error: implicit declaration of function 'irq_set_chip_data' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:236:3: error: implicit declaration of function 'irq_set_nested_thread' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:243:3: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]
sound/soc/codecs/wm8903.c:2043:9: error: implicit declaration of function 'irq_get_irq_data' [-Werror=implicit-function-declaration]
drivers/tty/serial/8250/8250.c:109:24: fatal error: asm/serial.h: No such file or directory
drivers/usb/gadget/pch_udc.c:1405:3: error: implicit declaration of function 'irq_set_irq_type' [-Werror=implicit-function-declaration]
drivers/gpu/drm/udl/udl_fb.c:226:52: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/gpu/drm/ast/ast_mode.c:871:12: error: conflicting types for 'get_clock'
drivers/gpu/drm/ast/ast_mode.c:891:13: error: conflicting types for 'set_clock'
drivers/base/regmap/regmap-irq.c:81:4: error: implicit declaration of function 'irq_set_irq_wake' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:68:2: error: implicit declaration of function 'irq_set_irq_wake' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:107:3: error: implicit declaration of function 'handle_nested_irq' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:134:2: error: implicit declaration of function 'irq_set_chip_data' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:135:2: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:135:52: error: 'handle_edge_irq' undeclared (first use in this function)
drivers/mfd/arizona-irq.c:136:2: error: implicit declaration of function 'irq_set_nested_thread' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:143:2: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:229:2: error: implicit declaration of function 'irq_set_chip' [-Werror=implicit-function-declaration]
drivers/media/usb/cpia2/cpia2_core.c:2405:66: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/media/pci/zoran/zoran_driver.c:2955:14: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/firewire/ohci.c:3540:22: error: 'pci_probe' redeclared as different kind of symbol
include/linux/tty.h:699:12: error: 'acpi_uart_get_peripheral_type' defined but not used [-Werror=unused-function]
make[2]: *** No rule to make target `block/blktrace.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `arch/x86/include/asm/io_32.h', needed by `Documentation/DocBook/deviceiobook.xml'.
make[2]: *** No rule to make target `block/blk-barrier.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `arch/x86/include/asm/mca_dma.h', needed by `Documentation/DocBook/kernel-api.xml'.
drivers/iio/common/st_sensors/st_sensors_trigger.c:21:5: error: redefinition of 'st_sensors_allocate_trigger'
ERROR: "ecm_bind_config" [drivers/usb/gadget/g_nokia.ko] undefined!

[warnings]
include/linux/tty.h:701: warning: 'acpi_uart_get_peripheral_type' defined but not used
include/linux/tty.h:701: warning: 'acpi_uart_get_peripheral_type' defined but not used
warning: (BPCTL) selects NET_CORE which has unmet direct dependencies (NETDEVICES)
warning: (DM9000 && IP1000 && JME && FEALNX && NET_NETX && ETHOC && SH_ETH && VORTEX && ADAPTEC_STARFIRE && AMD8111_ETH && PCNET32 && ATL2 && ATL1 && ATL1E && ATL1C && BFIN_MAC && B44 && BCM63XX_ENET && EP93XX_ETH && WINBOND_840 && SUNDANCE && FTMAC100 && FS_ENET && E100 && ARM_KS8695_ETHER && KS8851 && KS8851_MLL && KSZ884X_PCI && W90P910_ETH && PCH_GBE && HAMACHI && 8139CP && 8139TOO && R8169 && R6040 && SIS900 && SIS190 && SGI_IOC3_ETH && SMC91X && PCMCIA_SMC91C92 && EPIC100 && SMC911X && SMSC911X && STMMAC_ETH && VIA_RHINE && VIA_VELOCITY && USB_PEGASUS && USB_RTL8150 && USB_USBNET && BPCTL) selects MII which has unmet direct dependencies (NETDEVICES && NET_CORE)
drivers/staging/ccg/ccg.c:209:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
WARNING: drivers/usb/gadget/pxa27x_udc.o(.text+0x597c): Section mismatch in reference from the function .pxa_udc_probe() to the function .init.text:.udc_init_data.constprop.11()
WARNING: drivers/usb/gadget/pxa27x_udc.o(.text+0x5a04): Section mismatch in reference from the function .pxa_udc_probe() to the function .init.text:.pxa_ep_setup()
kernel/events/core.c:3561:3: warning: 'return' with a value, in function returning void [enabled by default]
net/ieee802154/netlink.c:68:2: warning: passing argument 1 of 'nlmsg_data' from incompatible pointer type [enabled by default]
net/ieee802154/netlink.c:101:2: warning: passing argument 1 of 'nlmsg_data' from incompatible pointer type [enabled by default]
kernel/audit.c:928:3: warning: passing argument 2 of 'nlmsg_next' makes pointer from integer without a cast [enabled by default]
net/ipv4/ipmr.c:1694:15: warning: 'mrt' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/x86/kernel/cpu/mcheck/mce.c:1991:2: warning: excess elements in struct initializer [enabled by default]
arch/x86/kernel/cpu/mcheck/mce.c:1991:2: warning: (near initialization for 'pattr') [enabled by default]
arch/x86/kernel/cpu/mcheck/mce.c:1992:2: warning: excess elements in struct initializer [enabled by default]
arch/x86/kernel/cpu/mcheck/mce.c:1992:2: warning: (near initialization for 'pattr') [enabled by default]
arch/x86/kernel/cpu/mcheck/mce.c:1993:2: warning: excess elements in struct initializer [enabled by default]
arch/x86/kernel/cpu/mcheck/mce.c:1993:2: warning: (near initialization for 'pattr') [enabled by default]
arch/x86/kernel/cpu/mcheck/mce.c:1994:2: warning: excess elements in struct initializer [enabled by default]
arch/x86/kernel/cpu/mcheck/mce.c:1994:2: warning: (near initialization for 'pattr') [enabled by default]

[smatch]
drivers/pci/hotplug/acpiphp_glue.c:1233 _handle_hotplug_event_bridge() error: we previously assumed 'bridge' could be null (see line 1209)
fs/namei.c:2678 path_openat() error: 'file' dereferencing possible ERR_PTR()
drivers/infiniband/hw/mlx4/cm.c:245 id_map_alloc() warn: inconsistent returns spin_lock:&to_mdevibdev->sriov.id_map_lock: locked (240,245) unlocked (214)
fs/btrfs/ioctl.c:772 btrfs_mksubvol() error: double unlock 'mutex:&dir->i_mutex'
fs/btrfs/ioctl.c:2234 btrfs_ioctl_snap_destroy() error: double unlock 'mutex:&dir->i_mutex'
drivers/gpu/drm/nouveau/nouveau_drm.c:91 nouveau_drm_vblank_enable() error: buffer overflow 'drm->vblank' 4 <= 4
drivers/gpu/drm/nouveau/nouveau_drm.c:92 nouveau_drm_vblank_enable() error: buffer overflow 'drm->vblank' 4 <= 4
drivers/gpu/drm/nouveau/nouveau_drm.c:93 nouveau_drm_vblank_enable() warn: buffer overflow 'drm->vblank' 4 <= 4
fs/inode.c:739 inode_lru_isolate() warn: inconsistent returns spin_lock:lru_lock: locked (694,705,712,739) unlocked (730)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
