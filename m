From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Jul 2015 08:57:36 +0000
Subject: [patch] ASoC: sti: error handling bug in sti_uniperiph_cpu_dai_of()
Message-Id: <20150721085736.GB22070@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, kbuild test robot <fengguang.wu@intel.com>

There is a stray '!' which means the condition is never true.

Fixes: f3bd847eb0a7 ('ASoC: sti: Add uniperipheral dai driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/sti/sti_uniperif.c b/sound/soc/sti/sti_uniperif.c
index 51f745c..dffabf3 100644
--- a/sound/soc/sti/sti_uniperif.c
+++ b/sound/soc/sti/sti_uniperif.c
@@ -175,7 +175,7 @@ static int sti_uniperiph_cpu_dai_of(struct device_node *node,
 				     UNIPERIF_FIFO_DATA_OFFSET(uni);
 
 	uni->irq = platform_get_irq(priv->pdev, 0);
-	if (!uni->irq < 0) {
+	if (uni->irq < 0) {
 		dev_err(dev, "Failed to get IRQ resource");
 		return -ENXIO;
 	}
