From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Oct 2020 11:44:10 +0000
Subject: [PATCH][next] net/sunrpc: fix unsigned size_t comparison to less than zero
Message-Id: <20201028114410.108759-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, "J . Bruce Fields" <bfields@fieldses.org>, Chuck Lever <chuck.lever@oracle.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Artur Molchanov <arturmolchanov@gmail.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check for *lenp < 0 is always true since the type is a size_t
and can never be negative. Fix this by casting it to ssize_t.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: c09f56b8f68d ("net/sunrpc: Fix return value for sysctl sunrpc.transports")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/sunrpc/sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sunrpc/sysctl.c b/net/sunrpc/sysctl.c
index a18b36b5422d..bb62badef6bc 100644
--- a/net/sunrpc/sysctl.c
+++ b/net/sunrpc/sysctl.c
@@ -72,7 +72,7 @@ static int proc_do_xprt(struct ctl_table *table, int write,
 	len = svc_print_xprts(tmpbuf, sizeof(tmpbuf));
 	*lenp = memory_read_from_buffer(buffer, *lenp, ppos, tmpbuf, len);
 
-	if (*lenp < 0) {
+	if ((ssize_t)*lenp < 0) {
 		*lenp = 0;
 		return -EINVAL;
 	}
-- 
2.27.0
