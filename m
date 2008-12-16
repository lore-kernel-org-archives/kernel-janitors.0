From: Julia Lawall <julia@diku.dk>
Date: Tue, 16 Dec 2008 15:14:49 +0000
Subject: [PATCH 8/11] drivers/net/wireless/libertas: Move a dereference below
Message-Id: <Pine.LNX.4.64.0812161614280.20444@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dcbw@redhat.com, libertas-dev@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In each case, if the NULL test is necessary, then the dereference should be
moved below the NULL test.  I have also taken advantage of the availability
of the value of priv->dev in the subsequent calls to netif_stop_queue and
netif_carrier_off.

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
 drivers/net/wireless/libertas/main.c           |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/libertas/main.c b/drivers/net/wireless/libertas/main.c
index 73dc8c7..91c89da 100644
--- a/drivers/net/wireless/libertas/main.c
+++ b/drivers/net/wireless/libertas/main.c
@@ -1311,7 +1311,7 @@ EXPORT_SYMBOL_GPL(lbs_start_card);
 
 void lbs_stop_card(struct lbs_private *priv)
 {
-	struct net_device *dev = priv->dev;
+	struct net_device *dev;
 	struct cmd_ctrl_node *cmdnode;
 	unsigned long flags;
 
@@ -1319,9 +1319,10 @@ void lbs_stop_card(struct lbs_private *priv)
 
 	if (!priv)
 		goto out;
+	dev = priv->dev;
 
-	netif_stop_queue(priv->dev);
-	netif_carrier_off(priv->dev);
+	netif_stop_queue(dev);
+	netif_carrier_off(dev);
 
 	lbs_debugfs_remove_one(priv);
 	if (priv->mesh_tlv) {
