From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2016 10:56:03 +0000
Subject: [patch] x86/ldt: make a size variable unsigned
Message-Id: <20161208105602.GA11382@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andy Lutomirski <luto@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that we put an upper bound on the "size"
variable but not a lower bound.  The checker is not smart enough to know
the possible ranges of "old_mm->context.ldt->size" from
init_new_context_ldt() so it thinks maybe it could be negative.

Let's make it unsigned to silence the warning and future proof the code
a bit.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kernel/ldt.c b/arch/x86/kernel/ldt.c
index 4d12cdf2b453..d6320c63be45 100644
--- a/arch/x86/kernel/ldt.c
+++ b/arch/x86/kernel/ldt.c
@@ -34,7 +34,7 @@ static void flush_ldt(void *current_mm)
 }
 
 /* The caller must call finalize_ldt_struct on the result. LDT starts zeroed. */
-static struct ldt_struct *alloc_ldt_struct(int size)
+static struct ldt_struct *alloc_ldt_struct(unsigned int size)
 {
 	struct ldt_struct *new_ldt;
 	int alloc_size;
