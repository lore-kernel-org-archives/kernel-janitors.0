From: Colin King <colin.king@canonical.com>
Date: Tue, 20 Oct 2020 15:42:03 +0000
Subject: [PATCH] can: isotp: make const array static, makes object smaller
Message-Id: <20201020154203.54711-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Hartkopp <socketcan@hartkopp.net>, Marc Kleine-Budde <mkl@pengutronix.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-can@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array plen on the stack but instead it
static. Makes the object code smaller by 926 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  26531	   1943	     64	  28538	   6f7a	net/can/isotp.o

After:
   text	   data	    bss	    dec	    hex	filename
  25509	   2039	     64	  27612	   6bdc	net/can/isotp.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/can/isotp.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/net/can/isotp.c b/net/can/isotp.c
index 4c2062875893..3fd714f81875 100644
--- a/net/can/isotp.c
+++ b/net/can/isotp.c
@@ -252,14 +252,16 @@ static void isotp_rcv_skb(struct sk_buff *skb, struct sock *sk)
 
 static u8 padlen(u8 datalen)
 {
-	const u8 plen[] = {8, 8, 8, 8, 8, 8, 8, 8, 8,		/* 0 - 8 */
-			   12, 12, 12, 12,			/* 9 - 12 */
-			   16, 16, 16, 16,			/* 13 - 16 */
-			   20, 20, 20, 20,			/* 17 - 20 */
-			   24, 24, 24, 24,			/* 21 - 24 */
-			   32, 32, 32, 32, 32, 32, 32, 32,	/* 25 - 32 */
-			   48, 48, 48, 48, 48, 48, 48, 48,	/* 33 - 40 */
-			   48, 48, 48, 48, 48, 48, 48, 48};	/* 41 - 48 */
+	static const u8 plen[] = {
+		8, 8, 8, 8, 8, 8, 8, 8, 8,	/* 0 - 8 */
+		12, 12, 12, 12,			/* 9 - 12 */
+		16, 16, 16, 16,			/* 13 - 16 */
+		20, 20, 20, 20,			/* 17 - 20 */
+		24, 24, 24, 24,			/* 21 - 24 */
+		32, 32, 32, 32, 32, 32, 32, 32,	/* 25 - 32 */
+		48, 48, 48, 48, 48, 48, 48, 48,	/* 33 - 40 */
+		48, 48, 48, 48, 48, 48, 48, 48	/* 41 - 48 */
+	};
 
 	if (datalen > 48)
 		return 64;
-- 
2.27.0
