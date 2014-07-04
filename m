From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 04 Jul 2014 23:16:23 +0000
Subject: Re: [patch] pinctrl: berlin: fix an error code in berlin_pinctrl_probe()
Message-Id: <CACRpkdbPEY=wggCEd36FsZF2v9srCypjovwJFuh4Yu46dB6tgA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140611081513.GA29572@mwanda>
In-Reply-To: <20140611081513.GA29572@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jun 11, 2014 at 10:15 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> We are returning success here because PTR_ERR(NULL) is zero.  We should
> be returning -ENODEV.
>
> Fixes: 3de68d331c24 ('pinctrl: berlin: add the core pinctrl driver for Marvell Berlin SoCs')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied for fixes!

Yours,
Linus Walleij
