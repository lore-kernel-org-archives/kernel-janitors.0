From: Eli Cohen <eli@mellanox.com>
Date: Sun, 09 Aug 2020 06:03:47 +0000
Subject: Re: [PATCH][next] vdpa/mlx5: fix memory allocation failure checks
Message-Id: <20200809060347.GA48369@mtl-vdi-166.wap.labs.mlnx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200806160828.90463-1-colin.king@canonical.com>
In-Reply-To: <20200806160828.90463-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@mellanox.com>, virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Aug 06, 2020 at 05:08:28PM +0100, Colin King wrote:
Acked by: Eli Cohen <eli@mellanox.com>

> From: Colin Ian King <colin.king@canonical.com>
> 
> The memory allocation failure checking for in and out is currently
> checking if the pointers are valid rather than the contents of what
> they point to. Hence the null check on failed memory allocations is
> incorrect.  Fix this by adding the missing indirection in the check.
> Also for the default case, just set the *in and *out to null as
> these don't have any thing allocated to kfree. Finally remove the
> redundant *in and *out check as these have been already done on each
> allocation in the case statement.
> 
> Addresses-Coverity: ("Null pointer dereference")
> Fixes: 1a86b377aa21 ("vdpa/mlx5: Add VDPA driver for supported mlx5 devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/vdpa/mlx5/net/mlx5_vnet.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> index 3ec44a4f0e45..55bc58e1dae9 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -867,7 +867,7 @@ static void alloc_inout(struct mlx5_vdpa_net *ndev, int cmd, void **in, int *inl
>  		*outlen = MLX5_ST_SZ_BYTES(qp_2rst_out);
>  		*in = kzalloc(*inlen, GFP_KERNEL);
>  		*out = kzalloc(*outlen, GFP_KERNEL);
> -		if (!in || !out)
> +		if (!*in || !*out)
>  			goto outerr;
>  
>  		MLX5_SET(qp_2rst_in, *in, opcode, cmd);
> @@ -879,7 +879,7 @@ static void alloc_inout(struct mlx5_vdpa_net *ndev, int cmd, void **in, int *inl
>  		*outlen = MLX5_ST_SZ_BYTES(rst2init_qp_out);
>  		*in = kzalloc(*inlen, GFP_KERNEL);
>  		*out = kzalloc(MLX5_ST_SZ_BYTES(rst2init_qp_out), GFP_KERNEL);
> -		if (!in || !out)
> +		if (!*in || !*out)
>  			goto outerr;
>  
>  		MLX5_SET(rst2init_qp_in, *in, opcode, cmd);
> @@ -896,7 +896,7 @@ static void alloc_inout(struct mlx5_vdpa_net *ndev, int cmd, void **in, int *inl
>  		*outlen = MLX5_ST_SZ_BYTES(init2rtr_qp_out);
>  		*in = kzalloc(*inlen, GFP_KERNEL);
>  		*out = kzalloc(MLX5_ST_SZ_BYTES(init2rtr_qp_out), GFP_KERNEL);
> -		if (!in || !out)
> +		if (!*in || !*out)
>  			goto outerr;
>  
>  		MLX5_SET(init2rtr_qp_in, *in, opcode, cmd);
> @@ -914,7 +914,7 @@ static void alloc_inout(struct mlx5_vdpa_net *ndev, int cmd, void **in, int *inl
>  		*outlen = MLX5_ST_SZ_BYTES(rtr2rts_qp_out);
>  		*in = kzalloc(*inlen, GFP_KERNEL);
>  		*out = kzalloc(MLX5_ST_SZ_BYTES(rtr2rts_qp_out), GFP_KERNEL);
> -		if (!in || !out)
> +		if (!*in || !*out)
>  			goto outerr;
>  
>  		MLX5_SET(rtr2rts_qp_in, *in, opcode, cmd);
> @@ -927,16 +927,15 @@ static void alloc_inout(struct mlx5_vdpa_net *ndev, int cmd, void **in, int *inl
>  		MLX5_SET(qpc, qpc, rnr_retry, 7);
>  		break;
>  	default:
> -		goto outerr;
> +		goto outerr_nullify;
>  	}
> -	if (!*in || !*out)
> -		goto outerr;
>  
>  	return;
>  
>  outerr:
>  	kfree(*in);
>  	kfree(*out);
> +outerr_nullify:
>  	*in = NULL;
>  	*out = NULL;
>  }
> -- 
> 2.27.0
> 
