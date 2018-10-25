From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Oct 2018 06:16:33 +0000
Subject: [PATCH] x86/ioremap: tighten integer overflow checking
Message-Id: <20181025061633.t32bxslxj3h7jv2x@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The current check is a bit off in the case where "phys_addr + size"
wraps to zero because then "last_addr" is set to ULONG_MAX which is >phys_addr.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 arch/x86/mm/ioremap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 5378d10f1d31..ee43df3ebe66 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -146,9 +146,9 @@ static void __iomem *__ioremap_caller(resource_size_t phys_addr,
 	void __iomem *ret_addr;
 
 	/* Don't allow wraparound or zero size */
-	last_addr = phys_addr + size - 1;
-	if (!size || last_addr < phys_addr)
+	if (!size || phys_addr + size < phys_addr)
 		return NULL;
+	last_addr = phys_addr + size - 1;
 
 	if (!phys_addr_valid(phys_addr)) {
 		printk(KERN_WARNING "ioremap: invalid physical address %llx\n",
-- 
2.11.0
