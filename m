From: Dan Carpenter <error27@gmail.com>
Date: Mon, 26 Apr 2010 19:25:20 +0000
Subject: [patch] gpio: potential null dereference
Message-Id: <20100426192520.GU29093@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jani Nikula <ext-jani.1.nikula@nokia.com>, David Brownell <dbrownell@users.sourceforge.net>, Daniel =?iso-8859-1?Q?Gl=F6ckner?= <dg@emlix.com>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch found a potential null dereference in gpio_setup_irq().  The 
"pdesc" variable is allocated with idr_find() that can return NULL.  If
gpio_setup_irq() is called with 0 as gpio_flags and "pdesc" is null, it
would OOPs here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 76be229..eb0c3fe 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -416,7 +416,8 @@ static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
 	return 0;
 
 free_sd:
-	sysfs_put(pdesc->value_sd);
+	if (pdesc)
+		sysfs_put(pdesc->value_sd);
 free_id:
 	idr_remove(&pdesc_idr, id);
 	desc->flags &= GPIO_FLAGS_MASK;
