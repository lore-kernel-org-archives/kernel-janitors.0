From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 10 Mar 2012 08:58:18 +0000
Subject: [patch] [media] gpio-ir-recv: a couple signedness bugs
Message-Id: <20120310085818.GC4647@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>, Ravi Kumar V <kumarrav@codeaurora.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

There are couple places where we check unsigned values for negative.  I
changed ->gpin_nr to signed because in gpio_ir_recv_probe() we do:
        if (pdata->gpio_nr < 0)
                return -EINVAL;
I also change gval to a signed int in gpio_ir_recv_irq() because that's
the type that gpio_get_value_cansleep() returns and we test for negative
returns.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index 6744479..0d87545 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -26,14 +26,14 @@
 
 struct gpio_rc_dev {
 	struct rc_dev *rcdev;
-	unsigned int gpio_nr;
+	int gpio_nr;
 	bool active_low;
 };
 
 static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
 {
 	struct gpio_rc_dev *gpio_dev = dev_id;
-	unsigned int gval;
+	int gval;
 	int rc = 0;
 	enum raw_event_type type = IR_SPACE;
 
diff --git a/include/media/gpio-ir-recv.h b/include/media/gpio-ir-recv.h
index 61a7fbb..67797bf 100644
--- a/include/media/gpio-ir-recv.h
+++ b/include/media/gpio-ir-recv.h
@@ -14,7 +14,7 @@
 #define __GPIO_IR_RECV_H__
 
 struct gpio_ir_recv_platform_data {
-	unsigned int gpio_nr;
+	int gpio_nr;
 	bool active_low;
 };
 
