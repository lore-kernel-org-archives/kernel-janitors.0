From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jan 2016 12:20:02 +0000
Subject: [patch] ASoC: AMD: free memory on error
Message-Id: <20160113122002.GA19993@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Murali Krishna Vemuri <murali-krishna.vemuri@amd.com>, Guenter Roeck <linux@roeck-us.net>

Static checkers complain if we don't free "adata" before returning.

Fixes: 7c31335a03b6 ('ASoC: AMD: add AMD ASoC ACP 2.x DMA driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index 3191e0a..d1fb035 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -635,6 +635,7 @@ static int acp_dma_open(struct snd_pcm_substream *substream)
 					    SNDRV_PCM_HW_PARAM_PERIODS);
 	if (ret < 0) {
 		dev_err(prtd->platform->dev, "set integer constraint failed\n");
+		kfree(adata);
 		return ret;
 	}
 
