From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:28:31 +0000
Subject: [PATCH 38/42] drivers/net: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052228120.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <florian@openwrt.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Outdent the code following the if.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/cpmac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/cpmac.c b/drivers/net/cpmac.c
index e1f6156..ac3985c 100644
--- a/drivers/net/cpmac.c
+++ b/drivers/net/cpmac.c
@@ -506,7 +506,7 @@ static int cpmac_poll(struct napi_struct *napi, int budget)
 					"restart rx from a descriptor that's "
 					"not free: %p\n",
 					priv->dev->name, restart);
-				goto fatal_error;
+			goto fatal_error;
 		}
 
 		cpmac_write(priv->regs, CPMAC_RX_PTR(0), restart->mapping);
