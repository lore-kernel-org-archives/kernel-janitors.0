From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Jun 2017 12:20:06 +0000
Subject: [PATCH] ASoC: stm32: sai: remove some stray tabs
Message-Id: <20170628121946.fvw2mpirm2kjaqak@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, olivier moysan <olivier.moysan@st.com>
Cc: alsa-devel@alsa-project.org, Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>

This line was accidentally indented too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index ba3fdc777ed8..90d439613899 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -631,7 +631,7 @@ static int stm32_sai_configure_clock(struct snd_soc_dai *cpu_dai,
 	dev_dbg(cpu_dai->dev, "SAI clock %d, divider %d\n", sai_clk_rate, div);
 
 	mask = SAI_XCR1_MCKDIV_MASK(SAI_XCR1_MCKDIV_WIDTH(version));
-				    cr1 = SAI_XCR1_MCKDIV_SET(div);
+	cr1 = SAI_XCR1_MCKDIV_SET(div);
 	ret = regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX, mask, cr1);
 	if (ret < 0) {
 		dev_err(cpu_dai->dev, "Failed to update CR1 register\n");
