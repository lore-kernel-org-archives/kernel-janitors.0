From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Jun 2020 10:13:46 +0000
Subject: Re: [PATCH] pinctrl: freescale: imx: Fix an error handling path in 'imx_pinctrl_probe()'
Message-Id: <20200602101346.GW30374@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: aisheng.dong@nxp.com, festevam@gmail.com, linus.walleij@linaro.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, stefan@agner.ch, gary.bisson@boundarydevices.com, linux-gpio@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org

On Sat, May 30, 2020 at 10:49:55PM +0200, Christophe JAILLET wrote:
> 'pinctrl_unregister()' should not be called to undo
> 'devm_pinctrl_register_and_init()', it is already handled by the framework.
> 
> This simplifies the error handling paths of the probe function.
> The 'imx_free_resources()' can be removed as well.
> 
> Fixes: a51c158bf0f7 ("pinctrl: imx: use radix trees for groups and functions")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

You didn't introduce this but the:

	ipctl->input_sel_base = of_iomap(np, 0);

should be changed to devm_of_iomap().

regards,
dan carpenter
