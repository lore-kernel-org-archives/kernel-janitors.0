From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 03 May 2019 18:45:07 +0000
Subject: Re: [PATCH] soc: fsl: qe: gpio: Fix an error code in qe_pin_request()
Message-Id: <CADRPPNTGovYXL8vo7B6d73xu5BzpZBJLV=sGXK9HXrad-3HMeg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503131551.GB1236@mwanda>
In-Reply-To: <20190503131551.GB1236@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kernel-janitors@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>

On Fri, May 3, 2019 at 8:19 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There was a missing error code in this path.  It meant that we returned
> ERR_PTR(0) which is NULL and would result in a NULL dereference in the
> caller.

Thanks Dan.  An early version of this patch has been included in a
pending pull request to arm-soc.
https://lkml.org/lkml/2019/5/1/506


>
> Fixes: 1a2d397a6eb5 ("gpio/powerpc: Eliminate duplication of of_get_named_gpio_flags()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/fsl/qe/gpio.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index 819bed0f5667..51b3a47b5a55 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -179,8 +179,10 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
>         if (err < 0)
>                 goto err0;
>         gc = gpio_to_chip(err);
> -       if (WARN_ON(!gc))
> +       if (WARN_ON(!gc)) {
> +               err = -ENODEV;
>                 goto err0;
> +       }
>
>         if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
>                 pr_debug("%s: tried to get a non-qe pin\n", __func__);
> --
> 2.18.0
>
