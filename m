From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Aug 2017 17:12:00 +0000
Subject: [PATCH] Revert "staging: fsl-mc: be consistent when checking strcmp() return"
Message-Id: <20170816171200.31259-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The previous fix removed the equal to zero comparisons by the strcmps and
now the function always returns true. Revert this change to restore the
original correctly functioning code.

Detected by CoverityScan, CID#1452267 ("Constant expression result")

This reverts commit b93ad9a067e1515af42da7d56bc61f1a25075f94.
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/fsl-mc/bus/fsl-mc-allocator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fsl-mc/bus/fsl-mc-allocator.c b/drivers/staging/fsl-mc/bus/fsl-mc-allocator.c
index b37a6f48225f..8ea3920400a0 100644
--- a/drivers/staging/fsl-mc/bus/fsl-mc-allocator.c
+++ b/drivers/staging/fsl-mc/bus/fsl-mc-allocator.c
@@ -16,9 +16,9 @@
 
 static bool __must_check fsl_mc_is_allocatable(const char *obj_type)
 {
-	return strcmp(obj_type, "dpbp") ||
-	       strcmp(obj_type, "dpmcp") ||
-	       strcmp(obj_type, "dpcon");
+	return strcmp(obj_type, "dpbp") = 0 ||
+	       strcmp(obj_type, "dpmcp") = 0 ||
+	       strcmp(obj_type, "dpcon") = 0;
 }
 
 /**
-- 
2.11.0

