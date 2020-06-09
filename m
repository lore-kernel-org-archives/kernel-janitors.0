From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 09 Jun 2020 14:20:09 +0000
Subject: Re: [PATCH] lib: devres: add a comment about the devm_of_iomap() function
Message-Id: <CAK8P3a0TivBERWMZcs8Kndb4=Fc41JH6vkxJzMp1FHsazvLfdQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <20200609104642.GA43074@mwanda>
In-Reply-To: <20200609104642.GA43074@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andrew Morton <akpm@linux-foundation.org>, Tuowen Zhao <ztuowen@gmail.com>, Denis Efremov <efremov@linux.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, BOUGH CHEN <haibo.chen@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jun 9, 2020 at 12:47 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We recently introduced a bug when we tried to convert of_iomap() to
> devm_of_iomap().  The problem was that there were two drivers mapping
> the same io region.  The first driver was using of_iomap() and the
> second driver was using devm_of_iomap() and the kernel booted fine.
> When we converted the first drive to use devm_of_iomap() then the second
> driver failed with -EBUSY and the kernel couldn't boot.
>
> Let's add a comment to prevent this sort of mistake in the future.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good idea,

Acked-by: Arnd Bergmann <arnd@arndb.de>
