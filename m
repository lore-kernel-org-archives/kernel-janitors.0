From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Jan 2015 09:22:08 +0000
Subject: Re: [patch] gpio: grgpio: off by one in grgpio_to_irq()
Message-Id: <CACRpkdbPzjnqOj2Tgy19a=U9n5Ah0qkWj9JOPUw6WAT10x1SWQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141216235358.GD31467@mwanda>
In-Reply-To: <20141216235358.GD31467@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 17, 2014 at 12:53 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> "gc->ngpio" is a number between 1 and GRGPIO_MAX_NGPIO.  If "offset" is
> GRGPIO_MAX_NGPIO then we're going one step beyond the end of the
> priv->lirqs[] array.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Alex's ACK.

Yours,
Linus Walleij
