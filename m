From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 26 Dec 2019 15:02:24 +0000
Subject: [PATCH] sfc: avoid duplicate error handling code in 'efx_ef10_sriov_set_vf_mac()'
Message-Id: <20191226150224.8701-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-net-drivers@solarflare.com, ecree@solarflare.com, mhabets@solarflare.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'eth_zero_addr()' is already called in the error handling path. This is
harmless, but there is no point in calling it twice, so remove one.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/sfc/ef10_sriov.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/sfc/ef10_sriov.c b/drivers/net/ethernet/sfc/ef10_sriov.c
index 52bd43f45761..14393767ef9f 100644
--- a/drivers/net/ethernet/sfc/ef10_sriov.c
+++ b/drivers/net/ethernet/sfc/ef10_sriov.c
@@ -522,10 +522,9 @@ int efx_ef10_sriov_set_vf_mac(struct efx_nic *efx, int vf_i, u8 *mac)
 
 	if (!is_zero_ether_addr(mac)) {
 		rc = efx_ef10_vport_add_mac(efx, vf->vport_id, mac);
-		if (rc) {
-			eth_zero_addr(vf->mac);
+		if (rc)
 			goto fail;
-		}
+
 		if (vf->efx)
 			ether_addr_copy(vf->efx->net_dev->dev_addr, mac);
 	}
-- 
2.20.1
