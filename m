From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 27 Aug 2017 06:46:50 +0000
Subject: [PATCH] ASoC: davinci-mcasp: check memory allocation failure
Message-Id: <20170827064650.7562-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, peter.ujfalusi@ti.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Check memory allocation failures and return -ENOMEM in such cases, as
already done above for another memory allocation.

This avoids NULL pointers dereference.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/davinci/davinci-mcasp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/davinci/davinci-mcasp.c b/sound/soc/davinci/davinci-mcasp.c
index d486908d4e0e..f395bbc7c354 100644
--- a/sound/soc/davinci/davinci-mcasp.c
+++ b/sound/soc/davinci/davinci-mcasp.c
@@ -1851,6 +1851,10 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	mcasp->context.xrsr_regs = devm_kzalloc(&pdev->dev,
 					sizeof(u32) * mcasp->num_serializer,
 					GFP_KERNEL);
+	if (!mcasp->context.xrsr_regs) {
+		ret = -ENOMEM;
+		goto err;
+	}
 #endif
 	mcasp->serial_dir = pdata->serial_dir;
 	mcasp->version = pdata->version;
-- 
2.11.0

