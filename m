From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 19:12:39 +0000
Subject: [PATCH 2/3] ALSA: mpu401: Use common error handling code in snd_mpu401_uart_new()
Message-Id: <06592078-5382-5f6a-f9aa-c85f293e1734@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47947226-bd09-5d15-c0d2-a9f4a659e1b4@users.sourceforge.net>
In-Reply-To: <47947226-bd09-5d15-c0d2-a9f4a659e1b4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 20:40:17 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/drivers/mpu401/mpu401_uart.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/drivers/mpu401/mpu401_uart.c b/sound/drivers/mpu401/mpu401_uart.c
index cc347386fc2b..e8bdea193eab 100644
--- a/sound/drivers/mpu401/mpu401_uart.c
+++ b/sound/drivers/mpu401/mpu401_uart.c
@@ -545,8 +545,8 @@ int snd_mpu401_uart_new(struct snd_card *card, int device,
 		return err;
 	mpu = kzalloc(sizeof(*mpu), GFP_KERNEL);
 	if (mpu = NULL) {
-		snd_device_free(card, rmidi);
-		return -ENOMEM;
+		err = -ENOMEM;
+		goto free_device;
 	}
 	rmidi->private_data = mpu;
 	rmidi->private_free = snd_mpu401_uart_free;
@@ -562,8 +562,8 @@ int snd_mpu401_uart_new(struct snd_card *card, int device,
 			snd_printk(KERN_ERR "mpu401_uart: "
 				   "unable to grab port 0x%lx size %d\n",
 				   port, res_size);
-			snd_device_free(card, rmidi);
-			return -EBUSY;
+			err = -EBUSY;
+			goto free_device;
 		}
 	}
 	if (info_flags & MPU401_INFO_MMIO) {
@@ -583,8 +583,8 @@ int snd_mpu401_uart_new(struct snd_card *card, int device,
 				"MPU401 UART", (void *) mpu)) {
 			snd_printk(KERN_ERR "mpu401_uart: "
 				   "unable to grab IRQ %d\n", irq);
-			snd_device_free(card, rmidi);
-			return -EBUSY;
+			err = -EBUSY;
+			goto free_device;
 		}
 	}
 	if (irq < 0 && !(info_flags & MPU401_INFO_IRQ_HOOK))
@@ -612,6 +612,9 @@ int snd_mpu401_uart_new(struct snd_card *card, int device,
 	if (rrawmidi)
 		*rrawmidi = rmidi;
 	return 0;
+free_device:
+	snd_device_free(card, rmidi);
+	return err;
 }
 
 EXPORT_SYMBOL(snd_mpu401_uart_new);
-- 
2.14.0

