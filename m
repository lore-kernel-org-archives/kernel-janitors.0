From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Apr 2020 08:39:22 +0000
Subject: [PATCH][next] ASoC: fsl_easrc: fix spelling mistake "prefitler" -> "prefilter"
Message-Id: <20200423083922.8159-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a deb_dbg message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/fsl/fsl_easrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 233f26ff885c..97658e1f4989 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1769,7 +1769,7 @@ static void fsl_easrc_dump_firmware(struct fsl_asrc *easrc)
 	}
 
 	dev_dbg(dev, "Firmware v%u dump:\n", firm->firmware_version);
-	dev_dbg(dev, "Num prefitler scenarios: %u\n", firm->prefil_scen);
+	dev_dbg(dev, "Num prefilter scenarios: %u\n", firm->prefil_scen);
 	dev_dbg(dev, "Num interpolation scenarios: %u\n", firm->interp_scen);
 	dev_dbg(dev, "\nInterpolation scenarios:\n");
 
-- 
2.25.1
