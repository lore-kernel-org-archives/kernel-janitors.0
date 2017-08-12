From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 19:13:49 +0000
Subject: [PATCH 3/3] ALSA: mpu401: Adjust four checks for null pointers
Message-Id: <c64cc0e7-2c9b-c4b7-77bd-daae455852ba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47947226-bd09-5d15-c0d2-a9f4a659e1b4@users.sourceforge.net>
In-Reply-To: <47947226-bd09-5d15-c0d2-a9f4a659e1b4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 20:50:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/drivers/mpu401/mpu401_uart.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/mpu401/mpu401_uart.c b/sound/drivers/mpu401/mpu401_uart.c
index e8bdea193eab..b997222274bd 100644
--- a/sound/drivers/mpu401/mpu401_uart.c
+++ b/sound/drivers/mpu401/mpu401_uart.c
@@ -136,7 +136,7 @@ irqreturn_t snd_mpu401_uart_interrupt(int irq, void *dev_id)
 {
 	struct snd_mpu401 *mpu = dev_id;
 	
-	if (mpu = NULL)
+	if (!mpu)
 		return IRQ_NONE;
 	_snd_mpu401_uart_interrupt(mpu);
 	return IRQ_HANDLED;
@@ -157,7 +157,7 @@ irqreturn_t snd_mpu401_uart_interrupt_tx(int irq, void *dev_id)
 {
 	struct snd_mpu401 *mpu = dev_id;
 	
-	if (mpu = NULL)
+	if (!mpu)
 		return IRQ_NONE;
 	uart_interrupt_tx(mpu);
 	return IRQ_HANDLED;
@@ -544,7 +544,7 @@ int snd_mpu401_uart_new(struct snd_card *card, int device,
 				   out_enable, in_enable, &rmidi)) < 0)
 		return err;
 	mpu = kzalloc(sizeof(*mpu), GFP_KERNEL);
-	if (mpu = NULL) {
+	if (!mpu) {
 		err = -ENOMEM;
 		goto free_device;
 	}
@@ -558,7 +558,7 @@ int snd_mpu401_uart_new(struct snd_card *card, int device,
 	if (! (info_flags & MPU401_INFO_INTEGRATED)) {
 		int res_size = hardware = MPU401_HW_PC98II ? 4 : 2;
 		mpu->res = request_region(port, res_size, "MPU401 UART");
-		if (mpu->res = NULL) {
+		if (!mpu->res) {
 			snd_printk(KERN_ERR "mpu401_uart: "
 				   "unable to grab port 0x%lx size %d\n",
 				   port, res_size);
-- 
2.14.0

