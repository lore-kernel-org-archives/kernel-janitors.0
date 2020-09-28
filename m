From: Leon Romanovsky <leon@kernel.org>
Date: Mon, 28 Sep 2020 11:55:43 +0000
Subject: Re: [PATCH net-next] net/mlx5e: Fix a use after free on error in mlx5_tc_ct_shared_counter_get()
Message-Id: <20200928115543.GD3094@unreal>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928090556.GA377727@mwanda>
In-Reply-To: <20200928090556.GA377727@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Roi Dayan <roid@mellanox.com>, Oz Shlomo <ozsh@mellanox.com>, Paul Blakey <paulb@mellanox.com>, Eli Britstein <elibr@mellanox.com>, Ariel Levkovich <lariel@nvidia.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Sep 28, 2020 at 12:05:56PM +0300, Dan Carpenter wrote:
> This code frees "shared_counter" and then dereferences on the next line
> to get the error code.
>
> Fixes: 1edae2335adf ("net/mlx5e: CT: Use the same counter for both directions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
