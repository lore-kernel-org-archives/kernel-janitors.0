From: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
Date: Mon, 13 Apr 2020 04:29:52 +0000
Subject: [PATCH] soc/stm/stm32_sub_sai: Add missing '\n' in log messages
Message-Id: <20200413042952.7675-1-sebastian.fricke.linux@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: olivier.moysan@st.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Liam Girdwood <lgirdwood@gmail.com>, sebastian.fricke.linux@gmail.com, Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: 3e086ed("ASoC: stm32: add SAI drivers")

Signed-off-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
---
 sound/soc/stm/stm32_sai_sub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 0d0c9afd8791..34a7c3d6fb91 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -837,7 +837,7 @@ static int stm32_sai_set_config(struct snd_soc_dai *cpu_dai,
 		cr1 = SAI_XCR1_DS_SET(SAI_DATASIZE_32);
 		break;
 	default:
-		dev_err(cpu_dai->dev, "Data format not supported");
+		dev_err(cpu_dai->dev, "Data format not supported\n");
 		return -EINVAL;
 	}
 
-- 
2.20.1
