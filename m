From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Mar 2015 12:54:13 +0000
Subject: [PATCH 2/4] n_gsm: Drop unneeded cast on netdev_priv
Message-Id: <1427633655-32103-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The result of netdev_priv is already implicitly cast to the type of the
left side of the assignment.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
T *x;
@@

x = 
- (T *)
  netdev_priv(...)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/tty/n_gsm.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff -u -p a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -2669,7 +2669,7 @@ static inline void muxnet_put(struct gsm
 static int gsm_mux_net_start_xmit(struct sk_buff *skb,
 				      struct net_device *net)
 {
-	struct gsm_mux_net *mux_net = (struct gsm_mux_net *)netdev_priv(net);
+	struct gsm_mux_net *mux_net = netdev_priv(net);
 	struct gsm_dlci *dlci = mux_net->dlci;
 	muxnet_get(mux_net);
 
@@ -2698,7 +2698,7 @@ static void gsm_mux_rx_netchar(struct gs
 {
 	struct net_device *net = dlci->net;
 	struct sk_buff *skb;
-	struct gsm_mux_net *mux_net = (struct gsm_mux_net *)netdev_priv(net);
+	struct gsm_mux_net *mux_net = netdev_priv(net);
 	muxnet_get(mux_net);
 
 	/* Allocate an sk_buff */
@@ -2727,7 +2727,7 @@ static void gsm_mux_rx_netchar(struct gs
 
 static int gsm_change_mtu(struct net_device *net, int new_mtu)
 {
-	struct gsm_mux_net *mux_net = (struct gsm_mux_net *)netdev_priv(net);
+	struct gsm_mux_net *mux_net = netdev_priv(net);
 	if ((new_mtu < 8) || (new_mtu > mux_net->dlci->gsm->mtu))
 		return -EINVAL;
 	net->mtu = new_mtu;
@@ -2763,7 +2763,7 @@ static void gsm_destroy_network(struct g
 	pr_debug("destroy network interface");
 	if (!dlci->net)
 		return;
-	mux_net = (struct gsm_mux_net *)netdev_priv(dlci->net);
+	mux_net = netdev_priv(dlci->net);
 	muxnet_put(mux_net);
 }
 
@@ -2801,7 +2801,7 @@ static int gsm_create_network(struct gsm
 		return -ENOMEM;
 	}
 	net->mtu = dlci->gsm->mtu;
-	mux_net = (struct gsm_mux_net *)netdev_priv(net);
+	mux_net = netdev_priv(net);
 	mux_net->dlci = dlci;
 	kref_init(&mux_net->ref);
 	strncpy(nc->if_name, net->name, IFNAMSIZ); /* return net name */

