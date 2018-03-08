From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Mar 2018 09:36:04 +0000
Subject: [PATCH 1/2 net-next] net/ncsi: use kfree_skb() instead of kfree()
Message-Id: <20180308093604.GC16525@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We're supposed to use kfree_skb() to free these sk_buffs.

Fixes: 955dc68cb9b2 ("net/ncsi: Add generic netlink family")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
index d4201665a580..b73239b76349 100644
--- a/net/ncsi/ncsi-netlink.c
+++ b/net/ncsi/ncsi-netlink.c
@@ -183,7 +183,7 @@ static int ncsi_pkg_info_nl(struct sk_buff *msg, struct genl_info *info)
 	hdr = genlmsg_put(skb, info->snd_portid, info->snd_seq,
 			  &ncsi_genl_family, 0, NCSI_CMD_PKG_INFO);
 	if (!hdr) {
-		kfree(skb);
+		kfree_skb(skb);
 		return -EMSGSIZE;
 	}
 
@@ -204,7 +204,7 @@ static int ncsi_pkg_info_nl(struct sk_buff *msg, struct genl_info *info)
 
 err:
 	genlmsg_cancel(skb, hdr);
-	kfree(skb);
+	kfree_skb(skb);
 	return rc;
 }
 
