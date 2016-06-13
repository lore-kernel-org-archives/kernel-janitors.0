From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Jun 2016 06:57:55 +0000
Subject: [patch] x86/ldt: silence a static checker warning
Message-Id: <20160613065755.GC5993@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jan Beulich <JBeulich@suse.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It likely doesn't make a difference but my static checker complains
that we put an upper bound on "size" but not a lower bound.  Let's just
make it unsigned.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kernel/ldt.c b/arch/x86/kernel/ldt.c
index 6707039b..e25b668 100644
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
