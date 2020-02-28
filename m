From: Colin King <colin.king@canonical.com>
Date: Fri, 28 Feb 2020 23:44:14 +0000
Subject: [PATCH] SUNRPC: remove redundant assignments to variable status
Message-Id: <20200228234414.112359-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J . Bruce Fields" <bfields@fieldses.org>, Chuck Lever <chuck.lever@oracle.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable status is being initialized with a value that is never
read and it is being updated later with a new value.  The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/sunrpc/xprtsock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index d86c664ea6af..c9e039961e29 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -1970,7 +1970,7 @@ static int xs_local_setup_socket(struct sock_xprt *transport)
 	struct rpc_xprt *xprt = &transport->xprt;
 	struct file *filp;
 	struct socket *sock;
-	int status = -EIO;
+	int status;
 
 	status = __sock_create(xprt->xprt_net, AF_LOCAL,
 					SOCK_STREAM, 0, &sock, 1);
-- 
2.25.0
