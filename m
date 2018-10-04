From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Oct 2018 14:20:27 +0000
Subject: [PATCH] media: exynos4-is: make const array config_ids static
Message-Id: <20181004142027.21009-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

The const array config_ids can be made static, saves populating it on
the stack and will make it read-only.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/exynos4-is/fimc-is.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index 5ddb2321e9e4..f5fc54de19da 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -656,7 +656,7 @@ static int fimc_is_hw_open_sensor(struct fimc_is *is,
 
 int fimc_is_hw_initialize(struct fimc_is *is)
 {
-	const int config_ids[] = {
+	static const int config_ids[] = {
 		IS_SC_PREVIEW_STILL, IS_SC_PREVIEW_VIDEO,
 		IS_SC_CAPTURE_STILL, IS_SC_CAPTURE_VIDEO
 	};
-- 
2.17.1
