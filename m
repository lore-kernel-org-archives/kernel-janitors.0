From: Julia Lawall <julia@diku.dk>
Date: Sat, 02 Aug 2008 15:15:05 +0000
Subject: [PATCH 7/10] drivers/net/wan: Use DIV_ROUND_UP
Message-Id: <Pine.LNX.4.64.0808021714220.20095@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jgarzik@pobox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The kernel.h macro DIV_ROUND_UP performs the computation (((n) + (d) - 1) /
(d)) but is perhaps more readable.

An extract of the semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@haskernel@
@@

#include <linux/kernel.h>

@depends on haskernel@
expression n,d;
@@

(
- (n + d - 1) / d
+ DIV_ROUND_UP(n,d)
|
- (n + (d - 1)) / d
+ DIV_ROUND_UP(n,d)
)

@depends on haskernel@
expression n,d;
@@

- DIV_ROUND_UP((n),d)
+ DIV_ROUND_UP(n,d)

@depends on haskernel@
expression n,d;
@@

- DIV_ROUND_UP(n,(d))
+ DIV_ROUND_UP(n,d)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/wan/sbni.c     |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/net/wan/sbni.c b/drivers/net/wan/sbni.c
--- a/drivers/net/wan/sbni.c
+++ b/drivers/net/wan/sbni.c
@@ -856,7 +856,7 @@ prepare_to_send( struct sk_buff  *skb,  
 		len = SBNI_MIN_LEN;
 
 	nl->tx_buf_p	= skb;
-	nl->tx_frameno	= (len + nl->maxframe - 1) / nl->maxframe;
+	nl->tx_frameno	= DIV_ROUND_UP(len, nl->maxframe);
 	nl->framelen	= len < nl->maxframe  ?  len  :  nl->maxframe;
 
 	outb( inb( dev->base_addr + CSR0 ) | TR_REQ,  dev->base_addr + CSR0 );
