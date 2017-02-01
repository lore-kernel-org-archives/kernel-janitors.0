From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Feb 2017 08:50:40 +0000
Subject: [patch net-next] sfc: a couple off by one bugs
Message-Id: <20170201085040.GA31514@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Edward Cree <ecree@solarflare.com>
Cc: Bert Kenward <bkenward@solarflare.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

These checks are off by one.  These are just sanity checks and we don't
ever pass invalid values for "encap_type" so it's harmless.

Fixes: 9b4108012517 ("sfc: insert catch-all filters for encapsulated traffic")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/sfc/ef10.c b/drivers/net/ethernet/sfc/ef10.c
index 8bec9383d754..dec0c8083ff3 100644
--- a/drivers/net/ethernet/sfc/ef10.c
+++ b/drivers/net/ethernet/sfc/ef10.c
@@ -5080,7 +5080,7 @@ static int efx_ef10_filter_insert_def(struct efx_nic *efx,
 
 		/* quick bounds check (BCAST result impossible) */
 		BUILD_BUG_ON(EFX_EF10_BCAST != 0);
-		if (encap_type > ARRAY_SIZE(map) || map[encap_type] = 0) {
+		if (encap_type >= ARRAY_SIZE(map) || map[encap_type] = 0) {
 			WARN_ON(1);
 			return -EINVAL;
 		}
@@ -5134,7 +5134,7 @@ static int efx_ef10_filter_insert_def(struct efx_nic *efx,
 
 		/* quick bounds check (BCAST result impossible) */
 		BUILD_BUG_ON(EFX_EF10_BCAST != 0);
-		if (encap_type > ARRAY_SIZE(map) || map[encap_type] = 0) {
+		if (encap_type >= ARRAY_SIZE(map) || map[encap_type] = 0) {
 			WARN_ON(1);
 			return -EINVAL;
 		}
