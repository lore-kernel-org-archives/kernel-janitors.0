From: Dan Carpenter <error27@gmail.com>
Date: Fri, 19 Mar 2010 11:48:25 +0000
Subject: [patch] em28xx: "Empia Em28xx Audio" too long
Message-Id: <20100319114825.GO5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Douglas Schilling Landgraf <dougsland@redhat.com>, Robert Krakora <rob.krakora@messagenetsystems.com>, Nicola Soranzo <nsoranzo@tiscali.it>, Devin Heitmueller <dheitmueller@kernellabs.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

card->driver is 15 characters and a NULL.  The original code
goes past the end of the array.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/em28xx/em28xx-audio.c b/drivers/media/video/em28xx/em28xx-audio.c
index bd78338..530df0a 100644
--- a/drivers/media/video/em28xx/em28xx-audio.c
+++ b/drivers/media/video/em28xx/em28xx-audio.c
@@ -491,7 +491,7 @@ static int em28xx_audio_init(struct em28xx *dev)
 	strcpy(pcm->name, "Empia 28xx Capture");
 
 	snd_card_set_dev(card, &dev->udev->dev);
-	strcpy(card->driver, "Empia Em28xx Audio");
+	strcpy(card->driver, "Em28xx Audio");
 	strcpy(card->shortname, "Em28xx Audio");
 	strcpy(card->longname, "Empia Em28xx Audio");
 
