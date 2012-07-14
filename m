From: "devendra.aaru" <devendra.aaru@gmail.com>
Date: Sat, 14 Jul 2012 07:31:45 +0000
Subject: Re: [PATCH] pps: Return PTR_ERR on error in device_create
Message-Id: <CAHdPZaNQ50Y33Ap7_-9a-brQnOmxOy49GMjYnhHBxeNHjCjgOQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1338579809-11637-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1338579809-11637-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Goode <emilgoode@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <lasaine@lvk.cs.msu.su>, giometti@enneenne.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

CCing Andrew Morton, and Alexander Gordeev based on git log drivers/pps/pps.c
Pardon me if i made wrong

On Sat, Jun 2, 2012 at 1:28 AM, Emil Goode <emilgoode@gmail.com> wrote:
> We should return PTR_ERR if the call to the
> device_create function fails.
> Without this patch we instead return the value
> from a successful call to cdev_add if the call
> to device_create fails.
>
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
>  drivers/pps/pps.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pps/pps.c b/drivers/pps/pps.c
> index 98fbe62..e771487 100644
> --- a/drivers/pps/pps.c
> +++ b/drivers/pps/pps.c
> @@ -327,8 +327,10 @@ int pps_register_cdev(struct pps_device *pps)
>         }
>         pps->dev = device_create(pps_class, pps->info.dev, devt, pps,
>                                                         "pps%d", pps->id);
> -       if (IS_ERR(pps->dev))
> +       if (IS_ERR(pps->dev)) {
> +               err = PTR_ERR(pps->dev);
>                 goto del_cdev;
> +       }
>
>         pps->dev->release = pps_device_destruct;
>
> --
> 1.7.10
>
Acked-By: Devendra Naga <devendra.aaru@gmail.com>

> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
