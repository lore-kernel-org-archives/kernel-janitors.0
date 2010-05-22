From: Dan Carpenter <error27@gmail.com>
Date: Sat, 22 May 2010 20:43:42 +0000
Subject: [patch] caif: remove unneeded null check in caif_connect()
Message-Id: <20100522204342.GV22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sjur Braendeland <sjur.brandeland@stericsson.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We already dereferenced uaddr towards the start of the function when we
checked that "uaddr->sa_family != AF_CAIF".  Both the check here and the
earlier check were added in bece7b2398d0: "caif: Rewritten socket
implementation".  Before that patch, we assumed that we recieved a valid
pointer for uaddr, and based on that, I have removed this check.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/caif/caif_socket.c b/net/caif/caif_socket.c
index c3a70c5..bd67bb3 100644
--- a/net/caif/caif_socket.c
+++ b/net/caif/caif_socket.c
@@ -890,8 +890,7 @@ static int caif_connect(struct socket *sock, struct sockaddr *uaddr,
 	sk_stream_kill_queues(&cf_sk->sk);
 
 	err = -EINVAL;
-	if (addr_len != sizeof(struct sockaddr_caif) ||
-		!uaddr)
+	if (addr_len != sizeof(struct sockaddr_caif))
 		goto out;
 
 	memcpy(&cf_sk->conn_req.sockaddr, uaddr,
