From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Mar 2012 19:36:26 +0000
Subject: [PATCH 6/7] drivers/input/touchscreen/hp680_ts_input.c: ensure arguments to request_irq and free_irq
Message-Id: <1331494587-12196-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331494587-12196-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1331494587-12196-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Change 0 to NULL in the last argument of request_irq, since the argument
should have pointer type and so that the last argument of request_irq
syntactically matches the second argument of the later call to free_irq.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/input/touchscreen/hp680_ts_input.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/hp680_ts_input.c b/drivers/input/touchscreen/hp680_ts_input.c
index 639a604..85cf9be 100644
--- a/drivers/input/touchscreen/hp680_ts_input.c
+++ b/drivers/input/touchscreen/hp680_ts_input.c
@@ -93,7 +93,7 @@ static int __init hp680_ts_init(void)
 	hp680_ts_dev->phys = "hp680_ts/input0";
 
 	if (request_irq(HP680_TS_IRQ, hp680_ts_interrupt,
-			0, MODNAME, 0) < 0) {
+			0, MODNAME, NULL) < 0) {
 		printk(KERN_ERR "hp680_touchscreen.c: Can't allocate irq %d\n",
 		       HP680_TS_IRQ);
 		err = -EBUSY;

