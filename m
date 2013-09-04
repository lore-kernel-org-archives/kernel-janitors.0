From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Sep 2013 15:07:27 +0000
Subject: [patch v2] sfc: check for allocation failure
Message-Id: <20130904150727.GA32327@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130903.224939.866623192858217581.davem@davemloft.net>
In-Reply-To: <20130903.224939.866623192858217581.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>
Cc: Ben Hutchings <bhutchings@solarflare.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

It upsets static analyzers when we don't check for allocation failure.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: rebased on latest linux-next

diff --git a/drivers/net/ethernet/sfc/falcon.c b/drivers/net/ethernet/sfc/falcon.c
index 38d179c..75799f8 100644
--- a/drivers/net/ethernet/sfc/falcon.c
+++ b/drivers/net/ethernet/sfc/falcon.c
@@ -894,6 +894,8 @@ static int falcon_mtd_probe(struct efx_nic *efx)
 
 	/* Allocate space for maximum number of partitions */
 	parts = kcalloc(2, sizeof(*parts), GFP_KERNEL);
+	if (!parts)
+		return -ENOMEM;
 	n_parts = 0;
 
 	spi = &nic_data->spi_flash;
