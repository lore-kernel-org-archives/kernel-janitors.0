From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Jan 2013 06:38:34 +0000
Subject: [patch] ip6mr: limit IPv6 MRT_TABLE identifiers
Message-Id: <20130124063834.GA5611@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We did this for IPv4 in b49d3c1e1c "net: ipmr: limit MRT_TABLE
identifiers" but we need to do it for IPv6 as well.  On IPv6 the name
is "pim6reg" instead of "pimreg" so there is one less digit allowed.

The strcpy() is in ip6mr_reg_vif().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ipv6/ip6mr.c b/net/ipv6/ip6mr.c
index acc3249..351ce98 100644
--- a/net/ipv6/ip6mr.c
+++ b/net/ipv6/ip6mr.c
@@ -1766,6 +1766,9 @@ int ip6_mroute_setsockopt(struct sock *sk, int optname, char __user *optval, uns
 			return -EINVAL;
 		if (get_user(v, (u32 __user *)optval))
 			return -EFAULT;
+		/* "pim6reg%u" should not exceed 16 bytes (IFNAMSIZ) */
+		if (v != RT_TABLE_DEFAULT && v >= 100000000)
+			return -EINVAL;
 		if (sk = mrt->mroute6_sk)
 			return -EBUSY;
 
