From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 May 2020 10:16:22 +0000
Subject: [PATCH 1/2 net] net: mvpp2: prevent buffer overflow in mvpp22_rss_ctx()
Message-Id: <20200506101622.GB77004@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Matteo Croce <mcroce@redhat.com>, Russell King <rmk+kernel@armlinux.org.uk>, Antoine Tenart <antoine.tenart@bootlin.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "rss_context" variable comes from the user via  ethtool_get_rxfh().
It can be any u32 value except zero.  Eventually it gets passed to
mvpp22_rss_ctx() and if it is over MVPP22_N_RSS_TABLES (8) then it
results in an array overflow.

Fixes: 895586d5dc32 ("net: mvpp2: cls: Use RSS contexts to handle RSS tables")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 1fa60e985b43a..2b5dad2ec650c 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -4329,6 +4329,8 @@ static int mvpp2_ethtool_get_rxfh_context(struct net_device *dev, u32 *indir,
 
 	if (!mvpp22_rss_is_supported())
 		return -EOPNOTSUPP;
+	if (rss_context >= MVPP22_N_RSS_TABLES)
+		return -EINVAL;
 
 	if (hfunc)
 		*hfunc = ETH_RSS_HASH_CRC32;
-- 
2.26.2
