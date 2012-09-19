From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Sep 2012 02:46:01 +0000
Subject: [aa:autonuma25-MoF 54/56] arch/powerpc/include/asm/pgtable.h:37:23: error: '_PAGE_NUMA_PTE' undeclar
Message-Id: <20120919024601.GB20639@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Vaidyanathan,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git autonuma25-MoF
head:   0df1f89ac6f293309eea549508a6376e4ebb7e94
commit: 59eec6d0b70cc32a616c75c2d427b10b8990889d [54/56] autonuma: powerpc port
config: powerpc-chroma_defconfig

All related error/warning messages:

In file included from include/linux/mm.h:44:0,
                 from arch/powerpc/include/asm/mman.h:35,
                 from include/linux/mman.h:4,
                 from arch/powerpc/kernel/asm-offsets.c:22:
arch/powerpc/include/asm/pgtable.h: In function 'pte_present':
arch/powerpc/include/asm/pgtable.h:37:23: error: '_PAGE_NUMA_PTE' undeclared (first use in this function)
arch/powerpc/include/asm/pgtable.h:37:23: note: each undeclared identifier is reported only once for each function it appears in
arch/powerpc/include/asm/pgtable.h: In function 'pte_mknonnuma':
arch/powerpc/include/asm/pgtable.h:52:25: error: '_PAGE_NUMA_PTE' undeclared (first use in this function)
arch/powerpc/include/asm/pgtable.h: In function 'pte_mknuma':
arch/powerpc/include/asm/pgtable.h:60:24: error: '_PAGE_NUMA_PTE' undeclared (first use in this function)
In file included from arch/powerpc/include/asm/pgtable.h:250:0,
                 from include/linux/mm.h:44,
                 from arch/powerpc/include/asm/mman.h:35,
                 from include/linux/mman.h:4,
                 from arch/powerpc/kernel/asm-offsets.c:22:
include/asm-generic/pgtable.h: At top level:
include/asm-generic/pgtable.h:539:19: error: redefinition of 'pmd_numa'
arch/powerpc/include/asm/pgtable.h:65:19: note: previous definition of 'pmd_numa' was here

vim +37 arch/powerpc/include/asm/pgtable.h
    32	static inline int pte_dirty(pte_t pte)		{ return pte_val(pte) & _PAGE_DIRTY; }
    33	static inline int pte_young(pte_t pte)		{ return pte_val(pte) & _PAGE_ACCESSED; }
    34	static inline int pte_file(pte_t pte)		{ return pte_val(pte) & _PAGE_FILE; }
    35	static inline int pte_special(pte_t pte)	{ return pte_val(pte) & _PAGE_SPECIAL; }
    36	static inline int pte_present(pte_t pte)	{ return pte_val(pte) &
  > 37								(_PAGE_PRESENT|_PAGE_NUMA_PTE); }
    38	static inline int pte_none(pte_t pte)		{ return (pte_val(pte) & ~_PTE_NONE_MASK) = 0; }
    39	static inline pgprot_t pte_pgprot(pte_t pte)	{ return __pgprot(pte_val(pte) & PAGE_PROT_BITS); }
    40	
    41	#ifdef CONFIG_AUTONUMA
    42	static inline int pte_numa(pte_t pte)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
