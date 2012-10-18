From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Thu, 18 Oct 2012 10:55:21 +0000
Subject: [next:master 59/85] mm/huge_memory.c:1424:2: error: implicit declaration of function 'pmd_pgprot'
Message-Id: <20121018105521.GP21995@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Peter,

JUST FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
config: s390-allmodconfig # make ARCH=s390 allmodconfig

All error/warnings:

mm/huge_memory.c: In function '__split_huge_page_map':
mm/huge_memory.c:1424:2: error: implicit declaration of function 'pmd_pgprot' [-Werror=implicit-function-declaration]
mm/huge_memory.c:1424:7: error: incompatible types when assigning to type 'pgprot_t' from type 'int'
cc1: some warnings being treated as errors

vim +1424 mm/huge_memory.c

71e3aac0 Andrea Arcangeli 2011-01-13  1418  	spin_lock(&mm->page_table_lock);
71e3aac0 Andrea Arcangeli 2011-01-13  1419  	pmd = page_check_address_pmd(page, mm, address,
71e3aac0 Andrea Arcangeli 2011-01-13  1420  				     PAGE_CHECK_ADDRESS_PMD_SPLITTING_FLAG);
93c9d633 Peter Zijlstra   2012-07-17  1421  	if (!pmd)
93c9d633 Peter Zijlstra   2012-07-17  1422  		goto unlock;
71e3aac0 Andrea Arcangeli 2011-01-13  1423  
93c9d633 Peter Zijlstra   2012-07-17 @1424  	prot = pmd_pgprot(*pmd);
64a863c8 Stephen Rothwell 2012-10-18  1425  	pgtable = pgtable_trans_huge_withdraw(mm);
93c9d633 Peter Zijlstra   2012-07-17  1426  	pmd_populate(mm, &_pmd, pgtable);
93c9d633 Peter Zijlstra   2012-07-17  1427  


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
