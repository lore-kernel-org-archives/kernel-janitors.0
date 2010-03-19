From: Dan Carpenter <error27@gmail.com>
Date: Fri, 19 Mar 2010 11:49:57 +0000
Subject: [patch] cx231xx: card->driver "Conexant cx231xx Audio" too long
Message-Id: <20100319114957.GQ5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Srinivasa Deevi <srinivasa.deevi@conexant.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

card->driver is 15 characters and a NULL, the original code could 
cause a buffer overflow.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/cx231xx/cx231xx-audio.c b/drivers/media/video/cx231xx/cx231xx-audio.c
index 7793d60..b3282ae 100644
--- a/drivers/media/video/cx231xx/cx231xx-audio.c
+++ b/drivers/media/video/cx231xx/cx231xx-audio.c
@@ -495,7 +495,7 @@ static int cx231xx_audio_init(struct cx231xx *dev)
 	pcm->info_flags = 0;
 	pcm->private_data = dev;
 	strcpy(pcm->name, "Conexant cx231xx Capture");
-	strcpy(card->driver, "Conexant cx231xx Audio");
+	strcpy(card->driver, "Cx231xx Audio");
 	strcpy(card->shortname, "Cx231xx Audio");
 	strcpy(card->longname, "Conexant cx231xx Audio");
 
