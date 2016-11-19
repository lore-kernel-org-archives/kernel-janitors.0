From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Sat, 19 Nov 2016 17:40:38 +0000
Subject: [PATCH] scsi: aic94xx: Add a missing call to kfree
Message-Id: <20161119174038.20083-1-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Quentin Lambert <lambert.quentin@gmail.com>

Most error branches following the call to kzalloc contain
a call to kfree. This patch add these calls where they are
missing.

This issue was found with Hector.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>

---
 drivers/scsi/aic94xx/aic94xx_hwi.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- a/drivers/scsi/aic94xx/aic94xx_hwi.c
+++ b/drivers/scsi/aic94xx/aic94xx_hwi.c
@@ -228,8 +228,10 @@ static int asd_init_scbs(struct asd_ha_s
 	bitmap_bytes = (asd_ha->seq.tc_index_bitmap_bits+7)/8;
 	bitmap_bytes = BITS_TO_LONGS(bitmap_bytes*8)*sizeof(unsigned long);
 	asd_ha->seq.tc_index_bitmap = kzalloc(bitmap_bytes, GFP_KERNEL);
-	if (!asd_ha->seq.tc_index_bitmap)
+	if (!asd_ha->seq.tc_index_bitmap) {
+		kfree(asd_ha->seq.tc_index_array);
 		return -ENOMEM;
+	}
 
 	spin_lock_init(&seq->tc_index_lock);
 
