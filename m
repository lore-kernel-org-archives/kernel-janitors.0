From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 17:04:41 +0000
Subject: [PATCH] ALSA: usb: Delete an error message for a failed memory allocation in two functions
Message-Id: <cb279f5a-1994-ae47-7e8f-8aae793d16d2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Akshay Bhat <akshay.bhat@timesys.com>, Daniel Mack <daniel@zonque.org>, Dennis Kadioglu <denk@post.com>, Jaroslav Kysela <perex@perex.cz>, Johan Hovold <johan@kernel.org>, Nobutaka Okabe <nob77413@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 18:38:25 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/usb/quirks.c | 5 ++---
 sound/usb/stream.c | 4 +---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d7b0b0a3a2db..9db40d58b4e2 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -146,10 +146,9 @@ static int create_fixed_stream_quirk(struct snd_usb_audio *chip,
 	unsigned *rate_table = NULL;
 
 	fp = kmemdup(quirk->data, sizeof(*fp), GFP_KERNEL);
-	if (!fp) {
-		usb_audio_err(chip, "cannot memdup\n");
+	if (!fp)
 		return -ENOMEM;
-	}
+
 	INIT_LIST_HEAD(&fp->list);
 	if (fp->nr_rates > MAX_NR_RATES) {
 		kfree(fp);
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 8e9548bc1f1a..d1776e5517ff 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -658,10 +658,8 @@ int snd_usb_parse_audio_interface(struct snd_usb_audio *chip, int iface_no)
 			continue;
 
 		fp = kzalloc(sizeof(*fp), GFP_KERNEL);
-		if (! fp) {
-			dev_err(&dev->dev, "cannot malloc\n");
+		if (!fp)
 			return -ENOMEM;
-		}
 
 		fp->iface = iface_no;
 		fp->altsetting = altno;
-- 
2.14.0

