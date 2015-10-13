From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Oct 2015 07:07:56 +0000
Subject: [patch] ALSA: pcm: harmless underflow issue in snd_pcm_sw_params()
Message-Id: <20151013070756.GA31537@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

"params->tstamp_mode" is a user supplied int.  We cap the maximum but
allow negative values by mistake.  It's harmless but static checkers
complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 75888dd..4863af5 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -650,7 +650,8 @@ static int snd_pcm_sw_params(struct snd_pcm_substream *substream,
 	}
 	snd_pcm_stream_unlock_irq(substream);
 
-	if (params->tstamp_mode > SNDRV_PCM_TSTAMP_LAST)
+	if (params->tstamp_mode < 0 ||
+	    params->tstamp_mode > SNDRV_PCM_TSTAMP_LAST)
 		return -EINVAL;
 	if (params->proto >= SNDRV_PROTOCOL_VERSION(2, 0, 12) &&
 	    params->tstamp_type > SNDRV_PCM_TSTAMP_TYPE_LAST)
