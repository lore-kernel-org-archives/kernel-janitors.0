From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 07 Apr 2008 11:45:01 +0000
Subject: trying to avoid "#ifdef CONFIG_NUMA"?
Message-Id: <alpine.LFD.1.00.0804070741520.23945@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  from <linux/kernel.h>:

/* This helps us to avoid #ifdef CONFIG_NUMA */
#ifdef CONFIG_NUMA
#define NUMA_BUILD 1
#else
#define NUMA_BUILD 0
#endif

  however, there's still a pile of that preprocessor directive
scattered throughout the kernel.  what kind of "avoidance" are we
talking about here?

$ grep -r "#ifdef CONFIG_NUMA" * | wc -l
159

$ grep -rw NUMA_BUILD *
include/linux/kernel.h:#define NUMA_BUILD 1
include/linux/kernel.h:#define NUMA_BUILD 0
mm/page_alloc.c:                if (NUMA_BUILD && zlc_active &&
mm/page_alloc.c:                if (NUMA_BUILD)
mm/page_alloc.c:                if (NUMA_BUILD && !did_zlc_setup) {
mm/page_alloc.c:        if (unlikely(NUMA_BUILD && page = NULL && zlc_active)) {
mm/page_alloc.c:        if (NUMA_BUILD && (gfp_mask & GFP_THISNODE) = GFP_THISNODE)
mm/page_alloc.c:        if (NUMA_BUILD)
$

  not a lot of avoiding going on there, i'd say.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
