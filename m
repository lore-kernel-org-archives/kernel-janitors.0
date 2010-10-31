From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 31 Oct 2010 17:10:32 +0000
Subject: [PATCH 3/3] net: tipc: fix information leak to userland
Message-Id: <1288545032-16481-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Jon Maloy <jon.maloy@ericsson.com>, Allan Stephens <allan.stephens@windriver.com>, "David S. Miller" <davem@davemloft.net>, tipc-discussion@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Structure sockaddr_tipc is copied to userland with padding bytes after
"id" field in union field "name" unitialized.  It leads to leaking of
contents of kernel stack memory.  We have to initialize them to zero.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 net/tipc/socket.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/net/tipc/socket.c b/net/tipc/socket.c
index 33217fc..e9f0d50 100644
--- a/net/tipc/socket.c
+++ b/net/tipc/socket.c
@@ -396,6 +396,7 @@ static int get_name(struct socket *sock, struct sockaddr *uaddr,
 	struct sockaddr_tipc *addr = (struct sockaddr_tipc *)uaddr;
 	struct tipc_sock *tsock = tipc_sk(sock->sk);
 
+	memset(addr, 0, sizeof(*addr));
 	if (peer) {
 		if ((sock->state != SS_CONNECTED) &&
 			((peer != 2) || (sock->state != SS_DISCONNECTING)))
-- 
1.7.0.4

