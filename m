From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 21:37:21 +0000
Subject: [PATCH 61] drivers/scsi/osst.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707312337.21800.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, James.Bottomley@steeleye.com, linux-scsi@vger.kernel.org, osst@riede.org

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/scsi/osst.c | 185412 -> 185361 (-51 bytes)
 drivers/scsi/osst.o | 272432 -> 272344 (-88 bytes)

 drivers/scsi/osst.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/scsi/osst.c	2007-07-26 13:07:42.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/scsi/osst.c	2007-07-31 14:14:52.000000000 +0200
@@ -5778,13 +5778,12 @@ static int osst_probe(struct device *dev
 	dev_num = i;

 	/* allocate a struct osst_tape for this device */
-	tpnt = kmalloc(sizeof(struct osst_tape), GFP_ATOMIC);
-	if (tpnt = NULL) {
+	tpnt = kzalloc(sizeof(struct osst_tape), GFP_ATOMIC);
+	if (!tpnt) {
 		write_unlock(&os_scsi_tapes_lock);
 		printk(KERN_ERR "osst :E: Can't allocate device descriptor, device not attached.\n");
 		goto out_put_disk;
 	}
-	memset(tpnt, 0, sizeof(struct osst_tape));

 	/* allocate a buffer for this device */
 	i = SDp->host->sg_tablesize;
