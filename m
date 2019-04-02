From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 02 Apr 2019 23:02:08 +0000
Subject: Re: [PATCH] soc/fsl/qe: Fix an error code in qe_pin_request()
Message-Id: <CADRPPNS0XWqbkUwgpUy2Tkc6NvtZc9Yta=V9aw-WjzrY70JZ4Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190328141841.GN32590@kadam>
In-Reply-To: <20190328141841.GN32590@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kernel-janitors@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>

On Thu, Mar 28, 2019 at 9:21 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We forgot to set "err" on this error path.
>
> Fixes: 1a2d397a6eb5 ("gpio/powerpc: Eliminate duplication of of_get_named_gpio_flags()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to fix branch.  Thanks.

Regards,
Leo
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
> 2.17.1
>
