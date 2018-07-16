From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Jul 2018 08:52:56 +0000
Subject: [PATCH] ALSA: sb8: remove redundant pointer runtime
Message-Id: <20180716085256.15878-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer runtime is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'runtime' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/isa/sb/sb8_main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/isa/sb/sb8_main.c b/sound/isa/sb/sb8_main.c
index d45df5c54423..80e7dcaa551f 100644
--- a/sound/isa/sb/sb8_main.c
+++ b/sound/isa/sb/sb8_main.c
@@ -381,7 +381,6 @@ static int snd_sb8_capture_trigger(struct snd_pcm_substream *substream,
 irqreturn_t snd_sb8dsp_interrupt(struct snd_sb *chip)
 {
 	struct snd_pcm_substream *substream;
-	struct snd_pcm_runtime *runtime;
 
 	snd_sb_ack_8bit(chip);
 	switch (chip->mode) {
@@ -391,7 +390,6 @@ irqreturn_t snd_sb8dsp_interrupt(struct snd_sb *chip)
 		/* fallthru */
 	case SB_MODE_PLAYBACK_8:
 		substream = chip->playback_substream;
-		runtime = substream->runtime;
 		if (chip->playback_format = SB_DSP_OUTPUT)
 		    	snd_sb8_playback_trigger(substream, SNDRV_PCM_TRIGGER_START);
 		snd_pcm_period_elapsed(substream);
@@ -402,7 +400,6 @@ irqreturn_t snd_sb8dsp_interrupt(struct snd_sb *chip)
 		/* fallthru */
 	case SB_MODE_CAPTURE_8:
 		substream = chip->capture_substream;
-		runtime = substream->runtime;
 		if (chip->capture_format = SB_DSP_INPUT)
 		    	snd_sb8_capture_trigger(substream, SNDRV_PCM_TRIGGER_START);
 		snd_pcm_period_elapsed(substream);
-- 
2.17.1

