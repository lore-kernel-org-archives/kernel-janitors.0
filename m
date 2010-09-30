From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Sep 2010 19:41:43 +0000
Subject: Re: [PATCH 14/14] zorro: fix device_register() error handling
Message-Id: <AANLkTik9amOXStCu=MJdV7BsYWUbShFDUH1iM0DMT0M8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284900921-24814-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1284900921-24814-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 19, 2010 at 14:55, Vasiliy Kulikov <segooon@gmail.com> wrote:
> If device_register() fails then call put_device().
> See comment to device_register.
>
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Thanks, applied to m68k tree, queued for 2.6.37.

> ---
>  I cannot compile this driver, so it is not tested at all.
>
>  drivers/zorro/zorro.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/zorro/zorro.c b/drivers/zorro/zorro.c
> index 6455f3a..e0c2807 100644
> --- a/drivers/zorro/zorro.c
> +++ b/drivers/zorro/zorro.c
> @@ -142,6 +142,7 @@ static int __init amiga_zorro_probe(struct platform_device *pdev)
>        error = device_register(&bus->dev);
>        if (error) {
>                pr_err("Zorro: Error registering zorro_bus\n");
> +               put_device(&bus->dev);
>                kfree(bus);
>                return error;
>        }
> @@ -175,6 +176,7 @@ static int __init amiga_zorro_probe(struct platform_device *pdev)
>                if (error) {
>                        dev_err(&bus->dev, "Error registering device %s\n",
>                                z->name);
> +                       put_device(&z->dev);
>                        continue;
>                }
>                error = zorro_create_sysfs_dev_files(z);
> --
> 1.7.0.4

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
