From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 11:23:10 +0000
Subject: [PATCH] ASoC: Broadwell RT5677: Delete an error message for a failed memory allocation in bdw_rt5677
Message-Id: <30b48ffc-8149-e1bc-d3cd-b8ff3bc8062f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ben Zhang <benzh@chromium.org>, Dylan Reid <dgreid@chromium.org>, Jaroslav Kysela <perex@perex.cz>, John Keeping <john@metanate.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 13:05:40 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/intel/boards/bdw-rt5677.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 058b8ccedf02..4b1431c3b460 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -349,7 +349,5 @@ static int bdw_rt5677_probe(struct platform_device *pdev)
-	if (!bdw_rt5677) {
-		dev_err(&pdev->dev, "Can't allocate bdw_rt5677\n");
+	if (!bdw_rt5677)
 		return -ENOMEM;
-	}
 
 	snd_soc_card_set_drvdata(&bdw_rt5677_card, bdw_rt5677);
 
-- 
2.14.0

