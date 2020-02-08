From: Colin King <colin.king@canonical.com>
Date: Sat, 08 Feb 2020 22:34:43 +0000
Subject: [PATCH] ALSA: ali5451: remove redundant variable capture_flag
Message-Id: <20200208223443.38047-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable capture_flag is only ever assigned values, it is never read
and hence it is redundant. Remove it.

Addresses-Coverity ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/ali5451/ali5451.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 4f524a9dbbca..4462375d2d82 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1070,7 +1070,7 @@ static int snd_ali_trigger(struct snd_pcm_substream *substream,
 {
 	struct snd_ali *codec = snd_pcm_substream_chip(substream);
 	struct snd_pcm_substream *s;
-	unsigned int what, whati, capture_flag;
+	unsigned int what, whati;
 	struct snd_ali_voice *pvoice, *evoice;
 	unsigned int val;
 	int do_start;
@@ -1088,7 +1088,7 @@ static int snd_ali_trigger(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	what = whati = capture_flag = 0;
+	what = whati = 0;
 	snd_pcm_group_for_each_entry(s, substream) {
 		if ((struct snd_ali *) snd_pcm_substream_chip(s) = codec) {
 			pvoice = s->runtime->private_data;
@@ -1110,8 +1110,6 @@ static int snd_ali_trigger(struct snd_pcm_substream *substream,
 					evoice->running = 0;
 			}
 			snd_pcm_trigger_done(s, substream);
-			if (pvoice->mode)
-				capture_flag = 1;
 		}
 	}
 	spin_lock(&codec->reg_lock);
-- 
2.25.0
