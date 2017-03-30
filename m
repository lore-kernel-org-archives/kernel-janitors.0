From: Colin King <colin.king@canonical.com>
Date: Thu, 30 Mar 2017 10:09:34 +0000
Subject: [PATCH] ASoC: Intel: bxtn: fix spelling mistake: "Timout" -> "Timeout"
Message-Id: <20170330100934.19887-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Vinod Koul <vinod.koul@intel.com>, Jeeja KP <jeeja.kp@intel.com>, Jayachandran B <jayachandran.b@intel.com>, Senthilnathan Veppur <senthilnathanx.veppur@intel.com>, Ramesh Babu <ramesh.babu@intel.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

trivial fix to spelling mistake in dev_err error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/intel/skylake/bxt-sst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 600d95891996..268bdaec8042 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -171,7 +171,7 @@ static int sst_bxt_prepare_fw(struct sst_dsp *ctx,
 					SKL_ADSP_REG_HIPCIE_DONE,
 					BXT_INIT_TIMEOUT, "HIPCIE Done");
 	if (ret < 0) {
-		dev_err(ctx->dev, "Timout for Purge Request%d\n", ret);
+		dev_err(ctx->dev, "Timeout for Purge Request%d\n", ret);
 		goto base_fw_load_failed;
 	}
 
-- 
2.11.0

