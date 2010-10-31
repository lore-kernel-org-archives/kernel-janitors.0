From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 31 Oct 2010 17:10:22 +0000
Subject: [PATCH 1/3] net: ax25: fix information leak to userland
Message-Id: <1288545022-16393-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Sometimes ax25_getname() doesn't initialize all members of fsa_digipeater
field of fsa struct.  This structure is then copied to userland.  It leads to
leaking of contents of kernel stack memory.  We have to initialize them to zero.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 net/ax25/af_ax25.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 26eaebf..a324d83 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1392,6 +1392,7 @@ static int ax25_getname(struct socket *sock, struct sockaddr *uaddr,
 	ax25_cb *ax25;
 	int err = 0;
 
+	memset(&fsa->fsa_digipeater, 0, sizeof(fsa->fsa_digipeater));
 	lock_sock(sk);
 	ax25 = ax25_sk(sk);
 
-- 
1.7.0.4

