From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 13:57:43 +0000
Subject: [PATCH -next] mm: fix set but not used warning
Message-Id: <20190218135743.131904-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Toshi Kani <toshi.kani@hpe.com>, Will Deacon <will.deacon@arm.com>, Chintan Pandya <cpandya@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

lib/ioremap.c: In function 'ioremap_page_range':
lib/ioremap.c:203:16: warning:
 variable 'start' set but not used [-Wunused-but-set-variable]

flush_cache_vmap may no need param, so add __maybe_unused fix this warning.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 lib/ioremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/ioremap.c b/lib/ioremap.c
index 063213685563..d1c7a488e731 100644
--- a/lib/ioremap.c
+++ b/lib/ioremap.c
@@ -200,7 +200,7 @@ int ioremap_page_range(unsigned long addr,
 		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
 {
 	pgd_t *pgd;
-	unsigned long start;
+	unsigned long __maybe_unused start;
 	unsigned long next;
 	int err;
