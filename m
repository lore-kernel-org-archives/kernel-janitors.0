From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Apr 2013 06:22:15 +0000
Subject: [patch] appletalk: info leak in ->getname()
Message-Id: <20130423062215.GA15893@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a one byte hole between ->sat_port and ->sat_addr.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/appletalk/ddp.c b/net/appletalk/ddp.c
index 4a141e3..ef12839 100644
--- a/net/appletalk/ddp.c
+++ b/net/appletalk/ddp.c
@@ -1253,7 +1253,7 @@ static int atalk_getname(struct socket *sock, struct sockaddr *uaddr,
 			goto out;
 
 	*uaddr_len = sizeof(struct sockaddr_at);
-	memset(&sat.sat_zero, 0, sizeof(sat.sat_zero));
+	memset(&sat, 0, sizeof(sat));
 
 	if (peer) {
 		err = -ENOTCONN;
