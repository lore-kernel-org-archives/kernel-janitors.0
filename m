From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 16 May 2013 16:31:14 +0000
Subject: build regressions 2013-05-16
Message-Id: <519509d2.gH9G+efU3xwwUWem%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/mips/mm/pgtable-64.c:88:6: error: redefinition of 'set_pmd_at'
/c/kernel-tests/src/tip/arch/x86/include/asm/pgtable.h:818:41: error: expected identifier or '(' before 'struct'
/c/kernel-tests/src/tip/include/asm-generic/pgtable.h:521:21: error: redefinition of 'pmd_mkyoung'
/c/kernel-tests/src/tip/include/asm-generic/pgtable.h:545:20: error: redefinition of 'set_pmd_at'
/c/kernel-tests/src/x86/include/asm-generic/pgtable.h:545:20: error: redefinition of 'set_pmd_at'
/c/kernel-tests/src/stable/include/asm-generic/pgtable.h:545:20: error: redefinition of 'set_pmd_at'
tuner-core.c:(.text+0x365add): undefined reference to `tda829x_attach'
tuner-core.c:(.text+0x3662c4): undefined reference to `tda829x_probe'
dvb-ttusb-budget.c:(.text+0x422d82): undefined reference to `ves1820_attach'
dvb-ttusb-budget.c:(.text+0x422ee3): undefined reference to `stv0297_attach'
av7110.c:(.text.unlikely+0x1604): undefined reference to `ves1820_attach'
av7110.c:(.text.unlikely+0x18ed): undefined reference to `ves1820_attach'
av7110.c:(.text.unlikely+0x1959): undefined reference to `ves1820_attach'
av7110.c:(.text.unlikely+0x1a4a): undefined reference to `ves1820_attach'
av7110.c:(.text.unlikely+0x1bca): undefined reference to `stv0297_attach'
phy_ht.c:(.text+0x13f11c): undefined reference to `bcma_pmu_spuravoid_pllupdate'
main.c:(.text+0x125e52): undefined reference to `bcma_chipco_gpio_control'
main.c:(.text+0x12c5fa): undefined reference to `bcma_chipco_gpio_control'

[warnings]
drivers/scsi/sd.c:984:3: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'u64' [-Wformat]
drivers/scsi/sd.c:984:3: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'u64' [-Wformat]
include/asm-generic/pgtable.h:524:2: warning: missing braces around initializer [-Wmissing-braces]
include/asm-generic/pgtable.h:524:2: warning: (near initialization for '(anonymous).ste') [-Wmissing-braces]
include/asm-generic/pgtable.h:532:2: warning: missing braces around initializer [-Wmissing-braces]
include/asm-generic/pgtable.h:532:2: warning: (near initialization for '(anonymous).ste') [-Wmissing-braces]
include/asm-generic/pgtable.h:524:2: warning: missing braces around initializer [-Wmissing-braces]
include/asm-generic/pgtable.h:524:2: warning: (near initialization for '(anonymous).ste') [-Wmissing-braces]
include/asm-generic/pgtable.h:532:2: warning: missing braces around initializer [-Wmissing-braces]
include/asm-generic/pgtable.h:532:2: warning: (near initialization for '(anonymous).ste') [-Wmissing-braces]
arch/x86/kernel/../../../drivers/lguest/lg.h:156:0: warning: "pmd_pfn" redefined [enabled by default]
arch/x86/kernel/../../../drivers/lguest/lg.h:156:0: warning: "pmd_pfn" redefined [enabled by default]
Warning(mm/filemap.c:1561): No description found for parameter 'thp'
/c/kernel-tests/src/x86/arch/x86/kernel/../../../drivers/lguest/lg.h:156:0: warning: "pmd_pfn" redefined [enabled by default]
include/asm-generic/pgtable.h:524:2: warning: (near initialization for '(anonymous).pmd') [-Wmissing-braces]
include/asm-generic/pgtable.h:532:2: warning: (near initialization for '(anonymous).pmd') [-Wmissing-braces]
include/asm-generic/pgtable.h:524:2: warning: (near initialization for '(anonymous).pmd') [-Wmissing-braces]
include/asm-generic/pgtable.h:532:2: warning: (near initialization for '(anonymous).pmd') [-Wmissing-braces]
include/asm-generic/pgtable.h:524:2: warning: (near initialization for '(anonymous).pmd') [-Wmissing-braces]
include/asm-generic/pgtable.h:532:2: warning: (near initialization for '(anonymous).pmd') [-Wmissing-braces]

[sparse]
fs/btrfs/disk-io.c:1378:19: sparse: symbol 'btrfs_read_tree_root' was not declared. Should it be static?
fs/btrfs/disk-io.c:1479:19: sparse: symbol 'btrfs_lookup_fs_root' was not declared. Should it be static?
drivers/usb/gadget/f_phonet.c:676:21: sparse: symbol 'phonet_alloc' was not declared. Should it be static?

[coccinelle]
drivers/usb/gadget/nokia.c:156:5-11: inconsistent IS_ERR and PTR_ERR, PTR_ERR on line 157
drivers/usb/gadget/nokia.c:156:5-11: inconsistent IS_ERR and PTR_ERR, PTR_ERR on line 157
drivers/usb/gadget/f_phonet.c:648:9-16: WARNING: ERR_CAST can be used with opts -> net
drivers/usb/gadget/f_phonet.c:648:9-16: WARNING: ERR_CAST can be used with opts -> net

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
