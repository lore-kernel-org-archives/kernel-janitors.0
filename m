From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 17:01:04 +0000
Subject: [PATCH] scsi: ufs: make array setup_attrs static const, makes object smaller
Message-Id: <20190906170104.10450-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pedro Sousa <pedrom.sousa@synopsys.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array setup_attrs on the stack but instead make it
static const. Makes the object code smaller by 180 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
   2140	    224	      0	   2364	    93c	drivers/scsi/ufs/ufshcd-dwc.o

After:
   text	   data	    bss	    dec	    hex	filename
   1863	    320	      0	   2183	    887	drivers/scsi/ufs/ufshcd-dwc.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/ufs/ufshcd-dwc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd-dwc.c b/drivers/scsi/ufs/ufshcd-dwc.c
index fb9e2ff4f8d2..6a901da2d15a 100644
--- a/drivers/scsi/ufs/ufshcd-dwc.c
+++ b/drivers/scsi/ufs/ufshcd-dwc.c
@@ -80,7 +80,7 @@ static int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
  */
 static int ufshcd_dwc_connection_setup(struct ufs_hba *hba)
 {
-	const struct ufshcd_dme_attr_val setup_attrs[] = {
+	static const struct ufshcd_dme_attr_val setup_attrs[] = {
 		{ UIC_ARG_MIB(T_CONNECTIONSTATE), 0, DME_LOCAL },
 		{ UIC_ARG_MIB(N_DEVICEID), 0, DME_LOCAL },
 		{ UIC_ARG_MIB(N_DEVICEID_VALID), 0, DME_LOCAL },
-- 
2.20.1
