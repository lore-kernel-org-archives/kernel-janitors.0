From: Colin King <colin.king@canonical.com>
Date: Thu, 27 Apr 2017 15:13:15 +0000
Subject: [PATCH] ASoC: Intel: Skylake: use dev in dev_err rather than skl pointer
Message-Id: <20170427151315.19731-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Vinod Koul <vinod.koul@intel.com>, Jeeja KP <jeeja.kp@intel.com>, Jayachandran B <jayachandran.b@intel.com>, Senthilnathan Veppur <senthilnathanx.veppur@intel.com>, Colin Ian King <colin.king@canonical.com>, Ramesh Babu <ramesh.babu@intel.com>, "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>, G Kranthi <gudishax.kranthikumar@intel.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The dev_err message is dereferencing an uininitialized skl pointer
which should be avoided. Don't use skl, use dev instead.

Detected by CoverityScan, CID#1432042 ("Uninitialized pointer read")

Fixes: 9fe9c71192832 ("ASoC: Intel: Skylake: Move sst common initialization to a helper function")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/intel/skylake/bxt-sst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index fde4bc0f35b0..f5e7dbb1ba39 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -564,7 +564,7 @@ int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 
 	ret = skl_sst_ctx_init(dev, irq, fw_name, dsp_ops, dsp, &skl_dev);
 	if (ret < 0) {
-		dev_err(skl->dev, "%s: no device\n", __func__);
+		dev_err(dev, "%s: no device\n", __func__);
 		return ret;
 	}
 
-- 
2.11.0

