From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 21:41:00 +0000
Subject: [PATCH 62] include/asm-avr32/pgalloc.h: kmalloc + memset conversion to kcalloc
Message-Id: <200707312341.01133.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, hskinnemoen@atmel.com

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 include/asm-avr32/pgalloc.h |    8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

--- linux-2.6.23-rc1-mm1-a/include/asm-avr32/pgalloc.h	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/include/asm-avr32/pgalloc.h	2007-07-31 15:05:25.000000000 +0200
@@ -27,13 +27,7 @@ static __inline__ void pmd_populate(stru
  */
 static __inline__ pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	unsigned int pgd_size = (USER_PTRS_PER_PGD * sizeof(pgd_t));
-	pgd_t *pgd = kmalloc(pgd_size, GFP_KERNEL);
-
-	if (pgd)
-		memset(pgd, 0, pgd_size);
-
-	return pgd;
+	return kcalloc(USER_PTRS_PER_PGD, sizeof(pgd_t), GFP_KERNEL);
 }

 static inline void pgd_free(pgd_t *pgd)
