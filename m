From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Feb 2016 19:30:46 +0000
Subject: [patch 1/6] staging: gdm72xx: underflow in netlink_rcv_cb()
Message-Id: <20160222193046.GA23565@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Masanari Iida <standby24x7@gmail.com>, Alison Schofield <amsfield22@gmail.com>, Shraddha Barke <shraddha.6596@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If nlh->nlmsg_len is less than ND_IFINDEX_LEN we end up trying to memcpy
a negative size.  I also re-ordered slighty the condition to make it
more uniform.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gdm72xx/netlink_k.c b/drivers/staging/gdm72xx/netlink_k.c
index cf0b47c..4089b17 100644
--- a/drivers/staging/gdm72xx/netlink_k.c
+++ b/drivers/staging/gdm72xx/netlink_k.c
@@ -55,7 +55,8 @@ static void netlink_rcv_cb(struct sk_buff *skb)
 	if (skb->len >= NLMSG_HDRLEN) {
 		nlh = (struct nlmsghdr *)skb->data;
 
-		if (skb->len < nlh->nlmsg_len ||
+		if (nlh->nlmsg_len < ND_IFINDEX_LEN ||
+		    nlh->nlmsg_len > skb->len ||
 		    nlh->nlmsg_len > ND_MAX_MSG_LEN) {
 			netdev_err(skb->dev, "Invalid length (%d,%d)\n",
 				   skb->len, nlh->nlmsg_len);
