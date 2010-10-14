From: Dan Carpenter <error27@gmail.com>
Date: Thu, 14 Oct 2010 18:21:59 +0000
Subject: [patch -next] megaraid: unlock on error path
Message-Id: <20101014182159.GB6614@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neela Syam Kolli <megaraidlinux@lsi.com>, bo yang <boyang1288@gmail.com>
Cc: "James E.J. Bottomley" <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to release the semaphore here before returning.

This was introduced in 39a985547cb: "[SCSI] megaraid_sas: Add Online
Controller Reset to MegaRAID SAS drive"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/scsi/megaraid/megaraid_sas.c b/drivers/scsi/megaraid/megaraid_sas.c
index 55951f4..ab28bae 100644
--- a/drivers/scsi/megaraid/megaraid_sas.c
+++ b/drivers/scsi/megaraid/megaraid_sas.c
@@ -4436,11 +4436,13 @@ static int megasas_mgmt_ioctl_fw(struct file *file, unsigned long arg)
 		printk(KERN_ERR "megaraid_sas: timed out while"
 			"waiting for HBA to recover\n");
 		error = -ENODEV;
-		goto out_kfree_ioc;
+		goto out_up;
 	}
 	spin_unlock_irqrestore(&instance->hba_lock, flags);
 
 	error = megasas_mgmt_fw_ioctl(instance, user_ioc, ioc);
+
+      out_up:
 	up(&instance->ioctl_sem);
 
       out_kfree_ioc:
