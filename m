From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Mar 2018 10:34:01 +0000
Subject: [PATCH 2/2] scsi: dpt_i2o: use after free in __adpt_reset()
Message-Id: <20180319103401.GB8543@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In __adpt_reset() the problem is that adpt_hba_reset() frees "pHba" on
error but we dereference it to print the name in the error message.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
index 3c667b23a801..ac2f40d9963b 100644
--- a/drivers/scsi/dpt_i2o.c
+++ b/drivers/scsi/dpt_i2o.c
@@ -797,14 +797,17 @@ static int __adpt_reset(struct scsi_cmnd* cmd)
 {
 	adpt_hba* pHba;
 	int rcode;
+	char name[32];
+
 	pHba = (adpt_hba*)cmd->device->host->hostdata[0];
-	printk(KERN_WARNING"%s: Hba Reset: scsi id %d: tid: %d\n",pHba->name,cmd->device->channel,pHba->channel[cmd->device->channel].tid );
+	strncpy(name, pHba->name, sizeof(name));
+	printk(KERN_WARNING"%s: Hba Reset: scsi id %d: tid: %d\n", name, cmd->device->channel, pHba->channel[cmd->device->channel].tid);
 	rcode =  adpt_hba_reset(pHba);
 	if(rcode = 0){
-		printk(KERN_WARNING"%s: HBA reset complete\n",pHba->name);
+		printk(KERN_WARNING"%s: HBA reset complete\n", name);
 		return SUCCESS;
 	} else {
-		printk(KERN_WARNING"%s: HBA reset failed (%x)\n",pHba->name, rcode);
+		printk(KERN_WARNING"%s: HBA reset failed (%x)\n", name, rcode);
 		return FAILED;
 	}
 }
