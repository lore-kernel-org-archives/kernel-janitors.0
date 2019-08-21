From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2019 07:18:30 +0000
Subject: [PATCH] netfilter: ipset: Fix an error code in ip_set_sockfn_get()
Message-Id: <20190821071830.GI26957@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, Florent Fourcot <florent.fourcot@wifirst.fr>, Kate Stewart <kstewart@linuxfoundation.org>, Allison Randal <allison@lohutok.net>, Aditya Pakki <pakki001@umn.edu>, Qian Cai <cai@gmx.us>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Johannes Berg <johannes.berg@intel.com>, Stefano Brivio <sbrivio@redhat.com>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

The copy_to_user() function returns the number of bytes remaining to be
copied.  In this code, that positive return is checked at the end of the
function and we return zero/success.  What we should do instead is
return -EFAULT.

Fixes: a7b4f989a629 ("netfilter: ipset: IP set core support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/netfilter/ipset/ip_set_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
index e64d5f9a89dd..15b8d4318207 100644
--- a/net/netfilter/ipset/ip_set_core.c
+++ b/net/netfilter/ipset/ip_set_core.c
@@ -2129,7 +2129,8 @@ ip_set_sockfn_get(struct sock *sk, int optval, void __user *user, int *len)
 	}	/* end of switch(op) */
 
 copy:
-	ret = copy_to_user(user, data, copylen);
+	if (copy_to_user(user, data, copylen))
+		ret = -EFAULT;
 
 done:
 	vfree(data);
-- 
2.20.1
