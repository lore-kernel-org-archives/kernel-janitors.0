From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 18 Feb 2017 21:34:59 +0000
Subject: [patch] sunrpc: silence uninitialized variable warning
Message-Id: <20170218213459.GA32320@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, Jeff Layton <jlayton@poochiereds.net>, "David S. Miller" <davem@davemloft.net>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

kstrtouint() can return a couple different error codes so the check for
"ret = -EINVAL" is wrong and static analysis tools correctly complain
that we can use "num" without initializing it.  It's not super harmful
because we check the bounds.  But it's also easy enough to fix.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 956c7bce80d1..311ce92384b7 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -3209,7 +3209,9 @@ static int param_set_uint_minmax(const char *val,
 	if (!val)
 		return -EINVAL;
 	ret = kstrtouint(val, 0, &num);
-	if (ret = -EINVAL || num < min || num > max)
+	if (ret)
+		return ret;
+	if (num < min || num > max)
 		return -EINVAL;
 	*((unsigned int *)kp->arg) = num;
 	return 0;
