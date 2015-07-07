From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 07 Jul 2015 05:55:42 +0000
Subject: [PATCH] cris: arch-v32: gpio: Use kzalloc instead of kmalloc/memset
Message-Id: <1436248542-8345-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: starvik@axis.com, jesper.nilsson@axis.com
Cc: linux-cris-kernel@axis.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Turn a kmalloc/memset into an equivalent kzalloc.
Doing so also move the zero'ing of the memory outside of a mutex.

Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
---
A simililar patch has already been applied against
arch/cris/arch-v32/drivers/mach-fs/gpio.c
---
 arch/cris/arch-v32/drivers/mach-a3/gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/mach-a3/gpio.c b/arch/cris/arch-v32/drivers/mach-a3/gpio.c
index 74f9fe8..75f0264 100644
--- a/arch/cris/arch-v32/drivers/mach-a3/gpio.c
+++ b/arch/cris/arch-v32/drivers/mach-a3/gpio.c
@@ -386,13 +386,12 @@ static int gpio_open(struct inode *inode, struct file *filp)
 	    (p > GPIO_MINOR_LAST && p < GPIO_MINOR_PWM0))
 		return -EINVAL;
 
-	priv = kmalloc(sizeof(struct gpio_private), GFP_KERNEL);
+	priv = kzalloc(sizeof(struct gpio_private), GFP_KERNEL);
 
 	if (!priv)
 		return -ENOMEM;
 
 	mutex_lock(&gpio_mutex);
-	memset(priv, 0, sizeof(*priv));
 
 	priv->minor = p;
 	filp->private_data = priv;
-- 
2.1.4

