From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 16:02:15 +0000
Subject: [PATCH] ALSA: usx2y: Delete an error message for a failed memory allocation in two functions
Message-Id: <5ca1485e-5aaf-3c42-a24e-fb834239182e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 17:40:57 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/usb/usx2y/usbusx2yaudio.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index dd40ca9d858a..612aa7ff7e18 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -422,7 +422,5 @@ static int usX2Y_urbs_allocate(struct snd_usX2Y_substream *subs)
-		if (NULL = subs->tmpbuf) {
-			snd_printk(KERN_ERR "cannot malloc tmpbuf\n");
+		if (!subs->tmpbuf)
 			return -ENOMEM;
-		}
 	}
 	/* allocate and initialize data urbs */
 	for (i = 0; i < NRURBS; i++) {
@@ -952,7 +950,6 @@ static int usX2Y_audio_stream_new(struct snd_card *card, int playback_endpoint,
-		if (NULL = usX2Y_substream[i]) {
-			snd_printk(KERN_ERR "cannot malloc\n");
+		if (!usX2Y_substream[i])
 			return -ENOMEM;
-		}
+
 		usX2Y_substream[i]->usX2Y = usX2Y(card);
 	}
 
-- 
2.14.0

