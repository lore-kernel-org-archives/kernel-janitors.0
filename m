From: Saeed Mahameed <saeed@kernel.org>
Date: Tue, 06 Oct 2020 23:20:57 +0000
Subject: Re: [PATCH][next] net/mlx5: Fix uininitialized pointer read on pointer attr
Message-Id: <bc6d5d6ad5b3254d8e14997341995036f56e374d.camel@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201006181243.546661-1-colin.king@canonical.com>
In-Reply-To: <20201006181243.546661-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Leon Romanovsky <leon@kernel.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2020-10-06 at 19:12 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the error exit path err_free kfree's attr. In the case
> where
> flow and parse_attr failed to be allocated this return path will free
> the uninitialized pointer attr, which is not correct.  In the other
> case where attr fails to allocate attr does not need to be freed. So
> in both error exits via err_free attr should not be freed, so remove
> it.
> 
> Addresses-Coverity: ("Uninitialized pointer read")
> Fixes: ff7ea04ad579 ("net/mlx5e: Fix potential null pointer
> dereference")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> index a0c356987e1a..e3a968e9e2a0 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> @@ -4569,7 +4569,6 @@ mlx5e_alloc_flow(struct mlx5e_priv *priv, int
> attr_size,
>  err_free:
>  	kfree(flow);
>  	kvfree(parse_attr);
> -	kfree(attr);
>  	return err;
>  }
>  

Applied to net-next-mlx5,

Thanks.
