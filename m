From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Aug 2017 16:30:22 +0000
Subject: [PATCH] staging: fsl-mc: Delete an error message for a failed memory allocation in fsl_mc_resource_p
Message-Id: <58deeae8-09e7-d5d6-63c7-65c6aee6850c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Stuart Yoder <stuyoder@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Aug 2017 18:23:52 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/fsl-mc/bus/fsl-mc-allocator.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/fsl-mc/bus/fsl-mc-allocator.c b/drivers/staging/fsl-mc/bus/fsl-mc-allocator.c
index b37a6f48225f..53312e32d94a 100644
--- a/drivers/staging/fsl-mc/bus/fsl-mc-allocator.c
+++ b/drivers/staging/fsl-mc/bus/fsl-mc-allocator.c
@@ -66,8 +66,6 @@ static int __must_check fsl_mc_resource_pool_add_device(struct fsl_mc_bus
 				GFP_KERNEL);
 	if (!resource) {
 		error = -ENOMEM;
-		dev_err(&mc_bus_dev->dev,
-			"Failed to allocate memory for fsl_mc_resource\n");
 		goto out_unlock;
 	}
 
-- 
2.14.0

