From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Sep 2013 09:04:42 +0000
Subject: [patch] sfc: check for allocation failure
Message-Id: <20130902082828.GA30037@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>
Cc: Ben Hutchings <bhutchings@solarflare.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

It upsets static analyzers when we don't check for allocation failure.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/sfc/mtd.c b/drivers/net/ethernet/sfc/mtd.c
index ba6c87a..aac6897 100644
--- a/drivers/net/ethernet/sfc/mtd.c
+++ b/drivers/net/ethernet/sfc/mtd.c
@@ -384,6 +384,8 @@ static int falcon_mtd_probe(struct efx_nic *efx)
 
 	/* Allocate space for maximum number of partitions */
 	parts = kcalloc(2, sizeof(*parts), GFP_KERNEL);
+	if (!parts)
+		return -ENOMEM;
 	n_parts = 0;
 
 	spi = &nic_data->spi_flash;
