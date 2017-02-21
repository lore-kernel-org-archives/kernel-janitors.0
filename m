From: Colin King <colin.king@canonical.com>
Date: Tue, 21 Feb 2017 18:50:05 +0000
Subject: [PATCH] ASoC: Intel: Skylake: fix spelling mistake: "allocationf" -> "allocation"
Message-Id: <20170221185005.27973-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jeeja KP <jeeja.kp@intel.com>, Vinod Koul <vinod.koul@intel.com>, Dharageswari R <dharageswari.r@intel.com>, "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>, Pardha Saradhi K <pardha.saradhi.kesapragada@intel.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/intel/skylake/skl-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index e12520e..635cbb1 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1165,7 +1165,7 @@ static int skl_pcm_new(struct snd_soc_pcm_runtime *rtd)
 						snd_dma_pci_data(skl->pci),
 						size, MAX_PREALLOC_SIZE);
 		if (retval) {
-			dev_err(dai->dev, "dma buffer allocationf fail\n");
+			dev_err(dai->dev, "dma buffer allocation fail\n");
 			return retval;
 		}
 	}
-- 
2.10.2

