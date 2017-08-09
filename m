From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 09 Aug 2017 08:03:51 +0000
Subject: [PATCH 3/4] ALSA: emux: Adjust four checks for null pointers
Message-Id: <ef3686fe-4f2d-8cdb-f2ed-0055f0a241c0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <412aa3a5-c8b6-c1fe-febb-0d62927dacc2@users.sourceforge.net>
In-Reply-To: <412aa3a5-c8b6-c1fe-febb-0d62927dacc2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Kees Cook <keescook@chromium.org>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 9 Aug 2017 09:22:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/synth/emux/emux_seq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/synth/emux/emux_seq.c b/sound/synth/emux/emux_seq.c
index 12acf18c5be4..fd6cbd439511 100644
--- a/sound/synth/emux/emux_seq.c
+++ b/sound/synth/emux/emux_seq.c
@@ -99,7 +99,7 @@ snd_emux_init_seq(struct snd_emux *emu, struct snd_card *card, int index)
 		sprintf(tmpname, "%s Port %d", emu->name, i);
 		p = snd_emux_create_port(emu, tmpname, MIDI_CHANNELS,
 					 0, &pinfo);
-		if (p = NULL) {
+		if (!p) {
 			snd_printk(KERN_ERR "can't create port\n");
 			return -ENOMEM;
 		}
@@ -151,7 +151,7 @@ snd_emux_create_port(struct snd_emux *emu, char *name,
 	}
 	p->chset.channels = kcalloc(max_channels, sizeof(*p->chset.channels),
 				    GFP_KERNEL);
-	if (p->chset.channels = NULL) {
+	if (!p->chset.channels) {
 		snd_printk(KERN_ERR "no memory\n");
 		kfree(p);
 		return NULL;
@@ -373,7 +373,7 @@ int snd_emux_init_virmidi(struct snd_emux *emu, struct snd_card *card)
 		return 0;
 
 	emu->vmidi = kcalloc(emu->midi_ports, sizeof(*emu->vmidi), GFP_KERNEL);
-	if (emu->vmidi = NULL)
+	if (!emu->vmidi)
 		return -ENOMEM;
 
 	for (i = 0; i < emu->midi_ports; i++) {
@@ -405,7 +405,7 @@ int snd_emux_delete_virmidi(struct snd_emux *emu)
 {
 	int i;
 
-	if (emu->vmidi = NULL)
+	if (!emu->vmidi)
 		return 0;
 
 	for (i = 0; i < emu->midi_ports; i++) {
-- 
2.13.4

