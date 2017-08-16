From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Aug 2017 11:44:51 +0000
Subject: [PATCH] staging: fsl-mc: fix fsl_mc_is_allocatable strcmps
Message-Id: <20170816114451.1348-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The previous fix removed the equal to zero comparisons by the strcmps and
now the function always returns true. Fix this by adding in the missing
logical negation operators.

Detected by CoverityScan, CID#1452267 ("Constant expression result")

Fixes: b93ad9a067e1 ("staging: fsl-mc: be consistent when checking strcmp() return")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/fsl-mc/bus/fsl-mc-allocator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fsl-mc/bus/fsl-mc-allocator.c b/drivers/staging/fsl-mc/bus/fsl-mc-allocator.c
index b37a6f48225f..8b5f2d0cdf06 100644
--- a/drivers/staging/fsl-mc/bus/fsl-mc-allocator.c
+++ b/drivers/staging/fsl-mc/bus/fsl-mc-allocator.c
@@ -16,9 +16,9 @@
 
 static bool __must_check fsl_mc_is_allocatable(const char *obj_type)
 {
-	return strcmp(obj_type, "dpbp") ||
-	       strcmp(obj_type, "dpmcp") ||
-	       strcmp(obj_type, "dpcon");
+	return !strcmp(obj_type, "dpbp") ||
+	       !strcmp(obj_type, "dpmcp") ||
+	       !strcmp(obj_type, "dpcon");
 }
 
 /**
-- 
2.11.0

