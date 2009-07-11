From: Julia Lawall <julia@diku.dk>
Date: Sat, 11 Jul 2009 07:50:29 +0000
Subject: [PATCH 3/5] drivers/isdn: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0907110950100.29592@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: isdn@linux-pingi.de, isdn4linux@listserv.isdn4linux.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/isdn/hysdn/hysdn_net.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -u -p a/drivers/isdn/hysdn/hysdn_net.c b/drivers/isdn/hysdn/hysdn_net.c
--- a/drivers/isdn/hysdn/hysdn_net.c
+++ b/drivers/isdn/hysdn/hysdn_net.c
@@ -187,11 +187,12 @@ void
 hysdn_rx_netpkt(hysdn_card * card, unsigned char *buf, unsigned short len)
 {
 	struct net_local *lp = card->netif;
-	struct net_device *dev = lp->dev;
+	struct net_device *dev;
 	struct sk_buff *skb;
 
 	if (!lp)
 		return;		/* non existing device */
+	dev = lp->dev;
 
 	dev->stats.rx_bytes += len;
 
