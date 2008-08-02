From: Julia Lawall <julia@diku.dk>
Date: Sat, 02 Aug 2008 15:13:57 +0000
Subject: [PATCH 5/10] drivers/misc: Use DIV_ROUND_UP
Message-Id: <Pine.LNX.4.64.0808021713350.20095@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/misc/sgi-gru/grukservices.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/misc/sgi-gru/grukservices.c b/drivers/misc/sgi-gru/grukservices.c
--- a/drivers/misc/sgi-gru/grukservices.c
+++ b/drivers/misc/sgi-gru/grukservices.c
@@ -466,7 +466,7 @@ int gru_send_message_gpa(unsigned long m
 	STAT(mesq_send);
 	BUG_ON(bytes < sizeof(int) || bytes > 2 * GRU_CACHE_LINE_BYTES);
 
-	clines = (bytes + GRU_CACHE_LINE_BYTES - 1) / GRU_CACHE_LINE_BYTES;
+	clines = DIV_ROUND_UP(bytes, GRU_CACHE_LINE_BYTES);
 	if (gru_get_cpu_resources(bytes, &cb, &dsr))
 		return MQE_BUG_NO_RESOURCES;
 	memcpy(dsr, mesg, bytes);
