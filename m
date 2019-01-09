From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Jan 2019 09:29:24 +0000
Subject: Re: [PATCH -next] ASoC: Intel: bytcht_es8316: Set correct platform drvdata in snd_byt_cht_es8316_mc_
Message-Id: <20190109092924.GB1743@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547023011-8321-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1547023011-8321-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: alsa-devel@alsa-project.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>

I think the correct fix is actually this (untested):

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index cdf2061e7613..fa9c4cf97686 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -544,7 +544,8 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 
 static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
 {
-	struct byt_cht_es8316_private *priv = platform_get_drvdata(pdev);
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
 
 	gpiod_put(priv->speaker_en_gpio);
 	return 0;
