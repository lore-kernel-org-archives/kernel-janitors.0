From: Majd Dibbiny <majd@mellanox.com>
Date: Sun, 19 Feb 2017 17:06:25 +0000
Subject: Re: [PATCH 01/29] IB/mlx4: Use kcalloc() in mlx4_ib_alloc_pv_bufs()
Message-Id: <B11341F8-7B7C-4BE5-9F87-C6C10A117F9C@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>
 <e2a30e40-a7ad-585b-a694-ab1e9bd532c2@users.sourceforge.net>
In-Reply-To: <e2a30e40-a7ad-585b-a694-ab1e9bd532c2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Leon Romanovsky <leonro@mellanox.com>, Matan Barak <matanb@mellanox.com>, Sean Hefty <sean.hefty@intel.com>, Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>


> On Feb 18, 2017, at 10:55 PM, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 17 Feb 2017 20:00:34 +0100
> 
> * A multiplication for the size determination of a memory allocation
>  indicated that an array data structure should be processed.
>  Thus use the corresponding function "kcalloc".
> 
>  This issue was detected by using the Coccinelle software.
> 
> * Replace the specification of a data structure by a pointer dereference
>  to make the corresponding size determination a bit safer according to
>  the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> drivers/infiniband/hw/mlx4/mad.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/mlx4/mad.c b/drivers/infiniband/hw/mlx4/mad.c
> index db564ccc0f92..61bd81baeb29 100644
> --- a/drivers/infiniband/hw/mlx4/mad.c
> +++ b/drivers/infiniband/hw/mlx4/mad.c
> @@ -1600,8 +1600,8 @@ static int mlx4_ib_alloc_pv_bufs(struct mlx4_ib_demux_pv_ctx *ctx,
>        return -EINVAL;
> 
>    tun_qp = &ctx->qp[qp_type];
> -
> -    tun_qp->ring = kzalloc(sizeof (struct mlx4_ib_buf) * MLX4_NUM_TUNNEL_BUFS,
> +    tun_qp->ring = kcalloc(MLX4_NUM_TUNNEL_BUFS,
> +                   sizeof(*tun_qp->ring),
>                   GFP_KERNEL);
>    if (!tun_qp->ring)
>        return -ENOMEM;
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