From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Feb 2019 08:28:16 +0000
Subject: [PATCH net] skge: potential memory corruption in skge_get_regs()
Message-Id: <20190201082816.GB8459@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mirko Lindner <mlindner@marvell.com>, Stephen Hemminger <stephen@networkplumber.org>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "p" buffer is 0x4000 bytes long.  B3_RI_WTO_R1 is 0x190.  The value
of "regs->len" is in the 1-0x4000 range.  The bug here is that
"regs->len - B3_RI_WTO_R1" can be a negative value which would lead to
memory corruption and an abrupt crash.

Fixes: c3f8be961808 ("[PATCH] skge: expand ethtool debug register dump")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/marvell/skge.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/skge.c b/drivers/net/ethernet/marvell/skge.c
index 04fd1f135011..654ac534b10e 100644
--- a/drivers/net/ethernet/marvell/skge.c
+++ b/drivers/net/ethernet/marvell/skge.c
@@ -152,8 +152,10 @@ static void skge_get_regs(struct net_device *dev, struct ethtool_regs *regs,
 	memset(p, 0, regs->len);
 	memcpy_fromio(p, io, B3_RAM_ADDR);
 
-	memcpy_fromio(p + B3_RI_WTO_R1, io + B3_RI_WTO_R1,
-		      regs->len - B3_RI_WTO_R1);
+	if (regs->len > B3_RI_WTO_R1) {
+		memcpy_fromio(p + B3_RI_WTO_R1, io + B3_RI_WTO_R1,
+			      regs->len - B3_RI_WTO_R1);
+	}
 }
 
 /* Wake on Lan only supported on Yukon chips with rev 1 or above */
-- 
2.17.1
