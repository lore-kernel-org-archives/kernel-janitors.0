From: Dan Carpenter <error27@gmail.com>
Date: Tue, 23 Mar 2010 11:40:43 +0000
Subject: [patch v2] em28xx: "Empia Em28xx Audio" too long
Message-Id: <20100323114043.GY21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100319114825.GO5331@bicker>
In-Reply-To: <20100319114825.GO5331@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>, Douglas Schilling Landgraf <dougsland@redhat.com>, Robert Krakora <rob.krakora@messagenetsystems.com>, Nicola Soranzo <nsoranzo@tiscali.it>, Devin Heitmueller <dheitmueller@kernellabs.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Andrew Morton <akpm@linux-foundation.org>

card->driver is 15 characters and a NULL.  The original code
goes past the end of the array.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
V2:  Takashi Iwai asked me to change the space to a hyphen since this is 
used as an identifier in alsa-lib.

diff --git a/drivers/media/video/em28xx/em28xx-audio.c b/drivers/media/video/em28xx/em28xx-audio.c
index bd78338..e182abf 100644
--- a/drivers/media/video/em28xx/em28xx-audio.c
+++ b/drivers/media/video/em28xx/em28xx-audio.c
@@ -491,7 +491,7 @@ static int em28xx_audio_init(struct em28xx *dev)
 	strcpy(pcm->name, "Empia 28xx Capture");
 
 	snd_card_set_dev(card, &dev->udev->dev);
-	strcpy(card->driver, "Empia Em28xx Audio");
+	strcpy(card->driver, "Em28xx-Audio");
 	strcpy(card->shortname, "Em28xx Audio");
 	strcpy(card->longname, "Empia Em28xx Audio");
 
