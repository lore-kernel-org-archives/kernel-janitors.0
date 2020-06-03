From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 03 Jun 2020 12:34:44 +0000
Subject: Re: [PATCH] pinctrl: freescale: imx: Fix an error handling path in 'imx_pinctrl_probe()'
Message-Id: <CACRpkdYR11Gy99N0TPCkNFoBKKQLP2x3JsnH9=_S7mxPXgYKig@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stefan Agner <stefan@agner.ch>, Gary Bisson <gary.bisson@boundarydevices.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Sat, May 30, 2020 at 10:49 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> 'pinctrl_unregister()' should not be called to undo
> 'devm_pinctrl_register_and_init()', it is already handled by the framework.
>
> This simplifies the error handling paths of the probe function.
> The 'imx_free_resources()' can be removed as well.
>
> Fixes: a51c158bf0f7 ("pinctrl: imx: use radix trees for groups and functions")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied!

Yours,
Linus Walleij
