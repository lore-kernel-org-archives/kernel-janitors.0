From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 30 Apr 2020 06:36:00 +0000
Subject: Re: [PATCH] ASoC: mxs-saif: Add variable dev to simplify code
Message-Id: <a397e9c0-343c-685a-dd3f-53be09429a70@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tang Bin <tangbin@cmss.chinamobile.com>, Zhang Shengju <zhangshengju@cmss.chinamobile.com>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>

> Add variable 'dev' to make the code cleaner in the function
> mxs_saif_probe(). And now that the function mxs_saif_mclk_init()
> have defined the variables 'ret' as the error returned value,
> then it should be used instead in this place.

I find it clearer to integrate such source code adjustments by separate patches
together with improved commit messages.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id2cc5ac6f6668cc15216d51051103c61467d7e8#n138


Would you become interested to search for similar update candidates
by the means of the semantic patch language (Coccinelle software)?

Regards,
Markus
