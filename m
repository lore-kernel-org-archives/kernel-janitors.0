From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 30 May 2020 07:34:18 +0000
Subject: [PATCH] scsi: eesox: Fix different dev_id between 'request_irq()' and 'free_irq()'
Message-Id: <20200530073418.577210-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@armlinux.org.uk, jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The dev_id used in 'request_irq()' and 'free_irq()' should match.
So use 'host' in both cases.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/arm/eesox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/arm/eesox.c b/drivers/scsi/arm/eesox.c
index 6e204a2e0c8d..af0bb401ca23 100644
--- a/drivers/scsi/arm/eesox.c
+++ b/drivers/scsi/arm/eesox.c
@@ -546,7 +546,7 @@ static int eesoxscsi_probe(struct expansion_card *ec, const struct ecard_id *id)
 	if (ret)
 		goto out_free;
 
-	ret = request_irq(ec->irq, eesoxscsi_intr, 0, "eesoxscsi", info);
+	ret = request_irq(ec->irq, eesoxscsi_intr, 0, "eesoxscsi", host);
 	if (ret) {
 		printk("scsi%d: IRQ%d not free: %d\n",
 		       host->host_no, ec->irq, ret);
-- 
2.25.1
