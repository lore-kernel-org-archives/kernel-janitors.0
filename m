From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 11 Nov 2017 19:23:31 +0000
Subject: [PATCH 3/3] ALSA: sgio2audio: Adjust two null pointer checks in snd_sgio2audio_create()
Message-Id: <249efc55-0688-6772-fc70-526a1bfa2603@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <eb375101-03bd-37bb-67ef-e261eeca206e@users.sourceforge.net>
In-Reply-To: <eb375101-03bd-37bb-67ef-e261eeca206e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 11 Nov 2017 20:10:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/mips/sgio2audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
index 9e175a184b66..4027f0fc8db6 100644
--- a/sound/mips/sgio2audio.c
+++ b/sound/mips/sgio2audio.c
@@ -841,14 +841,14 @@ static int snd_sgio2audio_create(struct snd_card *card,
 		return -ENOENT;
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip = NULL)
+	if (!chip)
 		return -ENOMEM;
 
 	chip->card = card;
 
 	chip->ring_base = dma_alloc_coherent(NULL, MACEISA_RINGBUFFERS_SIZE,
 					     &chip->ring_base_dma, GFP_USER);
-	if (chip->ring_base = NULL) {
+	if (!chip->ring_base) {
 		printk(KERN_ERR
 		       "sgio2audio: could not allocate ring buffers\n");
 		kfree(chip);
-- 
2.15.0

