From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 06 Nov 2017 23:03:02 +0000
Subject: [PATCH 3.16 165/294] x86/ldt: Fix off by one in get_segment_base()
Message-Id: <lsq.1510009382.193570306@decadent.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <lsq.1510009377.526284287@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@kernel.org>, Andy Lutomirski <luto@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>

3.16.50-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Dan Carpenter <dan.carpenter@oracle.com>

commit eaa2f87c6b840b83827c40db6eb8481689570259 upstream.

ldt->entries[] is allocated in alloc_ldt_struct().  It has
ldt->nr_entries elements and ldt->nr_entries is capped at LDT_ENTRIES.
So if "idx" is = ldt->nr_entries then we're reading beyond the end of
the buffer.  It seems duplicative to have two limit checks when one
would work just as well so I removed the check against LDT_ENTRIES.

The gdt_page.gdt[] array has GDT_ENTRIES entries.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Andy Lutomirski <luto@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org
Fixes: d07bdfd322d3 ("perf/x86: Fix USER/KERNEL tagging of samples properly")
Link: http://lkml.kernel.org/r/20170818102516.gqwm4xdvvuvjw5ho@mwanda
Signed-off-by: Ingo Molnar <mingo@kernel.org>
[bwh: Backported to 3.16: adjust filename, context]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/x86/kernel/cpu/perf_event.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- a/arch/x86/kernel/cpu/perf_event.c
+++ b/arch/x86/kernel/cpu/perf_event.c
@@ -2009,17 +2009,14 @@ static unsigned long get_segment_base(un
 	if ((segment & SEGMENT_TI_MASK) = SEGMENT_LDT) {
 		struct ldt_struct *ldt;
 
-		if (idx > LDT_ENTRIES)
-			return 0;
-
 		/* IRQs are off, so this synchronizes with smp_store_release */
 		ldt = lockless_dereference(current->active_mm->context.ldt);
-		if (!ldt || idx > ldt->size)
+		if (!ldt || idx >= ldt->size)
 			return 0;
 
 		desc = &ldt->entries[idx];
 	} else {
-		if (idx > GDT_ENTRIES)
+		if (idx >= GDT_ENTRIES)
 			return 0;
 
 		desc = __this_cpu_ptr(&gdt_page.gdt[0]) + idx;

