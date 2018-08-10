From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Aug 2018 21:14:42 +0000
Subject: Re: [PATCH] pinctrl: nomadik: silence uninitialized variable warning
Message-Id: <CACRpkdaggExAYMqZgkAQbDy=2MxDdYgUsZJ0VDfsayUjDVfLMg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 8, 2018 at 2:04 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This is harmless, but "val" isn't necessarily initialized if
> abx500_get_register_interruptible() fails.  I've re-arranged the code to
> just return an error code in that situation.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied!

Yours,
Linus Walleij
