From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 May 2016 08:34:58 +0000
Subject: [patch] [SCSI] aic94xx: silence a static checker warning
Message-Id: <20160502083458.GA19792@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"ddb" is a number between 0-64.  It can't ever be >= 0xFFFF.  But the
static checker complains that since we're capping the upper bound, we
may as well cap the lower bound and disallow negatives as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/aic94xx/aic94xx_dev.c b/drivers/scsi/aic94xx/aic94xx_dev.c
index 3307238..84eba3e 100644
--- a/drivers/scsi/aic94xx/aic94xx_dev.c
+++ b/drivers/scsi/aic94xx/aic94xx_dev.c
@@ -73,7 +73,7 @@ out:
 
 static void asd_free_ddb(struct asd_ha_struct *asd_ha, int ddb)
 {
-	if (!ddb || ddb >= 0xFFFF)
+	if (ddb <= 0 || ddb >= 0xFFFF)
 		return;
 	asd_ddbsite_write_byte(asd_ha, ddb, DDB_TYPE, DDB_TYPE_UNUSED);
 	CLEAR_DDB(ddb, asd_ha);
