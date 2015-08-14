From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Aug 2015 20:35:25 +0000
Subject: [patch] cxlflash: off by one bug in cxlflash_show_port_status()
Message-Id: <20150814203525.GA27158@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@odin.com>, "Matthew R. Ochs" <mrochs@linux.vnet.ibm.com>
Cc: Brian King <brking@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>, "Manoj N. Kumar" <manoj@linux.vnet.ibm.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

The > should be >= or we read one element past the end of the array.

Fixes: c21e0bbfc485 ('cxlflash: Base support for IBM CXL Flash Adapter')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Fixes: c21e0bbfc485 ('cxlflash: Base support for IBM CXL Flash Adapter')
diff --git a/drivers/scsi/cxlflash/main.c b/drivers/scsi/cxlflash/main.c
index 0720d2f..fd70101 100644
--- a/drivers/scsi/cxlflash/main.c
+++ b/drivers/scsi/cxlflash/main.c
@@ -539,7 +539,7 @@ static ssize_t cxlflash_show_port_status(struct device *dev,
 	u64 *fc_regs;
 
 	rc = kstrtouint((attr->attr.name + 4), 10, &port);
-	if (rc || (port > NUM_FC_PORTS))
+	if (rc || (port >= NUM_FC_PORTS))
 		return 0;
 
 	fc_regs = &afu->afu_map->global.fc_regs[port][0];
