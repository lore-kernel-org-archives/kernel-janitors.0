From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 Apr 2013 07:44:19 +0000
Subject: [patch] [SCSI] megaraid_sas: release lock on error path
Message-Id: <20130416074419.GA1571@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neela Syam Kolli <megaraidlinux@lsi.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

We should unlock here before returning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index 9d53540..eb2385f 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -4931,11 +4931,12 @@ static int megasas_mgmt_ioctl_fw(struct file *file, unsigned long arg)
 		printk(KERN_ERR "megaraid_sas: timed out while"
 			"waiting for HBA to recover\n");
 		error = -ENODEV;
-		goto out_kfree_ioc;
+		goto out_up;
 	}
 	spin_unlock_irqrestore(&instance->hba_lock, flags);
 
 	error = megasas_mgmt_fw_ioctl(instance, user_ioc, ioc);
+      out_up:
 	up(&instance->ioctl_sem);
 
       out_kfree_ioc:
