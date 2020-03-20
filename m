From: Leon Romanovsky <leon@kernel.org>
Date: Fri, 20 Mar 2020 14:33:00 +0000
Subject: Re: [PATCH net-next] net/mlx5e: Fix actions_match_supported() return
Message-Id: <20200320143300.GH514123@unreal>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200320132305.GB95012@mwanda>
In-Reply-To: <20200320132305.GB95012@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Saeed Mahameed <saeedm@mellanox.com>, Paul Blakey <paulb@mellanox.com>, "David S. Miller" <davem@davemloft.net>, Roi Dayan <roid@mellanox.com>, Oz Shlomo <ozsh@mellanox.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 20, 2020 at 04:23:05PM +0300, Dan Carpenter wrote:
> The actions_match_supported() function returns a bool, true for success
> and false for failure.  This error path is returning a negative which
> is cast to true but it should return false.
>
> Fixes: 4c3844d9e97e ("net/mlx5e: CT: Introduce connection tracking")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thanks,
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
