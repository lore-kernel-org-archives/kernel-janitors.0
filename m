From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Apr 2013 06:24:14 +0000
Subject: [patch] isdn: mISDN: set ->family in ->getname()
Message-Id: <20130423062414.GC15893@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "maddr->family" variable was not set but instead it leaked stack
information to userspace.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/isdn/mISDN/socket.c b/drivers/isdn/mISDN/socket.c
index 8b07f83..a838864 100644
--- a/drivers/isdn/mISDN/socket.c
+++ b/drivers/isdn/mISDN/socket.c
@@ -578,6 +578,7 @@ data_sock_getname(struct socket *sock, struct sockaddr *addr,
 	lock_sock(sk);
 
 	*addr_len = sizeof(*maddr);
+	maddr->family = AF_ISDN;
 	maddr->dev = _pms(sk)->dev->id;
 	maddr->channel = _pms(sk)->ch.nr;
 	maddr->sapi = _pms(sk)->ch.addr & 0xff;
