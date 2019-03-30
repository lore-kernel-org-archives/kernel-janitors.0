From: Colin King <colin.king@canonical.com>
Date: Sat, 30 Mar 2019 21:42:41 +0000
Subject: [PATCH] net: dsa: fix negative loop bound error on for loop
Message-Id: <20190330214241.15311-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the for-loop using an unsigned int for the loop counter
which is problematic when comparing it to the signed int count
This is an issue because if the signed int is negative then
the negative loop bound is implicitly cast to an unsigned int on
the comparison to loop counter i and will yield a very large value,
eventually causing an error when memmove/memcpy'ing outside the
allocated region pointed to by ndata.

Fix this by simply making the loop counter i a signed int;

Fixes: f2f2356685bc ("net: dsa: move master ethtool code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/dsa/master.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/dsa/master.c b/net/dsa/master.c
index c58f33931be1..1b659647a303 100644
--- a/net/dsa/master.c
+++ b/net/dsa/master.c
@@ -87,8 +87,7 @@ static void dsa_master_get_strings(struct net_device *dev, uint32_t stringset,
 	struct dsa_switch *ds = cpu_dp->ds;
 	int port = cpu_dp->index;
 	int len = ETH_GSTRING_LEN;
-	int mcount = 0, count;
-	unsigned int i;
+	int mcount = 0, count, i;
 	uint8_t pfx[4];
 	uint8_t *ndata;
 
-- 
2.20.1
