From: Julia Lawall <julia@diku.dk>
Date: Wed, 18 Nov 2009 18:23:34 +0000
Subject: [PATCH 9/16] drivers/net/typhoon.c: remove exceptional & on function
Message-Id: <Pine.LNX.4.64.0911181923180.20943@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Dillow <dave@thedillows.org>, netdev@vger.kernel.org, arnd@arndb.de, joe@perches.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/net/typhoon.c               |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/typhoon.c b/drivers/net/typhoon.c
index 5921f5b..079a970 100644
--- a/drivers/net/typhoon.c
+++ b/drivers/net/typhoon.c
@@ -2151,7 +2151,7 @@ typhoon_open(struct net_device *dev)
 		goto out_sleep;
 	}
 
-	err = request_irq(dev->irq, &typhoon_interrupt, IRQF_SHARED,
+	err = request_irq(dev->irq, typhoon_interrupt, IRQF_SHARED,
 				dev->name, dev);
 	if(err < 0)
 		goto out_sleep;
