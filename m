From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 02 Dec 2017 12:05:51 +0000
Subject: Re: [PATCH] gpio: gpio-stmpe: make various char arrays static const, shrinks object size
Message-Id: <CACRpkdbsvC0ziDN=L5PA0u3S2wVoOHkcuqYWAZknsAvOLyXs3g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171128182339.24579-1-colin.king@canonical.com>
In-Reply-To: <20171128182339.24579-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Nov 28, 2017 at 7:23 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate the read-only arrays edge_det_values, rise_values and
> fall_values on the stack but instead make them static and constify them.
> Makes the object code smaller by over 240 bytes:
>
> Before:
>    text    data     bss     dec     hex filename
>    9525    2520     192   12237    2fcd drivers/gpio/gpio-stmpe.o
>
> After:
>    text    data     bss     dec     hex filename
>    9025    2776     192   11993    2ed9 drivers/gpio/gpio-stmpe.o
>
> (gcc version 7.2.0 x86_64)
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
