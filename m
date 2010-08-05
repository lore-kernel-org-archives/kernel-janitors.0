From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:22:20 +0000
Subject: [PATCH 18/42] drivers/net: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052222000.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In amd8111e.c, indent the branch of an if.
In eepro.c, outdent the code following the if.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/amd8111e.c |    4 ++--
 drivers/net/eepro.c    |    8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/amd8111e.c b/drivers/net/amd8111e.c
index 585c25f..1f5fc64 100644
--- a/drivers/net/amd8111e.c
+++ b/drivers/net/amd8111e.c
@@ -396,7 +396,7 @@ static int amd8111e_set_coalesce(struct net_device * dev, enum coal_mode cmod)
 			event_count = coal_conf->rx_event_count;
 			if( timeout > MAX_TIMEOUT ||
 					event_count > MAX_EVENT_COUNT )
-			return -EINVAL;
+				return -EINVAL;
 
 			timeout = timeout * DELAY_TIMER_CONV;
 			writel(VAL0|STINTEN, mmio+INTEN0);
@@ -409,7 +409,7 @@ static int amd8111e_set_coalesce(struct net_device * dev, enum coal_mode cmod)
 			event_count = coal_conf->tx_event_count;
 			if( timeout > MAX_TIMEOUT ||
 					event_count > MAX_EVENT_COUNT )
-			return -EINVAL;
+				return -EINVAL;
 
 
 			timeout = timeout * DELAY_TIMER_CONV;
diff --git a/drivers/net/eepro.c b/drivers/net/eepro.c
index 8d97f16..7c82631 100644
--- a/drivers/net/eepro.c
+++ b/drivers/net/eepro.c
@@ -1457,11 +1457,11 @@ hardware_send_packet(struct net_device *dev, void *buf, short length)
 	if (net_debug > 5)
 		printk(KERN_DEBUG "%s: entering hardware_send_packet routine.\n", dev->name);
 
-		/* determine how much of the transmit buffer space is available */
-		if (lp->tx_end > lp->tx_start)
+	/* determine how much of the transmit buffer space is available */
+	if (lp->tx_end > lp->tx_start)
 		tx_available = lp->xmt_ram - (lp->tx_end - lp->tx_start);
-		else if (lp->tx_end < lp->tx_start)
-			tx_available = lp->tx_start - lp->tx_end;
+	else if (lp->tx_end < lp->tx_start)
+		tx_available = lp->tx_start - lp->tx_end;
 	else tx_available = lp->xmt_ram;
 
 	if (((((length + 3) >> 1) << 1) + 2*XMT_HEADER) >= tx_available) {
