From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 13:41:13 +0000
Subject: [arm-perf:hugetlb/devel 8/10] arch/arm/include/asm/pgtable-2level.h:333:10: error: 'HPAGE_MASK' unde
Message-Id: <20121015134113.GA25295@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Steve,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git hugetlb/devel
head:   d5ada8ef8b4415b39c6e89711cd8d41ea275ce82
commit: 7356b0ca2bae49b15a314cc746b39869760960ab [8/10] ARM: mm: Transparent huge page support for non-LPAE systems.
config: arm-at91_dt_defconfig # make ARCH=arm at91_dt_defconfig

All error/warnings:

In file included from arch/arm/include/asm/pgtable.h:33:0,
                 from include/linux/mm.h:44,
                 from arch/arm/kernel/asm-offsets.c:14:
arch/arm/include/asm/pgtable-2level.h: In function 'pmd_page':
arch/arm/include/asm/pgtable-2level.h:333:10: error: 'HPAGE_MASK' undeclared (first use in this function)
arch/arm/include/asm/pgtable-2level.h:333:10: note: each undeclared identifier is reported only once for each function it appears in

vim +333 arch/arm/include/asm/pgtable-2level.h

7356b0ca Steve Capper 2012-07-19  327  {
7356b0ca Steve Capper 2012-07-19  328  	/*
7356b0ca Steve Capper 2012-07-19  329  	 * for a section, we need to mask off more of the pmd
7356b0ca Steve Capper 2012-07-19  330  	 * before looking up the page as it is a section descriptor.
7356b0ca Steve Capper 2012-07-19  331  	 */
7356b0ca Steve Capper 2012-07-19  332  	if (_PMD_HUGE(pmd))
7356b0ca Steve Capper 2012-07-19 @333  		return phys_to_page(pmd_val(pmd) & HPAGE_MASK);
7356b0ca Steve Capper 2012-07-19  334  
7356b0ca Steve Capper 2012-07-19  335  	return phys_to_page(pmd_val(pmd) & PHYS_MASK);
7356b0ca Steve Capper 2012-07-19  336  }

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
