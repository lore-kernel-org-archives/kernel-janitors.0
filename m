From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Apr 2017 18:50:02 +0000
Subject: [PATCH] ASoC: Intel: Skylake: uninitialized variable in error message
Message-Id: <20170427185002.r4yv2uuex6t7jz2m@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170420101702.nlq3537xumrseu26@mwanda>
In-Reply-To: <20170420101702.nlq3537xumrseu26@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, G Kranthi <gudishax.kranthikumar@intel.com>
Cc: alsa-devel@alsa-project.org, Vinod Koul <vinod.koul@intel.com>, Jayachandran B <jayachandran.b@intel.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Ramesh Babu <ramesh.babu@intel.com>, Mark Brown <broonie@kernel.org>, Senthilnathan Veppur <senthilnathanx.veppur@intel.com>, Jeeja KP <jeeja.kp@intel.com>, "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>

"skl" hasn't been initialized yet, so we can't dereference it.

Fixes: 9fe9c7119283 ("ASoC: Intel: Skylake: Move sst common initialization to a helper function")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
 
