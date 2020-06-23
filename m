From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 23 Jun 2020 12:45:21 +0000
Subject: Re: [v2 1/2] ASoC: fsl_mqs: Don't check clock is NULL before calling clk API
Message-Id: <a2a5d4d7-748b-e164-09c9-13245b64b9cc@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39ac8f24-3148-2a3d-3f8d-91567b3c4c9e@web.de>
 <CAA+D8APR2NGAn9jRDSZzr1fgj5u0hAvH19VxZS+tj2A7j3PCuw@mail.gmail.com>
 <24be48d2-63de-b900-cec7-d21e83a89ca2@web.de>
 <CAA+D8AMSVCbJtcDoCbsMeV6ygrSdARpn3_PWE83mitcnkA1Tog@mail.gmail.com>
In-Reply-To: <CAA+D8AMSVCbJtcDoCbsMeV6ygrSdARpn3_PWE83mitcnkA1Tog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shengjiu Wang <shengjiu.wang@gmail.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>

>>>                                                       if the parameter
>>>     is NULL, clk_prepare_enable and clk_disable_unprepare will
>>>     return immediately.
>>
>> The interpretation of these function implementations seems to be reasonable.
>> Would you like to achieve any improvements for the corresponding software documentation?
>
> Which document do you mean?

Example:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/clk.h?id=dd0d718152e4c65b173070d48ea9dfc06894c3e5#n905
https://elixir.bootlin.com/linux/v5.7.2/source/include/linux/clk.h#L905

Regards,
Markus
