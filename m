From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Thu, 16 Jun 2011 16:44:20 +0000
Subject: [PATCH] frv: remove unnecessary code
Message-Id: <1308242660-29054-1-git-send-email-Gregory.Dietsche@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

remove unnecessary code that matches this coccinelle pattern
	if (...)
		return ret;
	return ret;

Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 arch/frv/mm/pgalloc.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/arch/frv/mm/pgalloc.c b/arch/frv/mm/pgalloc.c
index c42c83d..4fb63a3 100644
--- a/arch/frv/mm/pgalloc.c
+++ b/arch/frv/mm/pgalloc.c
@@ -133,13 +133,7 @@ void pgd_dtor(void *pgd)
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *pgd;
-
-	pgd = quicklist_alloc(0, GFP_KERNEL, pgd_ctor);
-	if (!pgd)
-		return pgd;
-
-	return pgd;
+	return quicklist_alloc(0, GFP_KERNEL, pgd_ctor);
 }
 
 void pgd_free(struct mm_struct *mm, pgd_t *pgd)
-- 
1.7.2.5

