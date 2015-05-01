From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Date: Fri, 01 May 2015 13:58:19 +0000
Subject: [PATCH] cris: arch-v32: gpio: Use kzalloc instead of kmalloc/memset
Message-Id: <1430488699-10878-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: starvik@axis.com, jesper.nilsson@axis.com
Cc: linux-cris-kernel@axis.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe Jaillet <christophe.jaillet@wanadoo.fr>

Turn a kmalloc/memset into an equivalent kzalloc.
Doing so also move the zero'ing of the memory outside of a mutex.

Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
---
 arch/cris/arch-v32/drivers/mach-fs/gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/mach-fs/gpio.c b/arch/cris/arch-v32/drivers/mach-fs/gpio.c
index 009f4ee..72968fb 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/gpio.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/gpio.c
@@ -425,12 +425,11 @@ gpio_open(struct inode *inode, struct file *filp)
 	if (p > GPIO_MINOR_LAST)
 		return -EINVAL;
 
-	priv = kmalloc(sizeof(struct gpio_private), GFP_KERNEL);
+	priv = kzalloc(sizeof(struct gpio_private), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	mutex_lock(&gpio_mutex);
-	memset(priv, 0, sizeof(*priv));
 
 	priv->minor = p;
 
-- 
2.1.0

