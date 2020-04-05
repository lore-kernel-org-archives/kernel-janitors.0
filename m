From: Colin King <colin.king@canonical.com>
Date: Sun, 05 Apr 2020 11:51:20 +0000
Subject: [PATCH] ata: ahci-imx: remove redundant assignment to ret
Message-Id: <20200405115120.366864-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/ata/ahci_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index 948d2c6557f3..388baf528fa8 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -782,7 +782,7 @@ static int ahci_imx_softreset(struct ata_link *link, unsigned int *class,
 	struct ata_host *host = dev_get_drvdata(ap->dev);
 	struct ahci_host_priv *hpriv = host->private_data;
 	struct imx_ahci_priv *imxpriv = hpriv->plat_data;
-	int ret = -EIO;
+	int ret;
 
 	if (imxpriv->type = AHCI_IMX53)
 		ret = ahci_pmp_retry_srst_ops.softreset(link, class, deadline);
-- 
2.25.1
