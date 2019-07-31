From: Colin King <colin.king@canonical.com>
Date: Wed, 31 Jul 2019 22:49:50 +0000
Subject: [PATCH] scsi: snic: remove redundant assignment to variable ret
Message-Id: <20190731224950.16818-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karan Tilak Kumar <kartilak@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ret is being assigned with a value that is never read as
there is return statement immediately afterwards.  The assignment
is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/snic/snic_disc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/snic/snic_disc.c b/drivers/scsi/snic/snic_disc.c
index e9ccfb97773f..d89c75991323 100644
--- a/drivers/scsi/snic/snic_disc.c
+++ b/drivers/scsi/snic/snic_disc.c
@@ -261,8 +261,6 @@ snic_tgt_create(struct snic *snic, struct snic_tgt_id *tgtid)
 	tgt = kzalloc(sizeof(*tgt), GFP_KERNEL);
 	if (!tgt) {
 		SNIC_HOST_ERR(snic->shost, "Failure to allocate snic_tgt.\n");
-		ret = -ENOMEM;
-
 		return tgt;
 	}
 
-- 
2.20.1
