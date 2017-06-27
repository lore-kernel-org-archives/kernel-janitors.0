From: Kees Cook <keescook@chromium.org>
Date: Tue, 27 Jun 2017 23:45:38 +0000
Subject: Re: [PATCH 8/9] clocksource/drivers/fttmr010: Drop unnecessary static
Message-Id: <CAGXu5jJr=rweqWR01X1u-_vfq3wwYe6rDAoKJTzSMmZO1biznA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr> <1493928654-18768-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1493928654-18768-9-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>

On Thu, May 4, 2017 at 1:10 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> Drop static on a local variable, when the variable is initialized before
> any use, on every possible execution path through the function.  The static
> has no benefit, and dropping it reduces the code size.
>
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @bad exists@
> position p;
> identifier x;
> type T;
> @@
>
> static T x@p;
> ...
> x = <+...x...+>
>
> @@
> identifier x;
> expression e;
> type T;
> position p != bad.p;
> @@
>
> -static
>  T x@p;
>  ... when != x
>      when strict
> ?x = e;
> // </smpl>
>
> The change in code size is indicates by the following output from the size
> command.
>
> before:
>    text    data     bss     dec     hex filename
>    1777    4352      20    6149    1805 drivers/clocksource/timer-fttmr010.o
>
> after:
>    text    data     bss     dec     hex filename
>    1770    4352      12    6134    17f6 drivers/clocksource/timer-fttmr010.o
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  drivers/clocksource/timer-fttmr010.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
> index b4a6f1e..055c65e 100644
> --- a/drivers/clocksource/timer-fttmr010.c
> +++ b/drivers/clocksource/timer-fttmr010.c
> @@ -263,7 +263,7 @@ static int __init fttmr010_timer_of_init(struct device_node *np)
>
>  static int __init gemini_timer_of_init(struct device_node *np)
>  {
> -       static struct regmap *map;
> +       struct regmap *map;
>         int ret;
>         u32 val;
>
>

Acked-by: Kees Cook <keescook@chromium.org>

Kernel janitors or Andrew, can you pick this up?

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
