From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 26 Jun 2020 10:51:33 +0000
Subject: [PATCH] scsi: ufs: ufs-exynos: Remove an unnecessary NULL check
Message-Id: <20200626105133.GF314359@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "head" pointer can't be NULL because it points to an address in
the middle of a ufs_hba struct.  Looking at this code, probably someone
would wonder if the intent was to check whether "hba" is NULL, but "hba"
isn't NULL and the check can just be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/ufs/ufs-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-exynos.c b/drivers/scsi/ufs/ufs-exynos.c
index 16544b3dad47..802f7de626e8 100644
--- a/drivers/scsi/ufs/ufs-exynos.c
+++ b/drivers/scsi/ufs/ufs-exynos.c
@@ -264,7 +264,7 @@ static int exynos_ufs_get_clk_info(struct exynos_ufs *ufs)
 	u8 div = 0;
 	int ret = 0;
 
-	if (!head || list_empty(head))
+	if (list_empty(head))
 		goto out;
 
 	list_for_each_entry(clki, head, list) {
-- 
2.27.0
