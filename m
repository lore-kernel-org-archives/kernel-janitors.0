From: Kees Cook <keescook@chromium.org>
Date: Tue, 27 Jun 2017 23:47:03 +0000
Subject: Re: [PATCH 9/9] mfd: max8925-i2c: Drop unnecessary static
Message-Id: <CAGXu5jJdxyXtL09ps1o5LYVDvfqEbymAXz=wvQD6cysnvnacUA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr> <1493928654-18768-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1493928654-18768-10-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: Lee Jones <lee.jones@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>

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
>    2579     240      16    2835     b13 drivers/mfd/max8925-i2c.o
>
> after:
>    text    data     bss     dec     hex filename
>    2531     240       8    2779     adb drivers/mfd/max8925-i2c.o
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  drivers/mfd/max8925-i2c.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
> index 5c80aea..1006323 100644
> --- a/drivers/mfd/max8925-i2c.c
> +++ b/drivers/mfd/max8925-i2c.c
> @@ -151,7 +151,7 @@ static int max8925_probe(struct i2c_client *client,
>                                    const struct i2c_device_id *id)
>  {
>         struct max8925_platform_data *pdata = dev_get_platdata(&client->dev);
> -       static struct max8925_chip *chip;
> +       struct max8925_chip *chip;
>         struct device_node *node = client->dev.of_node;
>
>         if (node && !pdata) {
>

Acked-by: Kees Cook <keescook@chromium.org>

Kernel janitors or Andrew, can you pick this up?

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
