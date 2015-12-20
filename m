From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 20 Dec 2015 11:15:50 +0000
Subject: [PATCH 1/4] ASoC: imx-pcm-dma: add NULL test
Message-Id: <1450610153-7746-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450610153-7746-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450610153-7746-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@tabi.org>
Cc: kernel-janitors@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

Add NULL test on call to devm_kzalloc.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
@@

* x = devm_kzalloc(...);
  ... when != x = NULL
  *x
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 sound/soc/fsl/imx-pcm-dma.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/imx-pcm-dma.c b/sound/soc/fsl/imx-pcm-dma.c
index 1fc01ed..f3d3d1f 100644
--- a/sound/soc/fsl/imx-pcm-dma.c
+++ b/sound/soc/fsl/imx-pcm-dma.c
@@ -62,6 +62,8 @@ int imx_pcm_dma_init(struct platform_device *pdev, size_t size)
 
 	config = devm_kzalloc(&pdev->dev,
 			sizeof(struct snd_dmaengine_pcm_config), GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
 	*config = imx_dmaengine_pcm_config;
 	if (size)
 		config->prealloc_buffer_size = size;

