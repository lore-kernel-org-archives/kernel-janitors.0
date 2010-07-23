From: Dan Carpenter <error27@gmail.com>
Date: Fri, 23 Jul 2010 11:05:05 +0000
Subject: [patch -next v2] mv643xx_eth: potential null dereference
Message-Id: <20100723110504.GG26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100723101528.GF26313@bicker> <1279881177.24768.1623.camel@Joe-Laptop.home>
In-Reply-To: <1279881177.24768.1623.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Lennert Buytenhek <buytenh@wantstofly.org>, "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Denis Kirjanov <kirjanov@gmail.com>, Saeed Bishara <saeed@marvell.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We assume that "pd" can be null on the previous line, and throughout the
function so we should check it here as well.  This was introduced by
9b2c2ff7a1c0 "mv643xx_eth: use sw csum for big packets"

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: style change

diff --git a/drivers/net/mv643xx_eth.c b/drivers/net/mv643xx_eth.c
index 73bb8ea..f5e72fe 100644
--- a/drivers/net/mv643xx_eth.c
+++ b/drivers/net/mv643xx_eth.c
@@ -2670,7 +2670,8 @@ static int mv643xx_eth_shared_probe(struct platform_device *pdev)
 	 * Detect hardware parameters.
 	 */
 	msp->t_clk = (pd != NULL && pd->t_clk != 0) ? pd->t_clk : 133000000;
-	msp->tx_csum_limit = pd->tx_csum_limit ? pd->tx_csum_limit : 9 * 1024;
+	msp->tx_csum_limit = (pd != NULL && pd->tx_csum_limit) ?
+					pd->tx_csum_limit : 9 * 1024;
 	infer_hw_params(msp);
 
 	platform_set_drvdata(pdev, msp);
