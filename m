From: Maksym Planeta <mcsim.planeta@gmail.com>
Date: Sat, 19 Mar 2011 16:25:47 +0000
Subject: [PATCH] x86: page: get_order() optimization
Message-Id: <1300551947-22279-1-git-send-email-mcsim.planeta@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1300550881-22091-1-git-send-email-mcsim.planeta@gmail.com>
In-Reply-To: <1300550881-22091-1-git-send-email-mcsim.planeta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de
Cc: kernel-janitors@vger.kernel.org, mingo@redhat.com, linux-kernel@vger.kernel.org, Maksym Planeta <mcsim.planeta@gmail.com>

For x86 architecture get_order function can be optimized due to
assembler instruction bsr.

I'm sorry. I've forgot about Signed-off, so the same, but with the sign.

Signed-off-by: Maksym Planeta <mcsim.planeta@gmail.com>
---
 arch/x86/include/asm/page.h |   20 +++++++++++++++++++-
 1 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
index 8ca8283..339ae26 100644
--- a/arch/x86/include/asm/page.h
+++ b/arch/x86/include/asm/page.h
@@ -60,10 +60,28 @@ static inline void copy_user_page(void *to, void *from, unsigned long vaddr,
 extern bool __virt_addr_valid(unsigned long kaddr);
 #define virt_addr_valid(kaddr)	__virt_addr_valid((unsigned long) (kaddr))
 
+/* Pure 2^n version of get_order */
+static inline __attribute_const__ int get_order(unsigned long size)
+{
+	int order;
+
+	size = (size - 1) >> (PAGE_SHIFT - 1);
+#ifdef CONFIG_X86_CMOV
+	asm("bsr %1,%0\n\t"
+	    "cmovzl %2,%0"
+	    : "=&r" (order) : "rm" (size), "rm" (0));
+#else
+	asm("bsr %1,%0\n\t"
+	    "jnz 1f\n\t"
+	    "movl $0,%0\n"
+	    "1:" : "=r" (order) : "rm" (size));
+#endif
+	return order;
+}
+
 #endif	/* __ASSEMBLY__ */
 
 #include <asm-generic/memory_model.h>
-#include <asm-generic/getorder.h>
 
 #define __HAVE_ARCH_GATE_AREA 1
 
-- 
1.7.2.3

