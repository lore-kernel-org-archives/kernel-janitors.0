From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Jul 2017 10:41:43 +0000
Subject: Re: [PATCH] mmc: atmel-mci: add missing of_node_put
Message-Id: <CAPDyKFrMAQeRZ5_kQdh8+Ux9jyATtD-AkFztv=td-snvPv-qSQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1500136061-12135-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1500136061-12135-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, kernel-janitors@vger.kernel.org, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 15 July 2017 at 18:27, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> for_each_child_of_node performs an of_node_get on each iteration, so a
> break out the loop requires an of_node_put.
>
> The semantic patch that fixes this problem is as follows
> (http://coccinelle.lip6.fr):
>
> // <smpl>
> @@
> local idexpression n;
> expression e,e1;
> iterator name for_each_child_of_node;
> @@
>
>  for_each_child_of_node(e1,n) {
>    ...
> (
>    of_node_put(n);
> |
>    e = n
> |
> +  of_node_put(n);
> ?  break;
> )
>    ...
>  }
> ... when != n
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks, applied for next!

Kind regards
Uffe

>
> ---
>  drivers/mmc/host/atmel-mci.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff -u -p a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -673,6 +673,7 @@ atmci_of_init(struct platform_device *pd
>                 if (slot_id >= ATMCI_MAX_NR_SLOTS) {
>                         dev_warn(&pdev->dev, "can't have more than %d slots\n",
>                                  ATMCI_MAX_NR_SLOTS);
> +                       of_node_put(cnp);
>                         break;
>                 }
>
>
