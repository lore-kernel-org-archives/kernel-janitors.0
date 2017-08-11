From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 09:33:56 +0000
Subject: [PATCH] ASoC: Medfield: Delete an error message for a failed memory allocation in snd_mfld_mc_probe(
Message-Id: <161e9c4c-1c97-d06f-35ec-3f165ad9e52e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Vinod Koul <vinod.koul@intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 11:25:41 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/intel/boards/mfld_machine.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/mfld_machine.c b/sound/soc/intel/boards/mfld_machine.c
index 4e08885f37aa..6f44acfb4aae 100644
--- a/sound/soc/intel/boards/mfld_machine.c
+++ b/sound/soc/intel/boards/mfld_machine.c
@@ -376,10 +376,8 @@ static int snd_mfld_mc_probe(struct platform_device *pdev)
 	/* audio interrupt base of SRAM location where
 	 * interrupts are stored by System FW */
 	mc_drv_ctx = devm_kzalloc(&pdev->dev, sizeof(*mc_drv_ctx), GFP_ATOMIC);
-	if (!mc_drv_ctx) {
-		pr_err("allocation failed\n");
+	if (!mc_drv_ctx)
 		return -ENOMEM;
-	}
 
 	irq_mem = platform_get_resource_byname(
 				pdev, IORESOURCE_MEM, "IRQ_BASE");
-- 
2.14.0

