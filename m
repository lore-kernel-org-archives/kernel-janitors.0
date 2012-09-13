From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 13 Sep 2012 17:00:43 +0000
Subject: [memcg:since-3.5 112/137] mm/vmscan.c:677:26: error: parameter 4 ('ttu_flags') has incomplete type
Message-Id: <20120913170043.GA4127@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Minchan,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git since-3.5
head:   d64f22e5761b1e367ba5d1e04d2fe5e0283aecbc
commit: a653bcafb3ac904b44dacddf6be188f5290c4732 [112/137] mm: cma: discard clean pages during contiguous allocation instead of migration
config: m32r-m32104ut_defconfig

All related error/warning messages:

mm/vmscan.c:680:11: warning: 'enum ttu_flags' declared inside parameter list [enabled by default]
mm/vmscan.c:680:11: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
mm/vmscan.c:677:26: error: parameter 4 ('ttu_flags') has incomplete type
mm/vmscan.c:674:22: warning: function declaration isn't a prototype [-Wstrict-prototypes]
mm/vmscan.c: In function 'reclaim_clean_pages_from_list':
mm/vmscan.c:987:5: error: 'TTU_UNMAP' undeclared (first use in this function)
mm/vmscan.c:987:5: note: each undeclared identifier is reported only once for each function it appears in
mm/vmscan.c:987:15: error: 'TTU_IGNORE_ACCESS' undeclared (first use in this function)
mm/vmscan.c: In function 'shrink_inactive_list':
mm/vmscan.c:1312:56: error: 'TTU_UNMAP' undeclared (first use in this function)

vim +677 mm/vmscan.c
   672	 * shrink_page_list() returns the number of reclaimed pages
   673	 */
   674	static unsigned long shrink_page_list(struct list_head *page_list,
   675					      struct zone *zone,
   676					      struct scan_control *sc,
 > 677					      enum ttu_flags ttu_flags,
   678					      unsigned long *ret_nr_dirty,
   679					      unsigned long *ret_nr_writeback,
   680					      bool force_reclaim)
   681	{
   682		LIST_HEAD(ret_pages);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
