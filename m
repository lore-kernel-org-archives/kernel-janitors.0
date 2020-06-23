From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Jun 2020 11:35:51 +0000
Subject: Re: [PATCH v2 1/2] ASoC: fsl_mqs: Don't check clock is NULL before calling clk API
Message-Id: <CAA+D8AMSVCbJtcDoCbsMeV6ygrSdARpn3_PWE83mitcnkA1Tog@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39ac8f24-3148-2a3d-3f8d-91567b3c4c9e@web.de>
 <CAA+D8APR2NGAn9jRDSZzr1fgj5u0hAvH19VxZS+tj2A7j3PCuw@mail.gmail.com>
 <24be48d2-63de-b900-cec7-d21e83a89ca2@web.de>
In-Reply-To: <24be48d2-63de-b900-cec7-d21e83a89ca2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org

On Tue, Jun 23, 2020 at 4:55 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> >     clk_prepare_enable and clk_disable_unprepare check the input
> >     clock parameter in the beginning of the function,
>
> These functions call further functions which perform null pointer checks.
>
>
> >                                                       if the parameter
> >     is NULL, clk_prepare_enable and clk_disable_unprepare will
> >     return immediately.
>
> The interpretation of these function implementations seems to be reasonable.
> Would you like to achieve any improvements for the corresponding software documentation?

Which document do you mean?

>
>
> >     So Don't need to check input clock parameters before calling clk API.
>
> What do you find imperative in this wording?
>
> Another wording alternative:
>    Thus omit extra null pointer checks before four function calls.
>
> Regards,
> Markus
