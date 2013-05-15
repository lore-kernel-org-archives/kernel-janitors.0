From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 15 May 2013 16:00:15 +0000
Subject: build regressions 2013-05-15
Message-Id: <5193b10f.juPLZMOb9bai56om%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
/c/kernel-tests/src/linux/arch/x86/include/asm/pgtable.h:818:41: error: expected identifier or '(' before 'struct'
/c/kernel-tests/src/linux/include/asm-generic/pgtable.h:521:21: error: redefinition of 'pmd_mkyoung'
/c/kernel-tests/src/linux/include/asm-generic/pgtable.h:545:20: error: redefinition of 'set_pmd_at'
tuner-core.c:(.text+0x284a0d): undefined reference to `tda18271_attach'
umt-010.c:(.text+0x2c4af4): undefined reference to `mt352_attach'
dw2102.c:(.text+0x2c6abf): undefined reference to `tda10023_attach'
dm1105.c:(.text+0x2bc916): undefined reference to `stb6000_attach'
dm1105.c:(.text+0x2bc9fd): undefined reference to `stb6000_attach'
dm1105.c:(.text+0x2bca0c): undefined reference to `si21xx_attach'
dw2102.c:(.text+0x2e79be): undefined reference to `stb6000_attach'
dw2102.c:(.text+0x2e7a58): undefined reference to `si21xx_attach'
dw2102.c:(.text+0x2e7ace): undefined reference to `stb6000_attach'
dw2102.c:(.text+0x2e842e): undefined reference to `m88rs2000_attach'
fs/nfsd/nfs4xdr.c:2488:5: error: too many arguments to function 'nfsd4_encode_security_label'
fs/nfsd/nfs4xdr.c:2505:3: error: implicit declaration of function 'security_release_secctx' [-Werror=implicit-function-declaration]
include/asm-generic/pgtable.h:524:2: error: implicit declaration of function '__pmd' [-Werror=implicit-function-declaration]
include/asm-generic/pgtable.h:524:2: error: incompatible types when returning type 'int' but 'pmd_t' was expected
include/asm-generic/pgtable.h:532:2: error: incompatible types when returning type 'int' but 'pmd_t' was expected
include/asm-generic/pgtable.h:524:2: error: implicit declaration of function '__pmd' [-Werror=implicit-function-declaration]
include/asm-generic/pgtable.h:524:2: error: incompatible types when returning type 'int' but 'pmd_t' was expected
include/asm-generic/pgtable.h:532:2: error: incompatible types when returning type 'int' but 'pmd_t' was expected
(.text+0x104f08): undefined reference to `bcma_core_set_clockmode'
(.text+0x104fd7): undefined reference to `bcma_core_pll_ctl'
main.c:(.text+0x107831): undefined reference to `bcma_core_pci_irq_ctl'
bus.c:(.text+0x10a03e): undefined reference to `bcma_core_disable'
bus.c:(.text+0x10a05e): undefined reference to `bcma_core_enable'
bus.c:(.text+0x10a07e): undefined reference to `bcma_core_is_enabled'
(.text+0x11a8fa): undefined reference to `bcma_core_dma_translation'
main.c:(.init.text+0x51ad): undefined reference to `__bcma_driver_register'
main.c:(.init.text+0x51fa): undefined reference to `bcma_driver_unregister'
main.c:(.exit.text+0xa2c): undefined reference to `bcma_driver_unregister'

[warnings]
/c/kernel-tests/src/linux/arch/x86/kernel/../../../drivers/lguest/lg.h:156:0: warning: "pmd_pfn" redefined [enabled by default]
warning: (ATH9K_DEBUGFS) selects MAC80211_DEBUGFS which has unmet direct dependencies (NET && WIRELESS && MAC80211 && DEBUG_FS)
warning: (ATH9K_DEBUGFS) selects MAC80211_DEBUGFS which has unmet direct dependencies (NET && WIRELESS && MAC80211 && DEBUG_FS)
warning: (ATH9K_DEBUGFS) selects MAC80211_DEBUGFS which has unmet direct dependencies (NET && WIRELESS && MAC80211 && DEBUG_FS)
WARNING: vmlinux.o(.text+0x37094): Section mismatch in reference from the function .rtas_cpu_state_change_mask() to the function .cpuinit.text:.cpu_up()
include/linux/huge_mm.h:268:2: warning: 'entry' is used uninitialized in this function [-Wuninitialized]
fs/nfsd/nfs4xdr.c:2488:5: warning: passing argument 3 of 'nfsd4_encode_security_label' makes pointer from integer without a cast [enabled by default]
fs/nfsd/nfs4xdr.c:2488:5: warning: passing argument 4 of 'nfsd4_encode_security_label' from incompatible pointer type [enabled by default]
include/asm-generic/pgtable.h:533:1: warning: control reaches end of non-void function [-Wreturn-type]

[sparse]
drivers/target/target_core_transport.c:2216:28: sparse: context imbalance in 'target_release_cmd_kref' - unexpected unlock
include/linux/kref.h:112:19: sparse: context imbalance in 'target_put_sess_cmd' - different lock contexts for basic block

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
