From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Dec 2012 16:38:36 +0000
Subject: build regressions 2012-12-12
Message-Id: <50c8b30c.C31gy36ul2yHoqVH%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sb_pci_mp.c:(.text.unlikely+0x19ed0): undefined reference to `parport_pc_probe_port'
ERROR: "parport_pc_probe_port" [drivers/staging/sb105x/sb105x.ko] undefined!
kernel/audit.o:(.opd+0x2d0): first defined here
drivers/char/xilinx_devcfg.c:35:23: fatal error: mach/slcr.h: No such file or directory
drivers/spi/spi-xilinx-ps.c:361:4: error: implicit declaration of function 'dmb' [-Werror=implicit-function-declaration]
drivers/usb/gadget/xilinx_udc.c:315:2: error: implicit declaration of function 'out_be32' [-Werror=implicit-function-declaration]
drivers/usb/gadget/xilinx_udc.c:540:3: error: implicit declaration of function 'in_be32' [-Werror=implicit-function-declaration]
drivers/usb/gadget/xilinx_udc.c:1300:3: error: unknown field 'is_dualspeed' specified in initializer
drivers/usb/gadget/xilinx_udc.c:2164:15: error: 'struct usb_gadget_driver' has no member named 'speed'
drivers/usb/gadget/xilinx_udc.c:2165:10: error: 'struct usb_gadget_driver' has no member named 'bind'
drivers/usb/gadget/xilinx_udc.c:2288:37: error: 'SA_RESTART' undeclared (first use in this function)
drivers/usb/gadget/xilinx_udc.c:2332:11: error: dereferencing pointer to incomplete type
drivers/usb/gadget/xilinx_udc.c:2372:2: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
drivers/usb/gadget/xilinx_udc.c:2378:2: error: implicit declaration of function 'of_irq_to_resource' [-Werror=implicit-function-declaration]
drivers/usb/gadget/xilinx_udc.c:2379:12: error: 'NO_IRQ' undeclared (first use in this function)
drivers/usb/gadget/xilinx_udc.c:2384:2: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
drivers/usb/gadget/xilinx_udc.c:2412:15: error: variable 'usb_of_driver' has initializer but incomplete type
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:742:3: error: implicit declaration of function 'dma_alloc_writecombine' [-Werror=implicit-function-declaration]
drivers/usb/chipidea/host.c:41:2: error: implicit declaration of function 'ehci_setup' [-Werror=implicit-function-declaration]
drivers/usb/host/ehci-pci.c:195:2: error: implicit declaration of function 'ehci_setup' [-Werror=implicit-function-declaration]
kernel/audit.o:(.text+0x1b95): first defined here
(*ABS*+0x738af1ef): multiple definition of `__crc_audit_log_task_info'
auditsc.c:(.text+0x1735): multiple definition of `audit_log_task_context'
kernel/audit.o:audit.c:(.text+0x138b): first defined here
auditsc.c:(.text+0x189f): multiple definition of `audit_log_task_info'

[warnings]
drivers/gpu/drm/nouveau/core/subdev/therm/ic.c:116:1: warning: the frame size of 1028 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/dma/xilinx_dma.c:1935:4: warning: too many arguments for format [-Wformat-extra-args]
drivers/spi/spi-xilinx-ps.c:775:2: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/spi/spi-xilinx-ps.c:775:2: warning: format '%X' expects argument of type 'unsigned int', but argument 3 has type 'resource_size_t' [-Wformat]
drivers/spi/spi-xilinx-qps.c:1069:2: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/spi/spi-xilinx-qps.c:1069:2: warning: format '%X' expects argument of type 'unsigned int', but argument 3 has type 'resource_size_t' [-Wformat]
drivers/dma/xilinx_dma.c:1937:6: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/xilinx_common/xpacket_fifo_v2_00_a.c:231:2: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/xilinx_common/xpacket_fifo_l_v2_00_a.c:281:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/xilinx_common/xdma_channel.c:696:2: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/xilinx_common/xdma_channel_sg.c:387:3: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/xilinx_common/xdma_channel_sg.c:408:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/xilinx_common/xio.c:195:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/xilinx_common/xio.c:308:5: warning: passing argument 1 of 'InSwap16' makes pointer from integer without a cast [enabled by default]
drivers/xilinx_common/xio.c:342:5: warning: passing argument 1 of 'InSwap32' makes pointer from integer without a cast [enabled by default]
drivers/xilinx_common/xio.c:485:5: warning: passing argument 2 of 'OutSwap16' makes pointer from integer without a cast [enabled by default]
drivers/xilinx_common/xio.c:517:5: warning: passing argument 2 of 'OutSwap32' makes pointer from integer without a cast [enabled by default]
drivers/usb/gadget/xilinx_udc.c:45:1: warning: data definition has no type or storage class [enabled by default]
drivers/usb/gadget/xilinx_udc.c:45:1: warning: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Wimplicit-int]
drivers/usb/gadget/xilinx_udc.c:45:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/usb/gadget/xilinx_udc.c:50:0: warning: "DEBUG" redefined [enabled by default]
drivers/usb/gadget/xilinx_udc.c:2198:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL' [-Wimplicit-int]
drivers/usb/gadget/xilinx_udc.c:2311:2: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/usb/gadget/xilinx_udc.c:2325:13: warning: 'struct of_device' declared inside parameter list [enabled by default]
drivers/usb/gadget/xilinx_udc.c:2325:13: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/usb/gadget/xilinx_udc.c:2384:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/usb/gadget/xilinx_udc.c:2409:2: warning: passing argument 2 of 'xudc_remove' from incompatible pointer type [enabled by default]
drivers/usb/gadget/xilinx_udc.c:2417:2: warning: excess elements in struct initializer [enabled by default]
drivers/usb/gadget/xilinx_udc.c:2417:2: warning: (near initialization for 'usb_of_driver') [enabled by default]
drivers/usb/gadget/xilinx_udc.c:2430:2: warning: passing argument 1 of 'platform_driver_register' from incompatible pointer type [enabled by default]
drivers/usb/gadget/xilinx_udc.c:2441:2: warning: passing argument 1 of 'platform_driver_unregister' from incompatible pointer type [enabled by default]
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:742:23: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:751:3: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
net/mac80211/iface.c:511:32: warning: unused variable 'ap' [-Wunused-variable]

[sparse]
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:1088:55: sparse: incorrect type in argument 2 (different address spaces)
drivers/video/xylon/xylonfb/platform/../core/xylonfb-ioctl.c:41:47: sparse: incorrect type in argument 1 (different address spaces)
drivers/video/xylon/xylonfb/platform/../core/xylonfb-pixclk.c:55:19: sparse: incorrect type in assignment (different address spaces)
drivers/video/xylon/xylonfb/platform/../core/xylonfb-pixclk.c:63:25: sparse: incorrect type in argument 1 (different address spaces)
fs/btrfs/file.c:195:6: sparse: symbol 'btrfs_requeue_inode_defrag' was not declared. Should it be static?

[smatch]
drivers/video/omap2/omapfb/omapfb-main.c:2553 omapfb_probe() warn: possible memory leak of 'fbdev'
fs/btrfs/volumes.c:1559 btrfs_rm_device() error: potential NULL dereference 'bdev'.
fs/cifs/connect.c:1903 cifs_parse_mount_options() error: double free of 'string'
security/apparmor/policy.c:1128 aa_replace_profiles() error: 'policy' dereferencing possible ERR_PTR()

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
