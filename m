From: Julia Lawall <julia@diku.dk>
Date: Wed, 18 Nov 2009 18:24:30 +0000
Subject: [PATCH 12/16] drivers/net/wan: remove exceptional & on function name
Message-Id: <Pine.LNX.4.64.0911181924140.20943@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois Romieu <romieu@fr.zoreil.com>, netdev@vger.kernel.org, arnd@arndb.de, joe@perches.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In this file, function names are otherwise used as pointers without &.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier f;
@@

f(...) { ... }

@@
identifier r.f;
@@

- &f
+ f
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/wan/dscc4.c             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wan/dscc4.c b/drivers/net/wan/dscc4.c
index 07d00b4..8a3513a 100644
--- a/drivers/net/wan/dscc4.c
+++ b/drivers/net/wan/dscc4.c
@@ -1128,7 +1128,7 @@ done:
         init_timer(&dpriv->timer);
         dpriv->timer.expires = jiffies + 10*HZ;
         dpriv->timer.data = (unsigned long)dev;
-        dpriv->timer.function = &dscc4_timer;
+	dpriv->timer.function = dscc4_timer;
         add_timer(&dpriv->timer);
 	netif_carrier_on(dev);
 
