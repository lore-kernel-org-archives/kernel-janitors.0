From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Jul 2011 07:28:12 +0000
Subject: [patch] packet: add an unlock on error in fanout_add()
Message-Id: <20110708072812.GX18655@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, Changli Gao <xiaosuo@gmail.com>, Ben Greear <greearb@candelatech.com>, Neil Horman <nhorman@tuxdriver.com>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

We need to release the "fanout_mutex" here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index aec50a1..3cbe950 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -589,8 +589,10 @@ static int fanout_add(struct sock *sk, u16 id, u16 type_flags)
 			break;
 		}
 	}
-	if (match && match->defrag != defrag)
-		return -EINVAL;
+	if (match && match->defrag != defrag) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
 	if (!match) {
 		match = kzalloc(sizeof(*match), GFP_KERNEL);
 		if (match) {
@@ -626,6 +628,8 @@ static int fanout_add(struct sock *sk, u16 id, u16 type_flags)
 			}
 		}
 	}
+
+out_unlock:
 	mutex_unlock(&fanout_mutex);
 	return err;
 }
