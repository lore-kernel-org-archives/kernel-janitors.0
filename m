From: Dan Carpenter <error27@gmail.com>
Date: Sun, 28 Mar 2010 11:28:08 +0000
Subject: [patch] mfd: off by one issue
Message-Id: <20100328112808.GO5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Paul Fertser <fercerpav@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Arnaud Patard <arnaud.patard@rtp-net.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"pcf->irq_handler" has PCF50633_NUM_IRQ elements.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mfd/pcf50633-core.c b/drivers/mfd/pcf50633-core.c
index 03dcc92..4f13608 100644
--- a/drivers/mfd/pcf50633-core.c
+++ b/drivers/mfd/pcf50633-core.c
@@ -217,7 +217,7 @@ static struct attribute_group pcf_attr_group = {
 int pcf50633_register_irq(struct pcf50633 *pcf, int irq,
 			void (*handler) (int, void *), void *data)
 {
-	if (irq < 0 || irq > PCF50633_NUM_IRQ || !handler)
+	if (irq < 0 || irq >= PCF50633_NUM_IRQ || !handler)
 		return -EINVAL;
 
 	if (WARN_ON(pcf->irq_handler[irq].handler))
@@ -234,7 +234,7 @@ EXPORT_SYMBOL_GPL(pcf50633_register_irq);
 
 int pcf50633_free_irq(struct pcf50633 *pcf, int irq)
 {
-	if (irq < 0 || irq > PCF50633_NUM_IRQ)
+	if (irq < 0 || irq >= PCF50633_NUM_IRQ)
 		return -EINVAL;
 
 	mutex_lock(&pcf->lock);
