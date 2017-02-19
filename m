From: Majd Dibbiny <majd@mellanox.com>
Date: Sun, 19 Feb 2017 19:42:27 +0000
Subject: Re: [PATCH 19/29] IB/mlx4: Delete an unnecessary variable assignment in mlx4_ib_add()
Message-Id: <4B161E78-28BC-4A7C-9A77-E083A3FDB8C1@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>,<3f4e69c8-a030-fb75-26bb-e14208c141c5@users.sourceforge.net>
In-Reply-To: <3f4e69c8-a030-fb75-26bb-e14208c141c5-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Yishai Hadas <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


> On Feb 18, 2017, at 11:09 PM, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 18 Feb 2017 16:00:28 +0100
> 
> Delete an assignment for the local variable "num_ports" at the beginning
> because it was initialised with the same value.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> drivers/infiniband/hw/mlx4/main.c | 2 --
> 1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/mlx4/main.c b/drivers/infiniband/hw/mlx4/main.c
> index 4e08e4d57181..21b88d5ceda4 100644
> --- a/drivers/infiniband/hw/mlx4/main.c
> +++ b/drivers/infiniband/hw/mlx4/main.c
> @@ -2615,8 +2615,6 @@ static void *mlx4_ib_add(struct mlx4_dev *dev)
>    struct counter_index *new_counter_index;
> 
>    pr_info_once("%s", mlx4_ib_version);
> -
> -    num_ports = 0;
>    mlx4_foreach_ib_transport_port(i, dev)
>        num_ports++;
> 
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

