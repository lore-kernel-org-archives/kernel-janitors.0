From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jun 2014 19:02:44 +0000
Subject: Re: [PATCH] usb: usb5303: make use of uninitialized err variable
Message-Id: <CAMuHMdVwhtkoy4m6LzF_EZ6aZneHzELEufw7DYkebZp7n7c=dg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401731125-19780-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1401731125-19780-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Goode <emilgoode@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@linaro.org>, Olof Johansson <olof@lixom.net>, Dongjin Kim <tobetter@gmail.com>, Julius Werner <jwerner@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, USB list <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Jun 2, 2014 at 7:45 PM, Emil Goode <emilgoode@gmail.com> wrote:
> The variable err is not initialized here, this patch uses it
> to store an eventual error value from devm_clk_get().
>
> Signed-off-by: Emil Goode <emilgoode@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
