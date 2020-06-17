From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Jun 2020 08:49:11 +0000
Subject: [PATCH][next] scsi: ufs: ufs-exynos: fix spelling mistake "pa_granularty" -> "pa_granularity"
Message-Id: <20200617084911.167359-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Seungwon Jeon <essuuj@gmail.com>, Kiwoong Kim <kwmad.kim@samsung.com>, linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/ufs/ufs-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-exynos.c b/drivers/scsi/ufs/ufs-exynos.c
index 440f2af83d9c..0a9e99084f2a 100644
--- a/drivers/scsi/ufs/ufs-exynos.c
+++ b/drivers/scsi/ufs/ufs-exynos.c
@@ -883,7 +883,7 @@ static int exynos_ufs_post_link(struct ufs_hba *hba)
 		if (attr->pa_granularity < 1 || attr->pa_granularity > 6) {
 			/* Valid range for granularity: 1 ~ 6 */
 			dev_warn(hba->dev,
-				"%s: pa_granularty %d is invalid, assuming backwards compatibility\n",
+				"%s: pa_granularity %d is invalid, assuming backwards compatibility\n",
 				__func__,
 				attr->pa_granularity);
 			attr->pa_granularity = 6;
-- 
2.27.0.rc0
