From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Mar 2018 08:09:42 +0000
Subject: [PATCH] scsi: dpt_i2o: Use after free in I2ORESETCMD ioctl
Message-Id: <20180321080941.GB9826@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Here is another use after free if we reset the card.  The adpt_hba_reset()
function frees "pHba" on error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
index 3c667b23a801..359e0acfbc7c 100644
--- a/drivers/scsi/dpt_i2o.c
+++ b/drivers/scsi/dpt_i2o.c
@@ -2046,13 +2046,16 @@ static int adpt_ioctl(struct inode *inode, struct file *file, uint cmd, ulong ar
 		}
 		break;
 		}
-	case I2ORESETCMD:
-		if(pHba->host)
-			spin_lock_irqsave(pHba->host->host_lock, flags);
+	case I2ORESETCMD: {
+		struct Scsi_Host *shost = pHba->host;
+
+		if (shost)
+			spin_lock_irqsave(shost->host_lock, flags);
 		adpt_hba_reset(pHba);
-		if(pHba->host)
-			spin_unlock_irqrestore(pHba->host->host_lock, flags);
+		if (shost)
+			spin_unlock_irqrestore(shost->host_lock, flags);
 		break;
+	}
 	case I2ORESCANCMD:
 		adpt_rescan(pHba);
 		break;
