From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 20:43:05 +0000
Subject: [PATCH 2/7] AGPGART: Use memdup_user() rather than duplicating its implementation
Message-Id: <e768d989-7195-25a2-4f1d-3406a3d5a6ca@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5204ca92-2cdf-8115-567c-4ac29816fcec@users.sourceforge.net>
In-Reply-To: <5204ca92-2cdf-8115-567c-4ac29816fcec@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 21:00:44 +0200

* Reuse existing functionality from memdup_user() instead of keeping
  duplicate source code.

* Try this copy operation before allocating memory for the local
  variable "ksegment".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/agp/compat_ioctl.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/char/agp/compat_ioctl.c b/drivers/char/agp/compat_ioctl.c
index a2b69db..68d4dc7 100644
--- a/drivers/char/agp/compat_ioctl.c
+++ b/drivers/char/agp/compat_ioctl.c
@@ -98,11 +98,10 @@ static int compat_agpioc_reserve_wrap(struct agp_file_private *priv, void __user
 		if (ureserve.seg_count >= 16384)
 			return -EINVAL;
 
-		usegment = kmalloc_array(ureserve.seg_count,
-					 sizeof(*usegment),
-					 GFP_KERNEL);
-		if (!usegment)
-			return -ENOMEM;
+		usegment = memdup_user((void __user *) ureserve.seg_list,
+				       sizeof(*usegment) * ureserve.seg_count);
+		if (IS_ERR(usegment))
+			return PTR_ERR(usegment);
 
 		ksegment = kmalloc_array(kreserve.seg_count,
 					 sizeof(*ksegment),
@@ -112,13 +111,6 @@ static int compat_agpioc_reserve_wrap(struct agp_file_private *priv, void __user
 			return -ENOMEM;
 		}
 
-		if (copy_from_user(usegment, (void __user *) ureserve.seg_list,
-				   sizeof(*usegment) * ureserve.seg_count)) {
-			kfree(usegment);
-			kfree(ksegment);
-			return -EFAULT;
-		}
-
 		for (seg = 0; seg < ureserve.seg_count; seg++) {
 			ksegment[seg].pg_start = usegment[seg].pg_start;
 			ksegment[seg].pg_count = usegment[seg].pg_count;
-- 
2.10.0

