From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Apr 2013 06:22:51 +0000
Subject: [patch] netrom: info leak in ->getname()
Message-Id: <20130423062251.GB15893@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The sockaddr_ax25 struct has a 3 byte hole between ->sax25_call and
->sax25_ndigis.  I've added a memset to avoid leaking uninitialized
stack data to userspace.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index 103bd70..ec0c80f 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -834,6 +834,8 @@ static int nr_getname(struct socket *sock, struct sockaddr *uaddr,
 	struct sock *sk = sock->sk;
 	struct nr_sock *nr = nr_sk(sk);
 
+	memset(&sax->fsa_ax25, 0, sizeof(struct sockaddr_ax25));
+
 	lock_sock(sk);
 	if (peer != 0) {
 		if (sk->sk_state != TCP_ESTABLISHED) {
