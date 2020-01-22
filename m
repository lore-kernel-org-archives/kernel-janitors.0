From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jan 2020 09:12:50 +0000
Subject: [PATCH][next] scsi: ufs: fix spelling mistake "initilized" -> "initialized"
Message-Id: <20200122091250.2777221-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/ufs/ufs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs.h b/drivers/scsi/ufs/ufs.h
index dde2eb02f76f..cfe380348bf0 100644
--- a/drivers/scsi/ufs/ufs.h
+++ b/drivers/scsi/ufs/ufs.h
@@ -546,7 +546,7 @@ static inline bool ufs_is_valid_unit_desc_lun(struct ufs_dev_info *dev_info,
 		u8 lun)
 {
 	if (!dev_info || !dev_info->max_lu_supported) {
-		pr_err("Max General LU supported by UFS isn't initilized\n");
+		pr_err("Max General LU supported by UFS isn't initialized\n");
 		return false;
 	}
 
-- 
2.24.0
