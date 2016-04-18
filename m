From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Apr 2016 08:44:49 +0000
Subject: [patch -next] udp: fix if statement in SIOCINQ ioctl
Message-Id: <20160418084449.GA12410@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Willem de Bruijn <willemb@google.com>
Cc: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We deleted a line of code and accidentally made the "return put_user()"
part of the if statement when it's supposed to be unconditional.

Fixes: 9f9a45beaa96 ('udp: do not expect udp headers on ioctl SIOCINQ')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index f186313..37e09c3 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -1276,12 +1276,6 @@ int udp_ioctl(struct sock *sk, int cmd, unsigned long arg)
 	{
 		unsigned int amount = first_packet_length(sk);
 
-		if (amount)
-			/*
-			 * We will only return the amount
-			 * of this packet since that is all
-			 * that will be read.
-			 */
 		return put_user(amount, (int __user *)arg);
 	}
 
