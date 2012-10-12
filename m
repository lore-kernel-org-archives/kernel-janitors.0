From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Oct 2012 07:31:46 +0000
Subject: [patch] RDS: fix an integer overflow check
Message-Id: <20121012073146.GA9543@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Venkat Venkatsubra <venkat.x.venkatsubra@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"len" is an int.  We verified that len was postive already.  Since
PAGE_SIZE is specified as an unsigned long, the type it promoted to
unsigned and the condition is never true.

I'm not sure this check is actually needed.  It might be that we could
just remove it?

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/rds/info.c b/net/rds/info.c
index 9a6b4f6..4d62618 100644
--- a/net/rds/info.c
+++ b/net/rds/info.c
@@ -176,7 +176,7 @@ int rds_info_getsockopt(struct socket *sock, int optname, char __user *optval,
 
 	/* check for all kinds of wrapping and the like */
 	start = (unsigned long)optval;
-	if (len < 0 || len + PAGE_SIZE - 1 < len || start + len < start) {
+	if (len < 0 || len > INT_MAX - (PAGE_SIZE - 1) || start + len < start) {
 		ret = -EINVAL;
 		goto out;
 	}
