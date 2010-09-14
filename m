From: matt mooney <mfm@muteddisk.com>
Date: Tue, 14 Sep 2010 05:30:16 +0000
Subject: [PATCH 3/4] arm: remove cast from void*
Message-Id: <1284442216-11710-1-git-send-email-mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Unnecessary cast from void* in assignment.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 arch/arm/mach-omap2/mailbox.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/mailbox.c b/arch/arm/mach-omap2/mailbox.c
index 42dbfa4..40ddeca 100644
--- a/arch/arm/mach-omap2/mailbox.c
+++ b/arch/arm/mach-omap2/mailbox.c
@@ -181,7 +181,7 @@ static int omap2_mbox_fifo_full(struct omap_mbox *mbox)
 static void omap2_mbox_enable_irq(struct omap_mbox *mbox,
 		omap_mbox_type_t irq)
 {
-	struct omap_mbox2_priv *p = (struct omap_mbox2_priv *)mbox->priv;
+	struct omap_mbox2_priv *p = mbox->priv;
 	u32 l, bit = (irq = IRQ_TX) ? p->notfull_bit : p->newmsg_bit;
 
 	l = mbox_read_reg(p->irqenable);
@@ -192,7 +192,7 @@ static void omap2_mbox_enable_irq(struct omap_mbox *mbox,
 static void omap2_mbox_disable_irq(struct omap_mbox *mbox,
 		omap_mbox_type_t irq)
 {
-	struct omap_mbox2_priv *p = (struct omap_mbox2_priv *)mbox->priv;
+	struct omap_mbox2_priv *p = mbox->priv;
 	u32 l, bit = (irq = IRQ_TX) ? p->notfull_bit : p->newmsg_bit;
 	l = mbox_read_reg(p->irqdisable);
 	l &= ~bit;
@@ -202,7 +202,7 @@ static void omap2_mbox_disable_irq(struct omap_mbox *mbox,
 static void omap2_mbox_ack_irq(struct omap_mbox *mbox,
 		omap_mbox_type_t irq)
 {
-	struct omap_mbox2_priv *p = (struct omap_mbox2_priv *)mbox->priv;
+	struct omap_mbox2_priv *p = mbox->priv;
 	u32 bit = (irq = IRQ_TX) ? p->notfull_bit : p->newmsg_bit;
 
 	mbox_write_reg(bit, p->irqstatus);
@@ -214,7 +214,7 @@ static void omap2_mbox_ack_irq(struct omap_mbox *mbox,
 static int omap2_mbox_is_irq(struct omap_mbox *mbox,
 		omap_mbox_type_t irq)
 {
-	struct omap_mbox2_priv *p = (struct omap_mbox2_priv *)mbox->priv;
+	struct omap_mbox2_priv *p = mbox->priv;
 	u32 bit = (irq = IRQ_TX) ? p->notfull_bit : p->newmsg_bit;
 	u32 enable = mbox_read_reg(p->irqenable);
 	u32 status = mbox_read_reg(p->irqstatus);
-- 
1.7.2.1

