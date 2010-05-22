From: Dan Carpenter <error27@gmail.com>
Date: Sat, 22 May 2010 20:18:01 +0000
Subject: [patch] scsi/qla2xxx: check for null consistently
Message-Id: <20100522201801.GK22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Vasquez <andrew.vasquez@qlogic.com>
Cc: linux-driver@qlogic.com, "James E.J. Bottomley" <James.Bottomley@suse.de>, Giridhar Malavali <giridhar.malavali@qlogic.com>, Anirban Chakraborty <anirban.chakraborty@qlogic.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

We assume that "ha->cs84xx" can be null on the previous line, so we
should check it here as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla_attr.c
index 3b70860..ad22baa 100644
--- a/drivers/scsi/qla2xxx/qla_attr.c
+++ b/drivers/scsi/qla2xxx/qla_attr.c
@@ -1211,7 +1211,7 @@ qla24xx_84xx_fw_version_show(struct device *dev,
 	if (ha->cs84xx && ha->cs84xx->op_fw_version = 0)
 		rval = qla84xx_verify_chip(vha, status);
 
-	if ((rval = QLA_SUCCESS) && (status[0] = 0))
+	if (ha->cs84xx && rval = QLA_SUCCESS && status[0] = 0)
 		return snprintf(buf, PAGE_SIZE, "%u\n",
 			(uint32_t)ha->cs84xx->op_fw_version);
 
