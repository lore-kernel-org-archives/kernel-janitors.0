From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 14 Sep 2018 01:38:56 +0000
Subject: [PATCH -next] scsi: pm80xx: Remove set but not used variable 'page_code'
Message-Id: <1536889136-59935-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536803664-42497-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536803664-42497-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/pm8001/pm80xx_hwi.c: In function 'pm8001_set_phy_profile':
drivers/scsi/pm8001/pm80xx_hwi.c:4679:6: warning:
 variable 'page_code' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/pm8001/pm80xx_hwi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
index b641875..9864a3c 100644
--- a/drivers/scsi/pm8001/pm80xx_hwi.c
+++ b/drivers/scsi/pm8001/pm80xx_hwi.c
@@ -4676,9 +4676,8 @@ void mpi_set_phy_profile_req(struct pm8001_hba_info *pm8001_ha,
 void pm8001_set_phy_profile(struct pm8001_hba_info *pm8001_ha,
 	u32 length, u8 *buf)
 {
-	u32 page_code, i;
+	u32 i;
 
-	page_code = SAS_PHY_ANALOG_SETTINGS_PAGE;
 	for (i = 0; i < pm8001_ha->chip->n_phy; i++) {
 		mpi_set_phy_profile_req(pm8001_ha,
 			SAS_PHY_ANALOG_SETTINGS_PAGE, i, length, (u32 *)buf);
