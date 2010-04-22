From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Apr 2010 09:40:53 +0000
Subject: [patch] nouveau: off by one in nv50_gpio_location()
Message-Id: <20100422094053.GL29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>

If "gpio->line" is 32 then "nv50_gpio_reg[gpio->line >> 3]" reads past the
end of the array.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/nouveau/nv50_gpio.c b/drivers/gpu/drm/nouveau/nv50_gpio.c
index c61782b..bb47ad7 100644
--- a/drivers/gpu/drm/nouveau/nv50_gpio.c
+++ b/drivers/gpu/drm/nouveau/nv50_gpio.c
@@ -31,7 +31,7 @@ nv50_gpio_location(struct dcb_gpio_entry *gpio, uint32_t *reg, uint32_t *shift)
 {
 	const uint32_t nv50_gpio_reg[4] = { 0xe104, 0xe108, 0xe280, 0xe284 };
 
-	if (gpio->line > 32)
+	if (gpio->line >= 32)
 		return -EINVAL;
 
 	*reg = nv50_gpio_reg[gpio->line >> 3];
