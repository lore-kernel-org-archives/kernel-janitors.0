From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 05 Oct 2012 01:20:03 +0000
Subject: [aa:autonuma27 52/56] mm/mempolicy.c:1183:4: error: implicit declaration of function 'trace_numa_mig
Message-Id: <20121005012003.GD6635@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andrew,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git autonuma27
head:   f3c62c0eadc7fe51f755543fe0b0830b937f8406
commit: 318fc9096f65d1187e19cba0881e2b796380fec7 [52/56] autonuma: trace: numa: add numa_migratepages trace events
config: ia64-allnoconfig

All error/warnings:

mm/mempolicy.c: In function 'do_mbind':
mm/mempolicy.c:1183:4: error: implicit declaration of function 'trace_numa_migratepages_nodemask_begin' [-Werror=implicit-function-declaration]
mm/mempolicy.c:1190:4: error: implicit declaration of function 'trace_numa_migratepages_nodemask_end' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +1183 mm/mempolicy.c

6ce3c4c0 (Christoph Lameter 2006-01-08  1177) 	if (!IS_ERR(vma)) {
6ce3c4c0 (Christoph Lameter 2006-01-08  1178) 		int nr_failed = 0;
6ce3c4c0 (Christoph Lameter 2006-01-08  1179) 
9d8cebd4 (KOSAKI Motohiro   2010-03-05  1180) 		err = mbind_range(mm, start, end, new);
7e2ab150 (Christoph Lameter 2006-02-01  1181) 
cf608ac1 (Minchan Kim       2010-10-26  1182) 		if (!list_empty(&pagelist)) {
318fc909 (Andrew Jones      2012-10-02 @1183) 			trace_numa_migratepages_nodemask_begin(mm, &pagelist,
318fc909 (Andrew Jones      2012-10-02  1184) 							       NULL, nmask);
95a402c3 (Christoph Lameter 2006-06-23  1185) 			nr_failed = migrate_pages(&pagelist, new_vma_page,
7f0f2496 (Mel Gorman        2011-01-13  1186) 						(unsigned long)vma,

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
