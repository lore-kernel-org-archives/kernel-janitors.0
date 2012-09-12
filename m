From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Sep 2012 06:09:52 +0000
Subject: Re: pcf857x_probe() error: we previously assumed 'pdata' could be null (see line 277)
Message-Id: <CACRpkdbAvG+6QhYJ3Z8i6Zu1fjWEXv5nf6SFWjdVy6Brd3qukQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120912031131.GA22076@localhost>
In-Reply-To: <20120912031131.GA22076@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 12, 2012 at 5:11 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:

> FYI, there are new smatch warnings on
>
> commit 6e20a0a429bd4dc07d6de16d9c247270e04e4aa0 gpio: pcf857x: enable gpio_to_irq() support
>
> drivers/gpio/gpio-pcf857x.c:288 pcf857x_probe() error: we previously assumed 'pdata' could be null (see line 277)
> drivers/gpio/gpio-pcf857x.c:364 pcf857x_probe() warn: variable dereferenced before check 'pdata' (see line 292)
> drivers/gpio/gpio-pcf857x.c:421 pcf857x_remove() error: we previously assumed 'pdata' could be null (see line 410)

OK Kuninoiri can you have a look at this and see if you can
fix it up?

Yours,
Linus Walleij
