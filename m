From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2013 09:49:20 +0000
Subject: [patch] net/fec: "u32" is more explicit than "unsigned long"
Message-Id: <20130823094920.GP31293@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>, "David S. Miller" <davem@davemloft.net>, Fabio Estevam <fabio.estevam@freescale.com>, Frank Li <Frank.Li@freescale.com>, Jim Baxter <jim_baxter@mentor.com>, Fugang Duan <B38611@freescale.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

tmpaddr[] is a six byte array.  We want to set the first four bytes on
the first line and the remaining two on the next line.  The code assumes
that "unsigned long" is 32 bits and obviously that's not true on 64 bit
arches.  It's better to just use u32 instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker thing and I can't compile this file.

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index fdf9307..422b125 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -1100,9 +1100,9 @@ static void fec_get_mac(struct net_device *ndev)
 	 * 4) FEC mac registers set by bootloader
 	 */
 	if (!is_valid_ether_addr(iap)) {
-		*((unsigned long *) &tmpaddr[0]) +		*((u32 *) &tmpaddr[0])  			be32_to_cpu(readl(fep->hwp + FEC_ADDR_LOW));
-		*((unsigned short *) &tmpaddr[4]) +		*((u16 *) &tmpaddr[4])  			be16_to_cpu(readl(fep->hwp + FEC_ADDR_HIGH) >> 16);
 		iap = &tmpaddr[0];
 	}
