From: Tomas Melin <tomas.melin@iki.fi>
Date: Sat, 28 Apr 2012 15:50:46 +0000
Subject: [PATCH] Staging: Comedi adv_pci1710 : Corrected over 80 column warnings
Message-Id: <1335628246-3003-1-git-send-email-tomas.melin@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Various comments and code lines longer than 80 chars fixed in file adv_pci1710.c.

Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
---
 drivers/staging/comedi/drivers/adv_pci1710.c |   33 ++++++++++++++-----------
 1 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index 8318c82..b5ef21d 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -676,7 +676,9 @@ static void interrupt_pci1710_every_sample(void *d)
 			     s->async->buf_int_count, s->async->buf_int_ptr,
 			     s->async->buf_user_count, s->async->buf_user_ptr);
 			DPRINTK("adv_pci1710 EDBG: EOS2\n");
-			if ((!devpriv->neverending_ai) && (devpriv->ai_act_scan >= devpriv->ai_scans)) {	/*  all data sampled */
+			if ((!devpriv->neverending_ai) &&
+			    (devpriv->ai_act_scan >= devpriv->ai_scans)) {
+				/*  all data sampled */
 				pci171x_ai_cancel(dev, s);
 				s->async->events |= COMEDI_CB_EOA;
 				comedi_event(dev, s);
@@ -804,8 +806,8 @@ static irqreturn_t interrupt_service_pci1710(int irq, void *d)
 		irq);
 	if (!dev->attached)	/*  is device attached? */
 		return IRQ_NONE;	/*  no, exit */
-
-	if (!(inw(dev->iobase + PCI171x_STATUS) & Status_IRQ))	/*  is this interrupt from our board? */
+	/*  is this interrupt from our board? */
+	if (!(inw(dev->iobase + PCI171x_STATUS) & Status_IRQ))
 		return IRQ_NONE;	/*  no, exit */
 
 	DPRINTK("adv_pci1710 EDBG: interrupt_service_pci1710() ST: %4x\n",
@@ -814,7 +816,7 @@ static irqreturn_t interrupt_service_pci1710(int irq, void *d)
 	if (devpriv->ai_et) {	/*  Switch from initial TRIG_EXT to TRIG_xxx. */
 		devpriv->ai_et = 0;
 		devpriv->CntrlReg &= Control_CNT0;
-		devpriv->CntrlReg |= Control_SW;	/*  set software trigger */
+		devpriv->CntrlReg |= Control_SW; /* set software trigger */
 		outw(devpriv->CntrlReg, dev->iobase + PCI171x_CONTROL);
 		devpriv->CntrlReg = devpriv->ai_et_CntrlReg;
 		outb(0, dev->iobase + PCI171x_CLRFIFO);
@@ -865,7 +867,8 @@ static int pci171x_ai_docmd_and_mode(int mode, struct comedi_device *dev,
 	devpriv->neverending_ai = 0;
 
 	devpriv->CntrlReg &= Control_CNT0;
-	if ((devpriv->ai_flags & TRIG_WAKE_EOS)) {	/*  don't we want wake up every scan?            devpriv->ai_eos=1; */
+	/*  don't we want wake up every scan?  devpriv->ai_eos=1; */
+	if ((devpriv->ai_flags & TRIG_WAKE_EOS)) {
 		devpriv->ai_eos = 1;
 	} else {
 		devpriv->CntrlReg |= Control_ONEFH;
@@ -982,13 +985,13 @@ static int pci171x_ai_cmdtest(struct comedi_device *dev,
 #ifdef PCI171X_EXTDEBUG
 		pci171x_cmdtest_out(1, cmd);
 #endif
-		DPRINTK
-		    ("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=1\n",
-		     err);
+		DPRINTK(
+		"adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=1\n",
+		err);
 		return 1;
 	}
 
-	/* step 2: make sure trigger sources are unique and mutually compatible */
+	/* step2: make sure trigger srcs are unique and mutually compatible */
 
 	if (cmd->start_src != TRIG_NOW && cmd->start_src != TRIG_EXT) {
 		cmd->start_src = TRIG_NOW;
@@ -1015,9 +1018,9 @@ static int pci171x_ai_cmdtest(struct comedi_device *dev,
 #ifdef PCI171X_EXTDEBUG
 		pci171x_cmdtest_out(2, cmd);
 #endif
-		DPRINTK
-		    ("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=2\n",
-		     err);
+		DPRINTK(
+		"adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=2\n",
+		err);
 		return 2;
 	}
 
@@ -1065,9 +1068,9 @@ static int pci171x_ai_cmdtest(struct comedi_device *dev,
 #ifdef PCI171X_EXTDEBUG
 		pci171x_cmdtest_out(3, cmd);
 #endif
-		DPRINTK
-		    ("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=3\n",
-		     err);
+		DPRINTK(
+		"adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=3\n",
+		err);
 		return 3;
 	}
 
-- 
1.7.5.4

