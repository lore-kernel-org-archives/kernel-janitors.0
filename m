From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Mar 2010 11:47:00 +0000
Subject: [patch] af_key: return error if pfkey_xfrm_policy2msg_prep() fails
Message-Id: <20100324114700.GB21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <hadi@cyberus.ca>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>, Stephen Hemminger <shemminger@vyatta.com>, Alexey Dobriyan <adobriyan@gmail.com>, kernel-janitors@vger.kernel.org

The original code saved the error value but just returned 0 in the end.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/key/af_key.c b/net/key/af_key.c
index 3687078..344145f 100644
--- a/net/key/af_key.c
+++ b/net/key/af_key.c
@@ -2129,10 +2129,9 @@ static int key_notify_policy(struct xfrm_policy *xp, int dir, struct km_event *c
 	int err;
 
 	out_skb = pfkey_xfrm_policy2msg_prep(xp);
-	if (IS_ERR(out_skb)) {
-		err = PTR_ERR(out_skb);
-		goto out;
-	}
+	if (IS_ERR(out_skb))
+		return PTR_ERR(out_skb);
+
 	err = pfkey_xfrm_policy2msg(out_skb, xp, dir);
 	if (err < 0)
 		return err;
@@ -2148,7 +2147,6 @@ static int key_notify_policy(struct xfrm_policy *xp, int dir, struct km_event *c
 	out_hdr->sadb_msg_seq = c->seq;
 	out_hdr->sadb_msg_pid = c->pid;
 	pfkey_broadcast(out_skb, GFP_ATOMIC, BROADCAST_ALL, NULL, xp_net(xp));
-out:
 	return 0;
 
 }
