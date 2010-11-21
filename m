From: Vasiliy Kulikov <segoon@openwall.com>
Date: Sun, 21 Nov 2010 17:40:07 +0000
Subject: [PATCH] ALSA: snd-atmel-abdac: test wrong variable
Message-Id: <1290361209-15121-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

After clk_get() pclk is checked second time instead of sample_clk check.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 sound/atmel/abdac.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/atmel/abdac.c b/sound/atmel/abdac.c
index f2f41c8..4e47baa 100644
--- a/sound/atmel/abdac.c
+++ b/sound/atmel/abdac.c
@@ -420,7 +420,7 @@ static int __devinit atmel_abdac_probe(struct platform_device *pdev)
 		return PTR_ERR(pclk);
 	}
 	sample_clk = clk_get(&pdev->dev, "sample_clk");
-	if (IS_ERR(pclk)) {
+	if (IS_ERR(sample_clk)) {
 		dev_dbg(&pdev->dev, "no sample clock\n");
 		retval = PTR_ERR(pclk);
 		goto out_put_pclk;
-- 
1.7.0.4

