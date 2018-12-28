From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 28 Dec 2018 22:28:21 +0000
Subject: [PATCH] net/ipv6: Fix a test against 'ipv6_find_idev()' return value
Message-Id: <20181228222821.20332-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, sd@queasysnail.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'ipv6_find_idev()' returns NULL on error, not an error pointer.
Update the test accordingly and return -ENOBUFS, as already done in
'addrconf_add_dev()', if NULL is returned.

Fixes: ("ipv6: allow userspace to add IFA_F_OPTIMISTIC addresses")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/ipv6/addrconf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 521e471f1cf9..8eeec6eb2bd3 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -4736,8 +4736,8 @@ inet6_rtm_newaddr(struct sk_buff *skb, struct nlmsghdr *nlh,
 			 IFA_F_MCAUTOJOIN | IFA_F_OPTIMISTIC;
 
 	idev = ipv6_find_idev(dev);
-	if (IS_ERR(idev))
-		return PTR_ERR(idev);
+	if (!idev)
+		return -ENOBUFS;
 
 	if (!ipv6_allow_optimistic_dad(net, idev))
 		cfg.ifa_flags &= ~IFA_F_OPTIMISTIC;
-- 
2.19.1
