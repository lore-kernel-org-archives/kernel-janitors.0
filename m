From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 04 Sep 2016 09:00:15 +0000
Subject: [PATCH] perf/x86: Use kmalloc_array() in merge_attr()
Message-Id: <daf81ea8-21bc-d5d0-11af-8957216ae323@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 4 Sep 2016 10:45:20 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/x86/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 18a1acf..f7f3578 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -1618,7 +1618,7 @@ __init struct attribute **merge_attr(struct attribute **a, struct attribute **b)
 		j++;
 	j++;
 
-	new = kmalloc(sizeof(struct attribute *) * j, GFP_KERNEL);
+	new = kmalloc_array(j, sizeof(*new), GFP_KERNEL);
 	if (!new)
 		return NULL;
 
-- 
2.9.3

