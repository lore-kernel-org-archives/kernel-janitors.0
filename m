From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 07 Mar 2018 03:20:25 +0000
Subject: Re: [PATCH] IB/mlx5: Fix an error code in __mlx5_ib_modify_qp()
Message-Id: <20180307032025.GD24315@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180306100031.GB10474@mwanda>
In-Reply-To: <20180306100031.GB10474@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 06, 2018 at 01:00:31PM +0300, Dan Carpenter wrote:
> "err" is either zero or possibly uninitialized here.  It should be
> -EINVAL.
> 
> Fixes: 427c1e7bcd7e ("{IB, net}/mlx5: Move the modify QP operation table to mlx5_ib")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Leon Romanovsky <leonro@mellanox.com>
> 
> diff --git a/drivers/infiniband/hw/mlx5/qp.c b/drivers/infiniband/hw/mlx5/qp.c
> index 90bb96292fc4..f9a1174ad7fa 100644
> +++ b/drivers/infiniband/hw/mlx5/qp.c
> @@ -3118,8 +3118,10 @@ static int __mlx5_ib_modify_qp(struct ib_qp *ibqp,
>  	mlx5_new = to_mlx5_state(new_state);
>  
>  	if (mlx5_cur >= MLX5_QP_NUM_STATE || mlx5_new >= MLX5_QP_NUM_STATE ||
> -	    !optab[mlx5_cur][mlx5_new])
> +	    !optab[mlx5_cur][mlx5_new]) {
> +		err = -EINVAL;
>  		goto out;
> +	}
>  
>  	op = optab[mlx5_cur][mlx5_new];
>  	optpar = ib_mask_to_mlx5_opt(attr_mask);

I applied this by hand to for-rc due to context changes

Thanks,
Jason
