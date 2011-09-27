From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Sep 2011 07:44:07 +0000
Subject: [patch] ALSA: usb-audio - NULL dereference on probe error
Message-Id: <20110927074407.GA9346@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Oliver Neukum <oneukum@suse.de>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Thomas Pfaff <tpfaff@gmx.net>, Clemens Ladisch <clemens@ladisch.de>, alsa-devel@alsa-project.org, Daniel Mack <zonque@gmail.com>

There was a potential NULL dereference introduced in 362e4e49abe
"ALSA: usb-audio - clear chip->probing on error exit"

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/usb/card.c b/sound/usb/card.c
index cc08588..8db260f 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -532,7 +532,8 @@ snd_usb_audio_probe(struct usb_device *dev,
  __error:
 	if (chip && !chip->num_interfaces)
 		snd_card_free(chip->card);
-	chip->probing = 0;
+	if (chip)
+		chip->probing = 0;
 	mutex_unlock(&register_mutex);
  __err_val:
 	return NULL;
