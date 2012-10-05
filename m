From: Andrew Jones <drjones@redhat.com>
Date: Fri, 05 Oct 2012 04:04:31 +0000
Subject: Re: [aa:autonuma27 52/56] mm/mempolicy.c:1183:4: error: implicit declaration of function 'trace_numa
Message-Id: <20121005040430.GB2581@turtle.usersys.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121005012003.GD6635@localhost>
In-Reply-To: <20121005012003.GD6635@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 05, 2012 at 05:51:40AM +0200, Andrew Jones wrote:
> On Fri, Oct 05, 2012 at 09:20:03AM +0800, Fengguang Wu wrote:
> > Hi Andrew,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git autonuma27
> > head:   f3c62c0eadc7fe51f755543fe0b0830b937f8406
> > commit: 318fc9096f65d1187e19cba0881e2b796380fec7 [52/56] autonuma: trace: numa: add numa_migratepages trace events
> > config: ia64-allnoconfig
> > 
> > All error/warnings:
> > 
> > mm/mempolicy.c: In function 'do_mbind':
> > mm/mempolicy.c:1183:4: error: implicit declaration of function 'trace_numa_migratepages_nodemask_begin' [-Werror=implicit-function-declaration]
> > mm/mempolicy.c:1190:4: error: implicit declaration of function 'trace_numa_migratepages_nodemask_end' [-Werror=implicit-function-declaration]
> > cc1: some warnings being treated as errors
> 
> Thanks for the bug report. With your allnoconfig test build I
> see that I didn't pay enough attention to the scope of
> CONFIG_MIGRATION, and that do_mbind is outside it. I guess
> do_mbind prefers to fail more elaborately when there isn't
> migration support than do_migrate_pages does. Rather than just
> returning ENOSYS it actually attempts to migrate pages with
> a NULL returning get_new_page function, which eventually
> forces do_mbind to return ENOMEM.

err.. correction, do_mbind does return ENOSYS when
CONFIG_MIGRATION=n, because migrate_pages() is stubbed out
to just return ENOSYS. Either way it looks like the
tracepoints also need stubs.

> 
> I'll send Andrea a fix for his tree.
> 
> Drew
> 
> > 
> > vim +1183 mm/mempolicy.c
> > 
> > 6ce3c4c0 (Christoph Lameter 2006-01-08  1177) 	if (!IS_ERR(vma)) {
> > 6ce3c4c0 (Christoph Lameter 2006-01-08  1178) 		int nr_failed = 0;
> > 6ce3c4c0 (Christoph Lameter 2006-01-08  1179) 
> > 9d8cebd4 (KOSAKI Motohiro   2010-03-05  1180) 		err = mbind_range(mm, start, end, new);
> > 7e2ab150 (Christoph Lameter 2006-02-01  1181) 
> > cf608ac1 (Minchan Kim       2010-10-26  1182) 		if (!list_empty(&pagelist)) {
> > 318fc909 (Andrew Jones      2012-10-02 @1183) 			trace_numa_migratepages_nodemask_begin(mm, &pagelist,
> > 318fc909 (Andrew Jones      2012-10-02  1184) 							       NULL, nmask);
> > 95a402c3 (Christoph Lameter 2006-06-23  1185) 			nr_failed = migrate_pages(&pagelist, new_vma_page,
> > 7f0f2496 (Mel Gorman        2011-01-13  1186) 						(unsigned long)vma,
> > 
> > ---
> > 0-DAY kernel build testing backend         Open Source Technology Center
> > Fengguang Wu, Yuanhan Liu                              Intel Corporation
