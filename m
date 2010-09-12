From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 12 Sep 2010 18:56:35 +0000
Subject: [PATCH] staging: comedi: fix signess bug
Message-Id: <1284317799-4804-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Jason Wong <tsanghan@gmail.com>, Arun Thomas <arun.thomas@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Javier Martinez Canillas <martinez.javier@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Julia Lawall <julia@diku.dk>, Jiri Kosina <jkosina@suse.cz>, Morgan Gatti <morgan.gatti@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

ai_count and ao_counter are unsigned, check for < 0 doesn't make sense.
Cast them to int.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/staging/comedi/drivers/cb_pcidas64.c |    2 +-
 drivers/staging/comedi/drivers/usbdux.c      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/comedi/drivers/cb_pcidas64.c b/drivers/staging/comedi/drivers/cb_pcidas64.c
index 9b1dd3c..2583e16 100644
--- a/drivers/staging/comedi/drivers/cb_pcidas64.c
+++ b/drivers/staging/comedi/drivers/cb_pcidas64.c
@@ -3078,7 +3078,7 @@ static void handle_ai_interrupt(struct comedi_device *dev,
 			spin_unlock_irqrestore(&dev->spinlock, flags);
 	}
 	/*  if we are have all the data, then quit */
-	if ((cmd->stop_src = TRIG_COUNT && priv(dev)->ai_count <= 0) ||
+	if ((cmd->stop_src = TRIG_COUNT && (int)priv(dev)->ai_count <= 0) ||
 	    (cmd->stop_src = TRIG_EXT && (status & ADC_STOP_BIT))) {
 		async->events |= COMEDI_CB_EOA;
 	}
diff --git a/drivers/staging/comedi/drivers/usbdux.c b/drivers/staging/comedi/drivers/usbdux.c
index 4b320b1..6131e2d 100644
--- a/drivers/staging/comedi/drivers/usbdux.c
+++ b/drivers/staging/comedi/drivers/usbdux.c
@@ -649,7 +649,7 @@ static void usbduxsub_ao_IsocIrq(struct urb *urb)
 
 	/* normal operation: executing a command in this subdevice */
 	this_usbduxsub->ao_counter--;
-	if (this_usbduxsub->ao_counter <= 0) {
+	if ((int)this_usbduxsub->ao_counter <= 0) {
 		/* timer zero */
 		this_usbduxsub->ao_counter = this_usbduxsub->ao_timer;
 
-- 
1.7.0.4

