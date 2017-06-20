From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 Jun 2017 09:36:40 +0000
Subject: Re: [PATCH] pinctrl: ingenic: checking for NULL instead of IS_ERR()
Message-Id: <CACRpkdZ6qczpU+ovDdmUyURMasQgdvNUypWoFLBWk7B2b2v4+Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614091209.GC29394@elgon.mountain>
In-Reply-To: <20170614091209.GC29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paul Cercueil <paul@crapouillou.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jun 14, 2017 at 11:12 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> devm_pinctrl_register() returns error pointers, it doesn't return NULL.
>
> Fixes: b5c23aa46537 ("pinctrl: add a pinctrl driver for the Ingenic jz47xx SoCs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
