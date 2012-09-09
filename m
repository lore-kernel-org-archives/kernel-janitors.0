From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 09 Sep 2012 12:19:39 +0000
Subject: [pci:next 73/77] arch/x86/boot/compressed/eboot.c:283 setup_efi_pci() error: potentially derefencing
Message-Id: <20120909121939.GA19908@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Matthew,

FYI, there are new smatch warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
head:   97ac9d1f363964dec7fbb20cf3c2e88336b4d801
commit: 66f2adcdadea18a583d4f7cbd773847d635731a3 [73/77] EFI: Stash ROMs if they're not in the PCI BAR

All smatch warnings:

+ arch/x86/boot/compressed/eboot.c:283 setup_efi_pci() error: potentially derefencing uninitialized 'pci_handle'.
+ arch/x86/boot/compressed/eboot.c:303 setup_efi_pci() warn: add some parenthesis here?
+ arch/x86/boot/compressed/eboot.c:303 setup_efi_pci() warn: maybe use && instead of &
  arch/x86/boot/compressed/eboot.c:728 handle_ramdisks() error: potentially derefencing uninitialized 'fh'.

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
