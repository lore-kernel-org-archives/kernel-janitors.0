From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 23 May 2020 17:46:48 +0000
Subject: [PATCH net-next] ipv4:  potential underflow in compat_ip_setsockopt()
Message-Id: <20200523174648.GA105146@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, "David S. Miller" <davem@davemloft.net>
Cc: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The value of "n" is capped at 0x1ffffff but it checked for negative
values.  I don't think this causes a problem but I'm not certain and
it's harmless to prevent it.

Fixes: 2e04172875c9 ("ipv4: do compat setsockopt for MCAST_MSFILTER directly")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---

 net/ipv4/ip_sockglue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index a2469bc57cfe..f43d5f12aa86 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -1347,8 +1347,8 @@ int compat_ip_setsockopt(struct sock *sk, int level, int optname,
 	{
 		const int size0 = offsetof(struct compat_group_filter, gf_slist);
 		struct compat_group_filter *gf32;
+		unsigned int n;
 		void *p;
-		int n;
 
 		if (optlen < size0)
 			return -EINVAL;
-- 
2.26.2
