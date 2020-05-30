From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 30 May 2020 08:16:22 +0000
Subject: [PATCH] scsi: acornscsi: Fix an error handling path in 'acornscsi_probe()'
Message-Id: <20200530081622.577888-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@armlinux.org.uk, jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

'ret' is known to be 0 at this point.
So, explicitly return -ENOMEM if one of the 'ecardm_iomap()' calls fail.

Fixes: e95a1b656a98 ("[ARM] rpc: acornscsi: update to new style ecard driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/arm/acornscsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/arm/acornscsi.c b/drivers/scsi/arm/acornscsi.c
index ddb52e7ba622..9a912fd0f70b 100644
--- a/drivers/scsi/arm/acornscsi.c
+++ b/drivers/scsi/arm/acornscsi.c
@@ -2911,8 +2911,10 @@ static int acornscsi_probe(struct expansion_card *ec, const struct ecard_id *id)
 
 	ashost->base = ecardm_iomap(ec, ECARD_RES_MEMC, 0, 0);
 	ashost->fast = ecardm_iomap(ec, ECARD_RES_IOCFAST, 0, 0);
-	if (!ashost->base || !ashost->fast)
+	if (!ashost->base || !ashost->fast) {
+		ret = -ENOMEM;
 		goto out_put;
+	}
 
 	host->irq = ec->irq;
 	ashost->host = host;
-- 
2.25.1
