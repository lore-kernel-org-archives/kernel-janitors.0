From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 31 Aug 2019 12:44:24 +0000
Subject: [PATCH -next] scsi: ufs: Use kmemdup in ufshcd_read_string_desc()
Message-Id: <20190831124424.18642-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Tomas Winkler <tomas.winkler@intel.com>, Subhash Jadavani <subhashj@codeaurora.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use kmemdup rather than duplicating its implementation

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/ufs/ufshcd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index acf298da054c..6d5e2f5d8468 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -3309,12 +3309,11 @@ int ufshcd_read_string_desc(struct ufs_hba *hba, u8 desc_index,
 		str[ret++] = '\0';
 
 	} else {
-		str = kzalloc(uc_str->len, GFP_KERNEL);
+		str = kmemdup(uc_str, uc_str->len, GFP_KERNEL);
 		if (!str) {
 			ret = -ENOMEM;
 			goto out;
 		}
-		memcpy(str, uc_str, uc_str->len);
 		ret = uc_str->len;
 	}
 out:
