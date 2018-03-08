From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Mar 2018 09:36:28 +0000
Subject: [PATCH 2/2 net-next] net/ncsi: unlock on error in ncsi_set_interface_nl()
Message-Id: <20180308093628.GD16525@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There are two error paths which are missing unlocks in this function.

Fixes: 955dc68cb9b2 ("net/ncsi: Add generic netlink family")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
index b73239b76349..05fcfb4fbe1d 100644
--- a/net/ncsi/ncsi-netlink.c
+++ b/net/ncsi/ncsi-netlink.c
@@ -299,6 +299,7 @@ static int ncsi_set_interface_nl(struct sk_buff *msg, struct genl_info *info)
 			package = np;
 	if (!package) {
 		/* The user has set a package that does not exist */
+		spin_unlock_irqrestore(&ndp->lock, flags);
 		return -ERANGE;
 	}
 
@@ -317,6 +318,7 @@ static int ncsi_set_interface_nl(struct sk_buff *msg, struct genl_info *info)
 		/* The user has set a channel that does not exist on this
 		 * package
 		 */
+		spin_unlock_irqrestore(&ndp->lock, flags);
 		netdev_info(ndp->ndev.dev, "NCSI: Channel %u does not exist!\n",
 			    channel_id);
 		return -ERANGE;
