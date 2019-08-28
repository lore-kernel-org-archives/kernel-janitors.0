From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Aug 2019 23:14:50 +0000
Subject: [PATCH][V2] arcnet: capmode: remove redundant assignment to pointer pkt
Message-Id: <20190828231450.22424-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Grzeschik <m.grzeschik@pengutronix.de>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer pkt is being initialized with a value that is never read
and pkt is being re-assigned a little later on. The assignment is
redundant and hence can be removed.

Addresses-Coverity: ("Ununsed value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: fix typo in patch description, pkg -> pkt

---
 drivers/net/arcnet/capmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/arcnet/capmode.c b/drivers/net/arcnet/capmode.c
index b780be6f41ff..c09b567845e1 100644
--- a/drivers/net/arcnet/capmode.c
+++ b/drivers/net/arcnet/capmode.c
@@ -44,7 +44,7 @@ static void rx(struct net_device *dev, int bufnum,
 {
 	struct arcnet_local *lp = netdev_priv(dev);
 	struct sk_buff *skb;
-	struct archdr *pkt = pkthdr;
+	struct archdr *pkt;
 	char *pktbuf, *pkthdrbuf;
 	int ofs;
 
-- 
2.20.1
