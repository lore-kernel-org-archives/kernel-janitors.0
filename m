From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 06 Jul 2019 08:56:52 +0000
Subject: [PATCH] staging: octeon: One function call less in cvm_oct_common_set_multicast_list()
Message-Id: <9ce376b1-0450-a0ea-bd4e-2601e4bb8168@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <877404bb-a9e4-ffa5-a621-d87fbca549ef@web.de>
In-Reply-To: <877404bb-a9e4-ffa5-a621-d87fbca549ef@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Aaro Koskinen <aaro.koskinen@iki.fi>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ioannis Valasakis <code@wizofe.uk>, =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jul 2019 10:48:23 +0200

Avoid an extra function call by using a ternary operator instead of
a conditional statement.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/octeon/ethernet.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 8847a11c212f..93f127a0b287 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -337,13 +337,8 @@ static void cvm_oct_common_set_multicast_list(struct net_device *dev)

 		cvmx_write_csr(CVMX_GMXX_RXX_ADR_CTL(index, interface),
 			       control.u64);
-		if (dev->flags & IFF_PROMISC)
-			cvmx_write_csr(CVMX_GMXX_RXX_ADR_CAM_EN
-				       (index, interface), 0);
-		else
-			cvmx_write_csr(CVMX_GMXX_RXX_ADR_CAM_EN
-				       (index, interface), 1);
-
+		cvmx_write_csr(CVMX_GMXX_RXX_ADR_CAM_EN(index, interface),
+			       dev->flags & IFF_PROMISC ? 0 : 1);
 		cvmx_write_csr(CVMX_GMXX_PRTX_CFG(index, interface),
 			       gmx_cfg.u64);
 	}
--
2.22.0
