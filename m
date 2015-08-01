From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 01 Aug 2015 12:33:26 +0000
Subject: [patch] rds: fix an integer overflow test in rds_info_getsockopt()
Message-Id: <20150801123326.GA5075@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chien Yen <chien.yen@oracle.com>, Andy Grover <agrover@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"len" is a signed integer.  We check that len is not negative, so it
goes from zero to INT_MAX.  PAGE_SIZE is unsigned long so the comparison
is type promoted to unsigned long.  ULONG_MAX - 4095 is a higher than
INT_MAX so the condition can never be true.

I don't know if this is harmful but it seems safe to limit "len" to
INT_MAX - 4095.

Fixes: a8c879a7ee98 ('RDS: Info and stats')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/rds/info.c b/net/rds/info.c
index 9a6b4f6..140a44a 100644
--- a/net/rds/info.c
+++ b/net/rds/info.c
@@ -176,7 +176,7 @@ int rds_info_getsockopt(struct socket *sock, int optname, char __user *optval,
 
 	/* check for all kinds of wrapping and the like */
 	start = (unsigned long)optval;
-	if (len < 0 || len + PAGE_SIZE - 1 < len || start + len < start) {
+	if (len < 0 || len > INT_MAX - PAGE_SIZE + 1 || start + len < start) {
 		ret = -EINVAL;
 		goto out;
 	}
