From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 22 Jun 2020 16:07:02 +0000
Subject: Re: [PATCH] ASoC: fsl_mqs: Fix unchecked return value for clk_prepare_enable
Message-Id: <3eab889e-75b6-6287-a668-a2eaa509834c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>

> Fix unchecked return value for clk_prepare_enable.
>
> And because clk_prepare_enable and clk_disable_unprepare should
> check input clock parameter is NULL or not, then we don't need
> to check it before calling the function.

I propose to split the adjustment of two function implementations
into separate update steps for a small patch series.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?idb5d3449788f85569096780592549d0340e9c0c7#n138

I suggest to improve the change descriptions accordingly.

Regards,
Markus
