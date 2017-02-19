From: Majd Dibbiny <majd@mellanox.com>
Date: Sun, 19 Feb 2017 19:54:07 +0000
Subject: Re: [PATCH 23/29] IB/mlx4: Improve size determinations in create_qp_common()
Message-Id: <EA4233BB-E615-411E-BC99-14D8A2A367EE@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>,<9b7e9f1c-ccf4-6de6-158f-cd9f86f5edb4@users.sourceforge.net>
In-Reply-To: <9b7e9f1c-ccf4-6de6-158f-cd9f86f5edb4-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Yishai Hadas <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


> On Feb 18, 2017, at 11:15 PM, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 18 Feb 2017 18:29:30 +0100
> 
> Replace the specification of two data structures by pointer dereferences
> as the parameter for the operator "sizeof" to make the corresponding size
> determinations a bit safer according to the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> drivers/infiniband/hw/mlx4/qp.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/mlx4/qp.c b/drivers/infiniband/hw/mlx4/qp.c
> index 11fec4a8fae5..cc7bd257a1fd 100644
> --- a/drivers/infiniband/hw/mlx4/qp.c
> +++ b/drivers/infiniband/hw/mlx4/qp.c
> @@ -691,14 +691,14 @@ static int create_qp_common(struct mlx4_ib_dev *dev, struct ib_pd *pd,
>        if (qp_type == MLX4_IB_QPT_SMI || qp_type == MLX4_IB_QPT_GSI ||
>            (qp_type & (MLX4_IB_QPT_PROXY_SMI | MLX4_IB_QPT_PROXY_SMI_OWNER |
>                MLX4_IB_QPT_PROXY_GSI | MLX4_IB_QPT_TUN_SMI_OWNER))) {
> -            sqp = kzalloc(sizeof (struct mlx4_ib_sqp), gfp);
> +            sqp = kzalloc(sizeof(*sqp), gfp);
>            if (!sqp)
>                return -ENOMEM;
>            qp = &sqp->qp;
>            qp->pri.vid = 0xFFFF;
>            qp->alt.vid = 0xFFFF;
>        } else {
> -            qp = kzalloc(sizeof (struct mlx4_ib_qp), gfp);
> +            qp = kzalloc(sizeof(*qp), gfp);
>            if (!qp)
>                return -ENOMEM;
>            qp->pri.vid = 0xFFFF;
> -- 
> 2.11.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
Thanks,
Reviewed-by: Majd Dibbiny
<majd@mellanox.com>

