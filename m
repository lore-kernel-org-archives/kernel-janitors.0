From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 23 Jun 2020 07:36:24 +0000
Subject: Re: [PATCH v2 1/2] ASoC: fsl_mqs: Don't check clock is NULL before calling clk API
Message-Id: <39ac8f24-3148-2a3d-3f8d-91567b3c4c9e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>

> In-Reply-To: <cover.1592888591.git.shengjiu.wang@nxp.com>

I guess that it should be sufficient to specify such a field once
for the header information.


> Because clk_prepare_enable and clk_disable_unprepare should
> check input clock parameter is NULL or not internally,

I find this change description unclear.


> then we don't need to check them before calling the function.

Please use an imperative wording for the commit message.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/process/submitting-patches.rst?id=DD0d718152e4c65b173070d48ea9df=
c06894c3e5#n151

Regards,
Markus
