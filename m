From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Jun 2020 05:13:30 +0000
Subject: Re: [PATCH] ASoC: fsl_mqs: Fix unchecked return value for clk_prepare_enable
Message-Id: <CAA+D8ANyeND269US_e3VZg-pOVJ6Beu54C2SL19h6y+ut03OYg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3eab889e-75b6-6287-a668-a2eaa509834c@web.de>
In-Reply-To: <3eab889e-75b6-6287-a668-a2eaa509834c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org

On Tue, Jun 23, 2020 at 12:08 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > Fix unchecked return value for clk_prepare_enable.
> >
> > And because clk_prepare_enable and clk_disable_unprepare should
> > check input clock parameter is NULL or not, then we don't need
> > to check it before calling the function.
>
> I propose to split the adjustment of two function implementations
> into separate update steps for a small patch series.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?idb5d3449788f85569096780592549d0340e9c0c7#n138
>
> I suggest to improve the change descriptions accordingly.

ok, will update the patches in v2.

best regards
wang shengjiu
