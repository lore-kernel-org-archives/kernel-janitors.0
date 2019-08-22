From: Leon Romanovsky <leon@kernel.org>
Date: Thu, 22 Aug 2019 15:50:01 +0000
Subject: Re: [PATCH net-next] net/mlx5e: Use PTR_ERR_OR_ZERO in mlx5e_tc_add_nic_flow()
Message-Id: <20190822155001.GG29433@mtr-leonro.mtl.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822065219.73945-1-yuehaibing@huawei.com>
In-Reply-To: <20190822065219.73945-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Saeed Mahameed <saeedm@mellanox.com>, davem@davemloft.net, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Aug 22, 2019 at 06:52:19AM +0000, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>

Thanks,
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
