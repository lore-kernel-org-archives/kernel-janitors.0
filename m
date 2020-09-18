From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Sep 2020 14:33:11 +0000
Subject: [PATCH net] sfc: Fix error code in probe
Message-Id: <20200918143311.GD909725@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>
Cc: Edward Cree <ecree@solarflare.com>, Martin Habets <mhabets@solarflare.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This failure path should return a negative error code but it currently
returns success.

Fixes: 51b35a454efd ("sfc: skeleton EF100 PF driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/sfc/ef100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/sfc/ef100.c b/drivers/net/ethernet/sfc/ef100.c
index c54b7f8243f3..ffdb36715a49 100644
--- a/drivers/net/ethernet/sfc/ef100.c
+++ b/drivers/net/ethernet/sfc/ef100.c
@@ -490,6 +490,7 @@ static int ef100_pci_probe(struct pci_dev *pci_dev,
 	if (fcw.offset > pci_resource_len(efx->pci_dev, fcw.bar) - ESE_GZ_FCW_LEN) {
 		netif_err(efx, probe, efx->net_dev,
 			  "Func control window overruns BAR\n");
+		rc = -EIO;
 		goto fail;
 	}
 
-- 
2.28.0
