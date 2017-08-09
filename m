From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 09 Aug 2017 08:01:55 +0000
Subject: [PATCH 1/4] ALSA: emux: Adjust one function call together with a variable assignment
Message-Id: <697dc142-6d2a-f39f-19bb-54c8eeea454b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <412aa3a5-c8b6-c1fe-febb-0d62927dacc2@users.sourceforge.net>
In-Reply-To: <412aa3a5-c8b6-c1fe-febb-0d62927dacc2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Kees Cook <keescook@chromium.org>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 9 Aug 2017 08:40:14 +0200

The script "checkpatch.pl" pointed information out like the following.

ERROR: do not use assignment in if condition

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/synth/emux/emux_seq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/synth/emux/emux_seq.c b/sound/synth/emux/emux_seq.c
index 55579f6b8cb2..53820f75ba3e 100644
--- a/sound/synth/emux/emux_seq.c
+++ b/sound/synth/emux/emux_seq.c
@@ -144,7 +144,8 @@ snd_emux_create_port(struct snd_emux *emu, char *name,
 	int i, type, cap;
 
 	/* Allocate structures for this channel */
-	if ((p = kzalloc(sizeof(*p), GFP_KERNEL)) = NULL) {
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
+	if (!p) {
 		snd_printk(KERN_ERR "no memory\n");
 		return NULL;
 	}
-- 
2.13.4

