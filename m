From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 02:41:15 +0000
Subject: [tip:x86/efi 7/11] include/linux/efi.h:501: warning: 'efi_enter_virtual_mode' defined but not used
Message-Id: <20120928024115.GD9155@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Josh,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/efi
head:   ba49efa14f97ca6fe57390539e70a359aea779cd
commit: f383a1e37bc3fc93d19ed23dfdb1adfc5a7d1010 [7/11] efi: Add a stub for efi_enter_virtual_mode on non-x86
config: avr32-atngw100_defconfig

All warnings:

include/linux/efi.h:501: warning: 'efi_enter_virtual_mode' defined but not used

vim +501 include/linux/efi.h

f383a1e3 (Josh Triplett  2012-09-08  498) #ifdef CONFIG_X86
^1da177e (Linus Torvalds 2005-04-16  499) extern void efi_enter_virtual_mode (void);	/* switch EFI to virtual mode, if possible */
f383a1e3 (Josh Triplett  2012-09-08  500) #else
f383a1e3 (Josh Triplett  2012-09-08 @501) static void efi_enter_virtual_mode(void) {}
f383a1e3 (Josh Triplett  2012-09-08  502) #endif

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
