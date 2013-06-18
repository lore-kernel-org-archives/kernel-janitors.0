From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 18 Jun 2013 16:23:11 +0000
Subject: build regressions 2013-06-18
Message-Id: <51c0896f.RMMrf1Yh13yjx/3f%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/x86/platform/efi/efi.c:1171:3: error: 'efi_use_11_map' undeclared (first use in this function)
drivers/pinctrl/sh-pfc/pinctrl.c:124:2: error: implicit declaration of function 'pinconf_generic_parse_dt_config' [-Werror=implicit-function-declaration]
arch/x86/include/asm/efi.h:67:22: error: 'real_mode_header' undeclared (first use in this function)
arch/x86/platform/efi/efi.c:993:22: error: 'real_mode_header' undeclared (first use in this function)
arch/x86/platform/efi/efi.c:1169:47: error: 'real_mode_header' undeclared (first use in this function)
arch/x86/include/asm/efi.h:67:22: error: 'real_mode_header' undeclared (first use in this function)

[warnings]
drivers/usb/host/pci-quirks.h:19: warning: 'struct pci_dev' declared inside parameter list
drivers/usb/host/pci-quirks.h:19: warning: its scope is only this definition or declaration, which is probably not what you want
WARNING: drivers/usb/gadget/fotg210-udc.o(.data+0x0): Section mismatch in reference from the variable fotg210_driver to the function .init.text:fotg210_udc_probe()
drivers/regulator/lp872x.c:910:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

[coccinelle]
drivers/net/ethernet/renesas/sh_eth.c:1406:3-35: code aligned with following code on line 1407
drivers/usb/host/fusbh200-hcd.c:1777:2-53: code aligned with following code on line 1778
drivers/usb/host/xhci.c:2608:2-8: preceding lock on line 2597
drivers/usb/host/xhci.c:3303:2-8: preceding lock on line 3285
drivers/hid/hid-wiimote-modules.c:569:2-3: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
