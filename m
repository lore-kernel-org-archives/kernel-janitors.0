From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Dec 2017 11:52:03 +0000
Subject: [PATCH 1/2] ASoC: nuc900: Fix platform_get_irq() error checking some more
Message-Id: <20171209115203.pdtdfnmzwz6zpjqs@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

The error handling doesn't work here because "nuc900_audio->irq_num" is
unsigned.  Also we should be checking for < 0 and not <= 0 but I believe
that's harmless.  The platform_get_irq() comments don't talk about the
return values...

Fixes: fa8cc38165c2 ("ASoC: nuc900: Fix platform_get_irq's error checking")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/nuc900/nuc900-ac97.c b/sound/soc/nuc900/nuc900-ac97.c
index 5e4fbd2d3479..71fce7c85c93 100644
--- a/sound/soc/nuc900/nuc900-ac97.c
+++ b/sound/soc/nuc900/nuc900-ac97.c
@@ -345,11 +345,10 @@ static int nuc900_ac97_drvprobe(struct platform_device *pdev)
 		goto out;
 	}
 
-	nuc900_audio->irq_num = platform_get_irq(pdev, 0);
-	if (nuc900_audio->irq_num <= 0) {
-		ret = nuc900_audio->irq_num < 0 ? nuc900_audio->irq_num : -EBUSY;
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
 		goto out;
-	}
+	nuc900_audio->irq_num = ret;
 
 	nuc900_ac97_data = nuc900_audio;
 
