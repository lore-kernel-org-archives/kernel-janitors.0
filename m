From: Julia Lawall <julia@diku.dk>
Date: Mon, 29 Mar 2010 15:34:28 +0000
Subject: [PATCH 4/12] drivers/gpio: Add missing unlock
Message-Id: <Pine.LNX.4.64.1003291734110.21896@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In an error handling case the lock is not unlocked.  The return is
converted to a goto, to share the unlock at the end of the function.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression E1;
identifier f;
@@

f (...) { <+...
* spin_lock_irqsave (E1,...);
... when != E1
* return ...;
...+> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/gpio/timbgpio.c             |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/timbgpio.c b/drivers/gpio/timbgpio.c
index d4295fa..ae143dd 100644
--- a/drivers/gpio/timbgpio.c
+++ b/drivers/gpio/timbgpio.c
@@ -130,6 +130,7 @@ static int timbgpio_irq_type(unsigned irq, unsigned trigger)
 	unsigned long flags;
 	u32 lvr, flr, bflr = 0;
 	u32 ver;
+	int ret = 0;
 
 	if (offset < 0 || offset > tgpio->gpio.ngpio)
 		return -EINVAL;
@@ -153,8 +154,10 @@ static int timbgpio_irq_type(unsigned irq, unsigned trigger)
 	}
 
 	if ((trigger & IRQ_TYPE_EDGE_BOTH) = IRQ_TYPE_EDGE_BOTH) {
-		if (ver < 3)
-			return -EINVAL;
+		if (ver < 3) {
+			ret = -EINVAL;
+			goto out;
+		}
 		else {
 			flr |= 1 << offset;
 			bflr |= 1 << offset;
@@ -174,8 +177,9 @@ static int timbgpio_irq_type(unsigned irq, unsigned trigger)
 		iowrite32(bflr, tgpio->membase + TGPIO_BFLR);
 
 	iowrite32(1 << offset, tgpio->membase + TGPIO_ICR);
-	spin_unlock_irqrestore(&tgpio->lock, flags);
 
+out:
+	spin_unlock_irqrestore(&tgpio->lock, flags);
 	return 0;
 }
 
