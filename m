From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Aug 2017 10:30:30 +0000
Subject: [PATCH] x86/ldt: Off by one in get_segment_base()
Message-Id: <20170818102516.gqwm4xdvvuvjw5ho@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

ldt->entries[] is allocated in alloc_ldt_struct().  It has
ldt->nr_entries elements and ldt->nr_entries is capped at LDT_ENTRIES.
So if "idx" is = ldt->nr_entries then we're reading beyond the end of
the buffer.  It seems duplicative to have two limit checks when one
would work just as well so I removed the check against LDT_ENTRIES.

The gdt_page.gdt[] array has GDT_ENTRIES entries.

Fixes: d07bdfd322d3 ("perf/x86: Fix USER/KERNEL tagging of samples properly")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker fix.  I'm pretty certain it's correct.  But I
don't understand the code terribly well, so please let me know and I'll
be happy to send a v2 if needed.

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index af12e294caed..939050169d12 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2335,12 +2335,9 @@ static unsigned long get_segment_base(unsigned int segment)
 #ifdef CONFIG_MODIFY_LDT_SYSCALL
 		struct ldt_struct *ldt;
 
-		if (idx > LDT_ENTRIES)
-			return 0;
-
 		/* IRQs are off, so this synchronizes with smp_store_release */
 		ldt = lockless_dereference(current->active_mm->context.ldt);
-		if (!ldt || idx > ldt->nr_entries)
+		if (!ldt || idx >= ldt->nr_entries)
 			return 0;
 
 		desc = &ldt->entries[idx];
@@ -2348,7 +2345,7 @@ static unsigned long get_segment_base(unsigned int segment)
 		return 0;
 #endif
 	} else {
-		if (idx > GDT_ENTRIES)
+		if (idx >= GDT_ENTRIES)
 			return 0;
 
 		desc = raw_cpu_ptr(gdt_page.gdt) + idx;
