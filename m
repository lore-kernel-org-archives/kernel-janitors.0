From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 Mar 2008 16:04:39 +0000
Subject: [PATCH 6/7] drivers/net/ipg.c: remove unused variable
Message-Id: <Pine.LNX.4.64.0803151704150.24178@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jesse@icplus.com.tw, jgarzik@pobox.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The variable gig is initialized but never used otherwise.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
identifier i;
constant C;
@@

(
extern T i;
|
- T i;
  <+... when != i
- i = C;
  ...+>
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 drivers/net/ipg.c |    3 ---
 1 file changed, 3 deletions(-)

diff -u -p a/drivers/net/ipg.c b/drivers/net/ipg.c
--- a/drivers/net/ipg.c 2008-03-12 14:13:13.000000000 +0100
+++ b/drivers/net/ipg.c 2008-03-15 11:17:14.000000000 +0100
@@ -472,7 +472,6 @@ static int ipg_config_autoneg(struct net
 	unsigned int txflowcontrol;
 	unsigned int rxflowcontrol;
 	unsigned int fullduplex;
-	unsigned int gig;
 	u32 mac_ctrl_val;
 	u32 asicctrl;
 	u8 phyctrl;
@@ -489,7 +488,6 @@ static int ipg_config_autoneg(struct net
 	fullduplex = 0;
 	txflowcontrol = 0;
 	rxflowcontrol = 0;
-	gig = 0;
 
 	/* To accomodate a problem in 10Mbps operation,
 	 * set a global flag if PHY running in 10Mbps mode.
@@ -511,7 +509,6 @@ static int ipg_config_autoneg(struct net
 		break;
 	case IPG_PC_LINK_SPEED_1000MBPS:
 		printk("1000Mbps.\n");
-		gig = 1;
 		break;
 	default:
 		printk("undefined!\n");
