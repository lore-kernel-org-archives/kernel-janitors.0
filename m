From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 30 Sep 2012 08:42:50 +0000
Subject: [aa:autonuma 43/52] mm/page_alloc.c:622:2: error: implicit declaration of function 'autonuma_migrate
Message-Id: <20120930084250.GA8225@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andrea,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git autonuma
head:   f710de97296920b750cea0570cb77cf8acdf2452
commit: 6965681c724e71dccf07cf6ec8b829b0cac91844 [43/52] autonuma: reset autonuma page data when pages are freed
config: x86_64-allmodconfig

All error/warnings:

mm/page_alloc.c: In function 'free_pages_check':
mm/page_alloc.c:622:2: error: implicit declaration of function 'autonuma_migrate_page_remove' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +622 mm/page_alloc.c

538aae95 (Andrea Arcangeli  2011-10-14  616) 		(__page_count(page) != 0) |
f212ad7c (Daisuke Nishimura 2011-03-23  617) 		(page->flags & PAGE_FLAGS_CHECK_AT_FREE) |
f212ad7c (Daisuke Nishimura 2011-03-23  618) 		(mem_cgroup_bad_page_check(page)))) {
224abf92 (Nick Piggin       2006-01-06  619) 		bad_page(page);
79f4b7bf (Hugh Dickins      2009-01-06  620) 		return 1;
8cc3b392 (Hugh Dickins      2009-01-06  621) 	}
6965681c (Andrea Arcangeli  2012-03-23 @622) 	autonuma_migrate_page_remove(page);
6965681c (Andrea Arcangeli  2012-03-23  623) #ifdef CONFIG_AUTONUMA
6965681c (Andrea Arcangeli  2012-03-23  624) 	page->autonuma_last_nid = -1;
6965681c (Andrea Arcangeli  2012-03-23  625) #endif

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
