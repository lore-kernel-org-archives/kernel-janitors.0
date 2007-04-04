From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Wed, 04 Apr 2007 17:49:40 +0000
Subject: [KJ] [PATCH]ROUND_UP macro cleanup in drivers/char/lp.c
Message-Id: <20070404173739.GB9830@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070403024345.GB9479@arun.site>
In-Reply-To: <20070403024345.GB9479@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org

ROUND_UP macro cleanup use DIV_ROUND_UP

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---
 lp.c |    5 +----
 1 files changed, 1 insertion(+), 4 deletions(-)


diff --git a/drivers/char/lp.c b/drivers/char/lp.c
index b51d08b..c086910 100644
--- a/drivers/char/lp.c
+++ b/drivers/char/lp.c
@@ -139,9 +139,6 @@
 /* if you have more than 8 printers, remember to increase LP_NO */
 #define LP_NO 8
 
-/* ROUND_UP macro from fs/select.c */
-#define ROUND_UP(x,y) (((x)+(y)-1)/(y))
-
 static struct lp_struct lp_table[LP_NO];
 
 static unsigned int lp_count = 0;
@@ -652,7 +649,7 @@ static int lp_ioctl(struct inode *inode, struct file *file,
 			    (par_timeout.tv_usec < 0)) {
 				return -EINVAL;
 			}
-			to_jiffies = ROUND_UP(par_timeout.tv_usec, 1000000/HZ);
+			to_jiffies = DIV_ROUND_UP(par_timeout.tv_usec, 1000000/HZ);
 			to_jiffies += par_timeout.tv_sec * (long) HZ;
 			if (to_jiffies <= 0) {
 				return -EINVAL;

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
