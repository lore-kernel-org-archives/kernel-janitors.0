From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Feb 2016 12:58:44 +0000
Subject: Re: [patch] gpiolib: shifters used as flags in gpio_ioctl()
Message-Id: <CACRpkdYTgvXDZjwi9TLkmwU+Afh1fBRFNNddrk_GRvZ3mQGcjg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160223094450.GB4030@mwanda>
In-Reply-To: <20160223094450.GB4030@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Feb 23, 2016 at 10:44 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> We weren't testing whether the bits were set correctly because we used
> shifters as flags.  It means that we give the user incorrect line
> information in this new ioctl.
>
> Fixes: 521a2ad6f862 ('gpio: add userspace ABI for GPIO line information')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Already wrote and queued a similar patch yesterday, but thanks anyway Dan!

Yours,
Linus Walleij
