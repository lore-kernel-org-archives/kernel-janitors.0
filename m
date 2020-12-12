From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 12 Dec 2020 07:57:16 +0000
Subject: [PATCH] sata_fsl: Fix a resource leak in an error handling path in the probe function
Message-Id: <20201212075716.78986-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: axboe@kernel.dk, qiang.liu@freescale.com, jgarzik@redhat.com
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'irq_dispose_mapping()' should be called in the error handling path of the
probe function, as already done in the remove function.

Fixes: 6b4b8fc87dc5 ("sata_fsl: add support for interrupt coalsecing feature")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/ata/sata_fsl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ata/sata_fsl.c b/drivers/ata/sata_fsl.c
index d55ee244d693..49ecbc55a804 100644
--- a/drivers/ata/sata_fsl.c
+++ b/drivers/ata/sata_fsl.c
@@ -1540,6 +1540,9 @@ static int sata_fsl_probe(struct platform_device *ofdev)
 	if (host)
 		ata_host_detach(host);
 
+	if (host_priv && host_priv->irq)
+		irq_dispose_mapping(host_priv->irq);
+
 	if (hcr_base)
 		iounmap(hcr_base);
 	kfree(host_priv);
-- 
2.27.0
