From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 10 Dec 2016 09:06:03 +0000
Subject: [patch v2] x86/ldt: make a size variable unsigned
Message-Id: <20161210090603.GA10995@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

My static checker complains that we put an upper bound on the "size"
variable but not a lower bound.  The checker is not smart enough to know
the possible ranges of "old_mm->context.ldt->size" from
init_new_context_ldt() so it thinks maybe it could be negative.

Let's make it unsigned to silence the warning and future proof the code
a bit.  Also make alloc_size unsigned as well to match.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: change alloc_size

diff --git a/arch/x86/kernel/ldt.c b/arch/x86/kernel/ldt.c
index 4d12cdf2b453..62ccc27428e4 100644
--- a/arch/x86/kernel/ldt.c
+++ b/arch/x86/kernel/ldt.c
@@ -34,10 +34,10 @@ static void flush_ldt(void *current_mm)
 }
 
 /* The caller must call finalize_ldt_struct on the result. LDT starts zeroed. */
-static struct ldt_struct *alloc_ldt_struct(int size)
+static struct ldt_struct *alloc_ldt_struct(unsigned int size)
 {
 	struct ldt_struct *new_ldt;
-	int alloc_size;
+	unsigned int alloc_size;
 
 	if (size > LDT_ENTRIES)
 		return NULL;
