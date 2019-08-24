From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 24 Aug 2019 14:49:55 +0000
Subject: [PATCH v2] netfilter: ipset: Fix an error code in ip_set_sockfn_get()
Message-Id: <20190824144955.GA5337@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1908221109390.11879@blackhole.kfki.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, Florent Fourcot <florent.fourcot@wifirst.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Aditya Pakki <pakki001@umn.edu>, Johannes Berg <johannes.berg@intel.com>, Stefano Brivio <sbrivio@redhat.com>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

The copy_to_user() function returns the number of bytes remaining to be
copied.  In this code, that positive return is checked at the end of the
function and we return zero/success.  What we should do instead is
return -EFAULT.

Fixes: a7b4f989a629 ("netfilter: ipset: IP set core support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: I missed the other instance of this issue

 net/netfilter/ipset/ip_set_core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
index e64d5f9a89dd..e7288eab7512 100644
--- a/net/netfilter/ipset/ip_set_core.c
+++ b/net/netfilter/ipset/ip_set_core.c
@@ -2069,8 +2069,9 @@ ip_set_sockfn_get(struct sock *sk, int optval, void __user *user, int *len)
 		}
 
 		req_version->version = IPSET_PROTOCOL;
-		ret = copy_to_user(user, req_version,
-				   sizeof(struct ip_set_req_version));
+		if (copy_to_user(user, req_version,
+				 sizeof(struct ip_set_req_version)))
+			ret = -EFAULT;
 		goto done;
 	}
 	case IP_SET_OP_GET_BYNAME: {
@@ -2129,7 +2130,8 @@ ip_set_sockfn_get(struct sock *sk, int optval, void __user *user, int *len)
 	}	/* end of switch(op) */
 
 copy:
-	ret = copy_to_user(user, data, copylen);
+	if (copy_to_user(user, data, copylen))
+		ret = -EFAULT;
 
 done:
 	vfree(data);
-- 
2.11.0
