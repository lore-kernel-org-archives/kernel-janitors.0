From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 02:45:25 +0000
Subject: [tip:x86/efi 10/11] include/linux/efi.h:504: warning: 'efi_late_init' defined but not used
Message-Id: <20120928024525.GF9155@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Josh,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/efi
head:   ba49efa14f97ca6fe57390539e70a359aea779cd
commit: ba49efa14f97ca6fe57390539e70a359aea779cd [10/11] efi: Fix the ACPI BGRT driver for images located in EFI boot services memory
config: avr32-atngw100_defconfig

All warnings:

include/linux/efi.h:503: warning: 'efi_enter_virtual_mode' defined but not used
include/linux/efi.h:504: warning: 'efi_late_init' defined but not used
include/linux/efi.h:505: warning: 'efi_free_boot_services' defined but not used

vim +504 include/linux/efi.h

f383a1e3 (Josh Triplett  2012-09-08  498) #ifdef CONFIG_X86
^1da177e (Linus Torvalds 2005-04-16  499) extern void efi_enter_virtual_mode (void);	/* switch EFI to virtual mode, if possible */
ba49efa1 (Josh Triplett  2012-09-08  500) extern void efi_late_init(void);
668b132e (Josh Triplett  2012-09-08  501) extern void efi_free_boot_services(void);
f383a1e3 (Josh Triplett  2012-09-08  502) #else
f383a1e3 (Josh Triplett  2012-09-08  503) static void efi_enter_virtual_mode(void) {}
ba49efa1 (Josh Triplett  2012-09-08 @504) static void efi_late_init(void) {}
668b132e (Josh Triplett  2012-09-08  505) static void efi_free_boot_services(void) {}

It's missing 'inline' in the above three lines.

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
