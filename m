From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 03 Jun 2020 12:31:13 +0000
Subject: Re: [PATCH] pinctrl: imxl: Fix an error handling path in 'imx1_pinctrl_core_probe()'
Message-Id: <CACRpkdYvoe8o8Db1mszfgcHA3XZF7LJ3P1u5pnKOfEfS99F0Ew@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530201952.585798-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530201952.585798-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stefan Agner <stefan@agner.ch>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Sat, May 30, 2020 at 10:20 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> When 'pinctrl_register()' has been turned into 'devm_pinctrl_register()',
> an error handling path has not been updated.
>
> Axe a now unneeded 'pinctrl_unregister()'.
>
> Fixes: e55e025d1687 ("pinctrl: imxl: Use devm_pinctrl_register() for pinctrl registration")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij
