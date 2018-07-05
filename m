From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Jul 2018 09:55:49 +0000
Subject: [PATCH] net: tehuti: remove redundant pointer skb
Message-Id: <20180705095549.22042-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gospodarek <andy@greyhouse.net>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer skb is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'skb' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/tehuti/tehuti.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/tehuti/tehuti.c b/drivers/net/ethernet/tehuti/tehuti.c
index 163d8d16bc24..dc966ddb6d81 100644
--- a/drivers/net/ethernet/tehuti/tehuti.c
+++ b/drivers/net/ethernet/tehuti/tehuti.c
@@ -1151,7 +1151,6 @@ static void bdx_recycle_skb(struct bdx_priv *priv, struct rxd_desc *rxdd)
 	struct rx_map *dm;
 	struct rxf_fifo *f;
 	struct rxdb *db;
-	struct sk_buff *skb;
 	int delta;
 
 	ENTER;
@@ -1161,7 +1160,6 @@ static void bdx_recycle_skb(struct bdx_priv *priv, struct rxd_desc *rxdd)
 	DBG("db=%p f=%p\n", db, f);
 	dm = bdx_rxdb_addr_elem(db, rxdd->va_lo);
 	DBG("dm=%p\n", dm);
-	skb = dm->skb;
 	rxfd = (struct rxf_desc *)(f->m.va + f->m.wptr);
 	rxfd->info = CPU_CHIP_SWAP32(0x10003);	/* INFO=1 BC=3 */
 	rxfd->va_lo = rxdd->va_lo;
-- 
2.17.1

