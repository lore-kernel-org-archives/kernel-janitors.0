From: Colin King <colin.king@canonical.com>
Date: Sun, 24 Jun 2018 10:57:31 +0000
Subject: [PATCH] sfc: make function efx_rps_hash_bucket static
Message-Id: <20180624105731.5167-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Edward Cree <ecree@solarflare.com>, Bert Kenward <bkenward@solarflare.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function efx_rps_hash_bucket is local to the source and
does not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'efx_rps_hash_bucket' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/sfc/efx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/sfc/efx.c b/drivers/net/ethernet/sfc/efx.c
index ad4a354ce570..570ec72266f3 100644
--- a/drivers/net/ethernet/sfc/efx.c
+++ b/drivers/net/ethernet/sfc/efx.c
@@ -3180,6 +3180,7 @@ bool efx_rps_check_rule(struct efx_arfs_rule *rule, unsigned int filter_idx,
 	return true;
 }
 
+static
 struct hlist_head *efx_rps_hash_bucket(struct efx_nic *efx,
 				       const struct efx_filter_spec *spec)
 {
-- 
2.17.0

