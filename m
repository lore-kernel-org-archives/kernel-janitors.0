From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 28 Oct 2020 11:53:49 +0000
Subject: [PATCH] ipv6: mcast: make annotations for ip6_mc_msfget() consistent
Message-Id: <20201028115349.6855-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 931ca7ab7fe8 ("ip*_mc_gsfget(): lift copyout of struct group_filter
into callers") adjusted the type annotations for ip6_mc_msfget() at its
declaration, but missed the type annotations at its definition.

Hence, sparse complains on ./net/ipv6/mcast.c:

  mcast.c:550:5: error: symbol 'ip6_mc_msfget' redeclared with different type \
  (incompatible argument 3 (different address spaces))

Make ip6_mc_msfget() annotations consistent, which also resolves this
warning from sparse:

  mcast.c:607:34: warning: incorrect type in argument 1 (different address spaces)
  mcast.c:607:34:    expected void [noderef] __user *to
  mcast.c:607:34:    got struct __kernel_sockaddr_storage *p

No functional change. No change in object code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201028

David, Jakub, please pick this minor non-urgent clean-up patch.

 net/ipv6/mcast.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
index 8cd2782a31e4..6c8604390266 100644
--- a/net/ipv6/mcast.c
+++ b/net/ipv6/mcast.c
@@ -548,7 +548,7 @@ int ip6_mc_msfilter(struct sock *sk, struct group_filter *gsf,
 }
 
 int ip6_mc_msfget(struct sock *sk, struct group_filter *gsf,
-	struct sockaddr_storage *p)
+		  struct sockaddr_storage __user *p)
 {
 	int err, i, count, copycount;
 	const struct in6_addr *group;
-- 
2.17.1
