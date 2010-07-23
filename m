From: Dan Carpenter <error27@gmail.com>
Date: Fri, 23 Jul 2010 10:15:28 +0000
Subject: [patch -next] mv643xx_eth: potential null dereference
Message-Id: <20100723101528.GF26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lennert Buytenhek <buytenh@wantstofly.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Denis Kirjanov <kirjanov@gmail.com>, Saeed Bishara <saeed@marvell.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We assume that "pd" can be null on the previous line, and throughout the
function so we should check it here as well.  This was introduced by
9b2c2ff7a1c0 "mv643xx_eth: use sw csum for big packets"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/mv643xx_eth.c b/drivers/net/mv643xx_eth.c
index 2fcdb1e..9166f55 100644
--- a/drivers/net/mv643xx_eth.c
+++ b/drivers/net/mv643xx_eth.c
@@ -2675,7 +2675,8 @@ static int mv643xx_eth_shared_probe(struct platform_device *pdev)
 	 * Detect hardware parameters.
 	 */
 	msp->t_clk = (pd != NULL && pd->t_clk != 0) ? pd->t_clk : 133000000;
-	msp->tx_csum_limit = pd->tx_csum_limit ? pd->tx_csum_limit : 9 * 1024;
+	msp->tx_csum_limit = (pd && pd->tx_csum_limit) ?
+					pd->tx_csum_limit : 9 * 1024;
 	infer_hw_params(msp);
 
 	platform_set_drvdata(pdev, msp);
