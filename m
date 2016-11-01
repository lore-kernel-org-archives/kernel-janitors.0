From: Matan Barak <matanb@mellanox.com>
Date: Tue, 01 Nov 2016 09:38:18 +0000
Subject: Re: [PATCH] net/mlx5: Simplify a test
Message-Id: <025cb4e1-f5e8-8bc9-0d4f-3ee8f8d1bb5d@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161101071053.12486-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161101071053.12486-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, leonro@mellanox.com
Cc: netdev@vger.kernel.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01/11/2016 09:10, Christophe JAILLET wrote:
> 'create_root_ns()' does not return an error pointer, so the test can be
> simplified to be more consistent.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/fs_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
> index 904853f9cf7a..330955f6badc 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
> @@ -1833,7 +1833,7 @@ static int init_root_ns(struct mlx5_flow_steering *steering)
>  {
>
>  	steering->root_ns = create_root_ns(steering, FS_FT_NIC_RX);
> -	if (IS_ERR_OR_NULL(steering->root_ns))
> +	if (!steering->root_ns)
>  		goto cleanup;
>
>  	if (init_root_tree(steering, &root_fs, &steering->root_ns->ns.node))
>

Thanks.
Acked-by: Matan Barak <matanb@mellanox.com>

