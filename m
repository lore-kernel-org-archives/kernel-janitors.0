From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 13 Nov 2015 16:03:51 +0000
Subject: [PATCH] mfd: constify da903x_chip_ops structure
Message-Id: <1447430631-10455-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Support Opensource <support.opensource@diasemi.com>
Cc: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org

The da903x_chip_ops structure is never modified, so declare it
as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mfd/da903x.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/da903x.c b/drivers/mfd/da903x.c
index 37e4426..f6a0459 100644
--- a/drivers/mfd/da903x.c
+++ b/drivers/mfd/da903x.c
@@ -60,7 +60,7 @@ struct da903x_chip_ops {
 struct da903x_chip {
 	struct i2c_client	*client;
 	struct device		*dev;
-	struct da903x_chip_ops	*ops;
+	const struct da903x_chip_ops *ops;
 
 	int			type;
 	uint32_t		events_mask;
@@ -424,7 +424,7 @@ static irqreturn_t da903x_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static struct da903x_chip_ops da903x_ops[] = {
+static const struct da903x_chip_ops da903x_ops[] = {
 	[0] = {
 		.init_chip	= da9030_init_chip,
 		.unmask_events	= da9030_unmask_events,

