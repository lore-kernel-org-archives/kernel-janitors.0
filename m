From: Julia Lawall <julia@diku.dk>
Date: Sun, 06 Nov 2011 13:26:47 +0000
Subject: [PATCH 2/5] net/sunrpc: use kstrtoul, etc
Message-Id: <1320586010-21931-3-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1320586010-21931-1-git-send-email-julia@diku.dk>
In-Reply-To: <1320586010-21931-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: kernel-janitors@vger.kernel.org, Neil Brown <neilb@suse.de>, Trond Myklebust <Trond.Myklebust@netapp.com>, "David S. Miller" <davem@davemloft.net>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kstrtoul, etc instead of the now deprecated strict_strtoul, etc.

A semantic patch rule for the kstrtoul case is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression a,b;
{int,long} *c;
@@

-strict_strtoul
+kstrtoul
 (a,b,c)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 net/sunrpc/addr.c     |    6 +++---
 net/sunrpc/auth.c     |    2 +-
 net/sunrpc/xprtsock.c |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff -u -p a/net/sunrpc/addr.c b/net/sunrpc/addr.c
--- a/net/sunrpc/addr.c
+++ b/net/sunrpc/addr.c
@@ -182,7 +182,7 @@ static int rpc_parse_scope_id(const char
 			scope_id = dev->ifindex;
 			dev_put(dev);
 		} else {
-			if (strict_strtoul(p, 10, &scope_id) = 0) {
+			if (kstrtoul(p, 10, &scope_id) = 0) {
 				kfree(p);
 				return 0;
 			}
@@ -322,7 +322,7 @@ size_t rpc_uaddr2sockaddr(const char *ua
 	c = strrchr(buf, '.');
 	if (unlikely(c = NULL))
 		return 0;
-	if (unlikely(strict_strtoul(c + 1, 10, &portlo) != 0))
+	if (unlikely(kstrtoul(c + 1, 10, &portlo) != 0))
 		return 0;
 	if (unlikely(portlo > 255))
 		return 0;
@@ -331,7 +331,7 @@ size_t rpc_uaddr2sockaddr(const char *ua
 	c = strrchr(buf, '.');
 	if (unlikely(c = NULL))
 		return 0;
-	if (unlikely(strict_strtoul(c + 1, 10, &porthi) != 0))
+	if (unlikely(kstrtoul(c + 1, 10, &porthi) != 0))
 		return 0;
 	if (unlikely(porthi > 255))
 		return 0;
diff -u -p a/net/sunrpc/auth.c b/net/sunrpc/auth.c
--- a/net/sunrpc/auth.c
+++ b/net/sunrpc/auth.c
@@ -47,7 +47,7 @@ static int param_set_hashtbl_sz(const ch
 
 	if (!val)
 		goto out_inval;
-	ret = strict_strtoul(val, 0, &num);
+	ret = kstrtoul(val, 0, &num);
 	if (ret = -EINVAL)
 		goto out_inval;
 	nbits = fls(num);
diff -u -p a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2925,7 +2925,7 @@ static int param_set_uint_minmax(const c
 
 	if (!val)
 		return -EINVAL;
-	ret = strict_strtoul(val, 0, &num);
+	ret = kstrtoul(val, 0, &num);
 	if (ret = -EINVAL || num < min || num > max)
 		return -EINVAL;
 	*((unsigned int *)kp->arg) = num;

