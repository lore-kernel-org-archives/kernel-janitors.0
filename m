From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Sat, 20 Oct 2012 02:30:05 +0000
Subject: [tip:numa/core 0/4] mm/huge_memory.c:801:41: error: '__GFP_NO_KSWAPD' undeclared
Message-Id: <20121020023005.GJ9177@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Peter,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git numa/core
head:   aacc9ac4dc832613f12e4022f4a51f5d0d5136a7
commit: 929813de50438aea37e4f42506495301628271f9 [0/4] Merge branch 'linus' into numa/core
config: x86_64-allyesconfig # make ARCH=x86_64 allyesconfig

All error/warnings:

mm/huge_memory.c: In function 'do_huge_pmd_prot_none':
mm/huge_memory.c:801:41: error: '__GFP_NO_KSWAPD' undeclared (first use in this function)
mm/huge_memory.c:801:41: note: each undeclared identifier is reported only once for each function it appears in
mm/huge_memory.c: In function '__split_huge_page_map':
mm/huge_memory.c:1509:2: error: implicit declaration of function 'get_pmd_huge_pte' [-Werror=implicit-function-declaration]
mm/huge_memory.c:1509:10: warning: assignment makes pointer from integer without a cast [enabled by default]
cc1: some warnings being treated as errors

vim +801 mm/huge_memory.c

713f9376 Peter Zijlstra 2012-10-12  785  	WARN_ON((((unsigned long)page->mapping & PAGE_MAPPING_KSM)));
713f9376 Peter Zijlstra 2012-10-12  786  	BUG_ON(PageSwapCache(page));
39d6cb39 Peter Zijlstra 2012-07-17  787  
713f9376 Peter Zijlstra 2012-10-12  788  	spin_unlock(&mm->page_table_lock);
39d6cb39 Peter Zijlstra 2012-07-17  789  
713f9376 Peter Zijlstra 2012-10-12  790  	lock_page(page);
713f9376 Peter Zijlstra 2012-10-12  791  	spin_lock(&mm->page_table_lock);
713f9376 Peter Zijlstra 2012-10-12  792  	if (unlikely(!pmd_same(*pmd, entry))) {
713f9376 Peter Zijlstra 2012-10-12  793  		spin_unlock(&mm->page_table_lock);
713f9376 Peter Zijlstra 2012-10-12  794  		unlock_page(page);
713f9376 Peter Zijlstra 2012-10-12  795  		put_page(page);
713f9376 Peter Zijlstra 2012-10-12  796  		return;
713f9376 Peter Zijlstra 2012-10-12  797  	}
713f9376 Peter Zijlstra 2012-10-12  798  	spin_unlock(&mm->page_table_lock);
713f9376 Peter Zijlstra 2012-10-12  799  
713f9376 Peter Zijlstra 2012-10-12  800  	new_page = alloc_pages_node(node,
713f9376 Peter Zijlstra 2012-10-12 @801  	    (GFP_TRANSHUGE | GFP_THISNODE) & ~(__GFP_NO_KSWAPD | __GFP_WAIT),
713f9376 Peter Zijlstra 2012-10-12  802  	    HPAGE_PMD_ORDER);
713f9376 Peter Zijlstra 2012-10-12  803  
713f9376 Peter Zijlstra 2012-10-12  804  	WARN_ON(PageLRU(new_page));
713f9376 Peter Zijlstra 2012-10-12  805  
713f9376 Peter Zijlstra 2012-10-12  806  	if (!new_page)
713f9376 Peter Zijlstra 2012-10-12  807  		goto alloc_fail;
713f9376 Peter Zijlstra 2012-10-12  808  
713f9376 Peter Zijlstra 2012-10-12  809  	lru = PageLRU(page);

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
