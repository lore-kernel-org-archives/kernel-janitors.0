From: Tariq Toukan <tariqt@mellanox.com>
Date: Sun, 03 Sep 2017 07:19:52 +0000
Subject: Re: [PATCH][next] net/mlx4_core: fix memory leaks on error exit path
Message-Id: <1e838306-09f4-b3dc-18e2-437a17f7c927@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170831163053.2349-1-colin.king@canonical.com>
In-Reply-To: <20170831163053.2349-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Tariq Toukan <tariqt@mellanox.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 31/08/2017 7:30 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The structures hca_param and func_cap are not being kfree'd on an error
> exit path causing two memory leaks. Fix this by jumping to the existing
> free memory error exit path.
> 
> Detected by CoverityScan, CID#1455219, CID#1455224 ("Resource Leak")
> 
> Fixes: c73c8b1e47ca ("net/mlx4_core: Dynamically allocate structs at mlx4_slave_cap")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/net/ethernet/mellanox/mlx4/main.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx4/main.c b/drivers/net/ethernet/mellanox/mlx4/main.c
> index 1c92101b3ec2..d46f3283ec36 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/main.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/main.c
> @@ -977,7 +977,8 @@ static int mlx4_slave_cap(struct mlx4_dev *dev)
>   	if (dev->caps.num_ports > MLX4_MAX_PORTS) {
>   		mlx4_err(dev, "HCA has %d ports, but we only support %d, aborting\n",
>   			 dev->caps.num_ports, MLX4_MAX_PORTS);
> -		return -ENODEV;
> +		err = -ENODEV;
> +		goto free_mem;
>   	}
>   
>   	mlx4_replace_zero_macs(dev);
> 

Acked-by: Tariq Toukan <tariqt@mellanox.com>

Thanks Colin!
