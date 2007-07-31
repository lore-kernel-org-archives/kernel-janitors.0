From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 22:21:33 +0000
Subject: [PATCH 82] drivers/scsi/zorro7xx.c: kmalloc + memset conversion to kzalloc
Message-Id: <200708010021.34147.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, James.Bottomley@steeleye.com, linux-scsi@vger.kernel.org

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/scsi/zorro7xx.c | 4579 -> 4501 (-78 bytes)

 drivers/scsi/zorro7xx.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/scsi/zorro7xx.c	2007-07-26 13:07:42.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/scsi/zorro7xx.c	2007-07-31 14:25:58.000000000 +0200
@@ -69,7 +69,7 @@ static struct zorro_device_id zorro7xx_z
 static int __devinit zorro7xx_init_one(struct zorro_dev *z,
 				       const struct zorro_device_id *ent)
 {
-	struct Scsi_Host * host = NULL;
+	struct Scsi_Host *host;
 	struct NCR_700_Host_Parameters *hostdata;
 	struct zorro_driver_data *zdd;
 	unsigned long board, ioaddr;
@@ -89,14 +89,12 @@ static int __devinit zorro7xx_init_one(s
 		return -EBUSY;
 	}

-	hostdata = kmalloc(sizeof(struct NCR_700_Host_Parameters), GFP_KERNEL);
-	if (hostdata = NULL) {
+	hostdata = kzalloc(sizeof(struct NCR_700_Host_Parameters), GFP_KERNEL);
+	if (!hostdata) {
 		printk(KERN_ERR "zorro7xx: Failed to allocate host data\n");
 		goto out_release;
 	}

-	memset(hostdata, 0, sizeof(struct NCR_700_Host_Parameters));
-
 	/* Fill in the required pieces of hostdata */
 	if (ioaddr > 0x01000000)
 		hostdata->base = ioremap(ioaddr, zorro_resource_len(z));
