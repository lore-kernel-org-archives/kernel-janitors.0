From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Oct 2015 14:45:37 +0000
Subject: Re: [patch] gpio: pl061: returning with lock held in pl061_irq_type()
Message-Id: <CACRpkdbqWU-NO=tvZ5DvmKT_R31TKz_PTLOt4d5bmj96Gq4LrA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151008064001.GA25441@mwanda>
In-Reply-To: <20151008064001.GA25441@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Oct 8, 2015 at 9:12 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We were returning with "chip->lock" held by mistake.  It's safe to
> move the return to before we take the spinlock.
>
> Fixes: 1dbf7f299f90 ('gpio: pl061: detail IRQ trigger handling')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, patch applied.

Yours,
Linus Walleij
