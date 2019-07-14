From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Jul 2019 08:47:20 +0000
Subject: Re: [PATCH 1/2] ASoC: samsung: odroid: fix an use-after-free issue for codec
Message-Id: <0eeabac6-edbd-b829-817f-ffff87e1a825@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1562989575-33785-2-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1562989575-33785-2-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, Krzysztof Kozlowski <krzk@kernel.org>, alsa-devel@alsa-project.org
Cc: Cheng Shengyu <cheng.shengyu@zte.com.cn>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Xue Zhihong <xue.zhihong@zte.com.cn>, Yi Wang <wang.yi59@zte.com.cn>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> @@ -317,6 +316,7 @@ static int odroid_audio_probe(struct platform_device *pdev)

>  		goto err_put_clk_i2s;

>  	}

>

> +	of_node_put(codec);


I would prefer to avoid a bit of duplicate source code also at this place.
Thus I would find a statement like “goto put_node;” more appropriate here.


>  	return 0;

>

>  err_put_clk_i2s:



Regards,
Markus
