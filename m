From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 09 Aug 2017 08:04:46 +0000
Subject: [PATCH 4/4] ALSA: emux: Delete two error messages for a failed memory allocation in snd_emux_create_
Message-Id: <ed0f8f37-928a-9996-5105-3b5794710954@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <412aa3a5-c8b6-c1fe-febb-0d62927dacc2@users.sourceforge.net>
In-Reply-To: <412aa3a5-c8b6-c1fe-febb-0d62927dacc2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Kees Cook <keescook@chromium.org>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 9 Aug 2017 09:30:34 +0200

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/synth/emux/emux_seq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/synth/emux/emux_seq.c b/sound/synth/emux/emux_seq.c
index fd6cbd439511..396c406d0f77 100644
--- a/sound/synth/emux/emux_seq.c
+++ b/sound/synth/emux/emux_seq.c
@@ -145,14 +145,12 @@ snd_emux_create_port(struct snd_emux *emu, char *name,
 
 	/* Allocate structures for this channel */
 	p = kzalloc(sizeof(*p), GFP_KERNEL);
-	if (!p) {
-		snd_printk(KERN_ERR "no memory\n");
+	if (!p)
 		return NULL;
-	}
+
 	p->chset.channels = kcalloc(max_channels, sizeof(*p->chset.channels),
 				    GFP_KERNEL);
 	if (!p->chset.channels) {
-		snd_printk(KERN_ERR "no memory\n");
 		kfree(p);
 		return NULL;
 	}
-- 
2.13.4

