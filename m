From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Wed, 14 Aug 2013 09:28:11 +0000
Subject: Re: [PATCH 17/29] drivers/rtc: simplify use of devm_ioremap_resource
Message-Id: <CAOh2x=kv4AdNZnu=6OhoyHBP6Ab2M=PK7+0nEmh4JY2ZCeVRMQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
	<1376471493-22215-18-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-18-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Alessandro Zummo <a.zummo@towertech.it>, kernel-janitors@vger.kernel.org, rtc-linux@googlegroups.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, spear-devel <spear-devel@list.st.com>

On Wed, Aug 14, 2013 at 2:41 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Remove unneeded error handling on the result of a call to
> platform_get_resource when the value is passed to devm_ioremap_resource.
>
> Move the call to platform_get_resource adjacent to the call to
> devm_ioremap_resource to make the connection between them more clear.
>
> A simplified version of the semantic patch that makes this change is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression pdev,res,n,e,e1;
> expression ret != 0;
> identifier l;
> @@
>
> - res = platform_get_resource(pdev, IORESOURCE_MEM, n);
>   ... when != res
> - if (res = NULL) { ... \(goto l;\|return ret;\) }
>   ... when != res
> + res = platform_get_resource(pdev, IORESOURCE_MEM, n);
>   e = devm_ioremap_resource(e1, res);
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---

>  drivers/rtc/rtc-spear.c  |    7 +------
>  3 files changed, 3 insertions(+), 12 deletions(-)

For SPEAr:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>


> diff --git a/drivers/rtc/rtc-spear.c b/drivers/rtc/rtc-spear.c
> index c492cf0..6470641 100644
> --- a/drivers/rtc/rtc-spear.c
> +++ b/drivers/rtc/rtc-spear.c
> @@ -358,12 +358,6 @@ static int spear_rtc_probe(struct platform_device *pdev)
>         int status = 0;
>         int irq;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(&pdev->dev, "no resource defined\n");
> -               return -EBUSY;
> -       }
> -
>         config = devm_kzalloc(&pdev->dev, sizeof(*config), GFP_KERNEL);
>         if (!config) {
>                 dev_err(&pdev->dev, "out of memory\n");
> @@ -385,6 +379,7 @@ static int spear_rtc_probe(struct platform_device *pdev)
>                 return status;
>         }
>
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         config->ioaddr = devm_ioremap_resource(&pdev->dev, res);
>         if (IS_ERR(config->ioaddr))
>                 return PTR_ERR(config->ioaddr);
