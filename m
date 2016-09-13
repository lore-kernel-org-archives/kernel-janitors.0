From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 20:42:09 +0000
Subject: [PATCH 1/7] AGPGART: Use kmalloc_array() in compat_agpioc_reserve_wrap()
Message-Id: <7c2df723-e456-37d3-faf0-76514c672515@users.sourceforge.net>
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
Date: Tue, 13 Sep 2016 17:51:32 +0200

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/agp/compat_ioctl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/char/agp/compat_ioctl.c b/drivers/char/agp/compat_ioctl.c
index a48e05b..a2b69db 100644
--- a/drivers/char/agp/compat_ioctl.c
+++ b/drivers/char/agp/compat_ioctl.c
@@ -98,11 +98,15 @@ static int compat_agpioc_reserve_wrap(struct agp_file_private *priv, void __user
 		if (ureserve.seg_count >= 16384)
 			return -EINVAL;
 
-		usegment = kmalloc(sizeof(*usegment) * ureserve.seg_count, GFP_KERNEL);
+		usegment = kmalloc_array(ureserve.seg_count,
+					 sizeof(*usegment),
+					 GFP_KERNEL);
 		if (!usegment)
 			return -ENOMEM;
 
-		ksegment = kmalloc(sizeof(*ksegment) * kreserve.seg_count, GFP_KERNEL);
+		ksegment = kmalloc_array(kreserve.seg_count,
+					 sizeof(*ksegment),
+					 GFP_KERNEL);
 		if (!ksegment) {
 			kfree(usegment);
 			return -ENOMEM;
-- 
2.10.0

