From: Tariq Toukan <tariqt@mellanox.com>
Date: Sun, 03 Sep 2017 07:28:04 +0000
Subject: Re: [PATCH][next] net/mlx4_core: fix incorrect size allocation for dev->caps.spec_qps
Message-Id: <feef1bb3-8c86-0a05-05f5-f49d86dcf9e7@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170831170724.3747-1-colin.king@canonical.com>
In-Reply-To: <20170831170724.3747-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Tariq Toukan <tariqt-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On 31/08/2017 8:07 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The current allocation for dev->caps.spec_qps is for the size of the
> pointer and not the size of the actual  mlx4_spec_qps structure.  Fix
> this by using the correct size.   Also splint allocation over a few
> lines to make it cppcheck clean on overly wide lines.
> 
> Detected by CoverityScan, CID#1455222 ("Wrong sizeof argument")
> 
> Fixes: c73c8b1e47ca ("net/mlx4_core: Dynamically allocate structs at mlx4_slave_cap")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/net/ethernet/mellanox/mlx4/qp.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx4/qp.c b/drivers/net/ethernet/mellanox/mlx4/qp.c
> index b16fc441609e..728a2fb1f5c0 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/qp.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/qp.c
> @@ -845,8 +845,9 @@ int mlx4_init_qp_table(struct mlx4_dev *dev)
>   
>   		/* In mfunc, calculate proxy and tunnel qp offsets for the PF here,
>   		 * since the PF does not call mlx4_slave_caps */
> -		dev->caps.spec_qps = kcalloc(dev->caps.num_ports, sizeof(dev->caps.spec_qps), GFP_KERNEL);
> -
> +		dev->caps.spec_qps = kcalloc(dev->caps.num_ports,
> +					     sizeof(*dev->caps.spec_qps),
> +					     GFP_KERNEL);
>   		if (!dev->caps.spec_qps) {
>   			err = -ENOMEM;
>   			goto err_mem;
> 

Acked-by: Tariq Toukan <tariqt@mellanox.com>

Thanks!
