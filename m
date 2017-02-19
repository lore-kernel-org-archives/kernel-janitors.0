From: Majd Dibbiny <majd@mellanox.com>
Date: Sun, 19 Feb 2017 17:36:40 +0000
Subject: Re: [PATCH 17/29] IB/mlx4: Improve another size determination in mlx4_ib_add()
Message-Id: <A603A37F-86E8-4FF1-8915-6B190805B4BE@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>,<2269d63f-433d-b62b-06f2-38a4d9d466f4@users.sourceforge.net>
In-Reply-To: <2269d63f-433d-b62b-06f2-38a4d9d466f4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Leon Romanovsky <leonro@mellanox.com>, Matan Barak <matanb@mellanox.com>, Sean Hefty <sean.hefty@intel.com>, Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>


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