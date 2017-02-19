From: Majd Dibbiny <majd@mellanox.com>
Date: Sun, 19 Feb 2017 17:36:41 +0000
Subject: Re: [PATCH 17/29] IB/mlx4: Improve another size determination in mlx4_ib_add()
Message-Id: <057FDC40-F12C-44E8-8661-92024B0C86A0@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>,<2269d63f-433d-b62b-06f2-38a4d9d466f4@users.sourceforge.net>
In-Reply-To: <2269d63f-433d-b62b-06f2-38a4d9d466f4-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Yishai Hadas <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


> On Feb 18, 2017, at 11:06 PM, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 18 Feb 2017 15:43:54 +0100
> 
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> drivers/infiniband/hw/mlx4/main.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/mlx4/main.c b/drivers/infiniband/hw/mlx4/main.c
> index b78f17623121..f3194f2a6e62 100644
> --- a/drivers/infiniband/hw/mlx4/main.c
> +++ b/drivers/infiniband/hw/mlx4/main.c
> @@ -2825,9 +2825,8 @@ static void *mlx4_ib_add(struct mlx4_dev *dev)
>    }
>    if (mlx4_is_bonded(dev))
>        for (i = 1; i < ibdev->num_ports ; ++i) {
> -            new_counter_index =
> -                    kmalloc(sizeof(struct counter_index),
> -                        GFP_KERNEL);
> +            new_counter_index = kmalloc(sizeof(*new_counter_index),
> +                            GFP_KERNEL);
>            if (!new_counter_index)
>                goto err_counter;
>            new_counter_index->index = counter_index;
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