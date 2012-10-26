From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 26 Oct 2012 06:59:43 +0000
Subject: [patch] gpiolib: unlock on error in gpio_export()
Message-Id: <20121026065942.GB9284@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>, Ryan Mallon <rmallon@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to unlock here before returning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d5f9742..14251c3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -728,7 +728,8 @@ int gpio_export(unsigned gpio, bool direction_may_change)
 				__func__, gpio,
 				test_bit(FLAG_REQUESTED, &desc->flags),
 				test_bit(FLAG_EXPORT, &desc->flags));
-		return -EPERM;
+		status = -EPERM;
+		goto fail_unlock;
 	}
 
 	if (!desc->chip->direction_input || !desc->chip->direction_output)
