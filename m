From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2017 14:19:30 +0000
Subject: Re: [PATCH] pinctrl: uniphier: make arrays static, reduces object code size
Message-Id: <CACRpkdZXPJEjQMfCekdXOCgRKwiZ8mv9wwskfuz8EgxXJyGmAA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170912112124.1143-1-colin.king@canonical.com>
In-Reply-To: <20170912112124.1143-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Tue, Sep 12, 2017 at 1:21 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate const arrays on the stack, instead make them
> static.  Makes the object code smaller nearly 1000 bytes. Also
> line break wide lines to avoid checkpatch warnings.
>
> Before:
>    text    data     bss     dec     hex filename
>   13112    1996       0   15108    3b04 pinctrl-uniphier-core.o
>
> After:
>    text    data     bss     dec     hex filename
>   11642    2476       0   14118    3726 pinctrl-uniphier-core.o
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied with Masahiro's ACK.

Yours,
Linus Walleij
