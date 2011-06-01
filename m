From: Julia Lawall <julia@diku.dk>
Date: Wed, 01 Jun 2011 17:10:05 +0000
Subject: [PATCH 2/10] sound/soc/nuc900/nuc900-ac97.c: add missing clk_put
Message-Id: <1306948213-20767-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@ti.com>
Cc: alsa-devel@alsa-project.org, Wan ZongShun <mcuos.com@gmail.com>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Axel Lin <axel.lin@gmail.com>, Timur Tabi <timur@freescale.com>

From: Julia Lawall <julia@diku.dk>

This goto is after the call to clk_get, so it should go to the label that
includes a call to clk_put.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression e1,e2;
statement S;
@@

e1 = clk_get@p1(...);
... when != e1 = e2
    when != clk_put(e1)
    when any
if (...) { ... when != clk_put(e1)
               when != if (...) { ... clk_put(e1) ... }
* return@p3 ...;
 } else S
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 sound/soc/nuc900/nuc900-ac97.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/nuc900/nuc900-ac97.c b/sound/soc/nuc900/nuc900-ac97.c
index dac6732..9c0edad 100644
--- a/sound/soc/nuc900/nuc900-ac97.c
+++ b/sound/soc/nuc900/nuc900-ac97.c
@@ -356,7 +356,7 @@ static int __devinit nuc900_ac97_drvprobe(struct platform_device *pdev)
 	nuc900_audio->irq_num = platform_get_irq(pdev, 0);
 	if (!nuc900_audio->irq_num) {
 		ret = -EBUSY;
-		goto out2;
+		goto out3;
 	}
 
 	nuc900_ac97_data = nuc900_audio;

