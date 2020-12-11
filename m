From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Dec 2020 10:06:52 +0000
Subject: [PATCH] ASoC: Intel: fix error code cnl_set_dsp_D0()
Message-Id: <X9NEvCzuN+IObnTN@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cezary Rojewski <cezary.rojewski@intel.com>, Guneshwor Singh <guneshwor.o.singh@intel.com>
Cc: alsa-devel@alsa-project.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, kernel-janitors@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Mark Brown <broonie@kernel.org>

Return -ETIMEDOUT if the dsp boot times out instead of returning
success.

Fixes: cb6a55284629 ("ASoC: Intel: cnl: Add sst library functions for cnl platform")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

 sound/soc/intel/skylake/cnl-sst.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index fcd8dff27ae8..1275c149acc0 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -224,6 +224,7 @@ static int cnl_set_dsp_D0(struct sst_dsp *ctx, unsigned int core_id)
 				"dsp boot timeout, status=%#x error=%#x\n",
 				sst_dsp_shim_read(ctx, CNL_ADSP_FW_STATUS),
 				sst_dsp_shim_read(ctx, CNL_ADSP_ERROR_CODE));
+			ret = -ETIMEDOUT;
 			goto err;
 		}
 	} else {
-- 
2.29.2
