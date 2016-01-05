From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 05 Jan 2016 10:19:57 +0000
Subject: Re: [patch] gpio: pxa: checking IS_ERR() instead of NULL
Message-Id: <CACRpkdY3Gv-pCh=LJ32AQpGd4qnoUB_-3WHZh1JX=H6cbQ4WYg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160105095637.GE23619@mwanda>
In-Reply-To: <20160105095637.GE23619@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Jan 5, 2016 at 10:56 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> irq_domain_add_legacy() returns NULL on error, it doesn't return error
> pointers.
>
> Fixes: 384ca3c6a28d ('gpio: pxa: change the interrupt management')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
