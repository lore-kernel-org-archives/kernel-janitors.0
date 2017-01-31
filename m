From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 31 Jan 2017 11:33:31 +0000
Subject: [patch] sound: oss/ad1848: remove some dead code
Message-Id: <20170131113331.GA3434@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Amitoj Kaur Chawla <amitoj1606@gmail.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org

We never use the irq2dev[] array so we can remove this assignment.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/oss/ad1848.c b/sound/oss/ad1848.c
index 6368e5c7d0ba..f6156d8169d0 100644
--- a/sound/oss/ad1848.c
+++ b/sound/oss/ad1848.c
@@ -121,11 +121,6 @@ static bool deskpro_xl;
 static bool deskpro_m;
 static bool soundpro;
 
-static volatile signed char irq2dev[17] = {
-	-1, -1, -1, -1, -1, -1, -1, -1,
-	-1, -1, -1, -1, -1, -1, -1, -1, -1
-};
-
 #ifndef EXCLUDE_TIMERS
 static int timer_installed = -1;
 #endif
@@ -2060,7 +2055,7 @@ int ad1848_init (char *name, struct resource *ports, int irq, int dma_playback,
 		else
 			devc->irq_ok = 1;	/* Couldn't test. assume it's OK */
 	} else if (irq < 0)
-		irq2dev[-irq] = devc->dev_no = my_dev;
+		devc->dev_no = my_dev;
 
 #ifndef EXCLUDE_TIMERS
 	if ((capabilities[devc->model].flags & CAP_F_TIMER) &&
