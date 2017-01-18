From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 13:50:05 +0000
Subject: [PATCH 3/3] AVR32: Return an error code only as a constant in sys_cacheflush()
Message-Id: <fec80877-6556-876c-72ca-f6ccb85e0700@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <308dc151-c874-dfe7-64f9-24a63fc66883@users.sourceforge.net>
In-Reply-To: <308dc151-c874-dfe7-64f9-24a63fc66883@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 14:30:11 +0100

* Return an error code without storing it in an intermediate variable.

* Delete the local variable "ret" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/avr32/mm/cache.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/avr32/mm/cache.c b/arch/avr32/mm/cache.c
index 85d635cd7b28..c893e5944390 100644
--- a/arch/avr32/mm/cache.c
+++ b/arch/avr32/mm/cache.c
@@ -126,30 +126,19 @@ void flush_icache_page(struct vm_area_struct *vma, struct page *page)
 
 asmlinkage int sys_cacheflush(int operation, void __user *addr, size_t len)
 {
-	int ret;
-
-	if (len > CACHEFLUSH_MAX_LEN) {
-		ret = -EPERM;
-		if (!capable(CAP_SYS_ADMIN))
-			goto out;
-	}
-
-	ret = -EFAULT;
+	if (len > CACHEFLUSH_MAX_LEN && !capable(CAP_SYS_ADMIN))
+		return -EPERM;
 	if (!access_ok(VERIFY_WRITE, addr, len))
-		goto out;
+		return -EFAULT;
 
 	switch (operation) {
 	case CACHE_IFLUSH:
 		flush_icache_range((unsigned long)addr,
 				   (unsigned long)addr + len);
-		ret = 0;
-		break;
+		return 0;
 	default:
-		ret = -EINVAL;
+		return -EINVAL;
 	}
-
-out:
-	return ret;
 }
 
 void copy_to_user_page(struct vm_area_struct *vma, struct page *page,
-- 
2.11.0

