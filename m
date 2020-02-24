From: Leon Romanovsky <leon@kernel.org>
Date: Mon, 24 Feb 2020 10:52:33 +0000
Subject: Re: [PATCH] net/mlx5e: Fix error code in mlx5e_fec_in_caps()
Message-Id: <20200224105233.GB468372@unreal>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200224065557.d23b4yd46kjnzfya@kili.mountain>
In-Reply-To: <20200224065557.d23b4yd46kjnzfya@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Saeed Mahameed <saeedm@mellanox.com>, Aya Levin <ayal@mellanox.com>, Eran Ben Elisha <eranbe@mellanox.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Feb 24, 2020 at 09:55:57AM +0300, Dan Carpenter wrote:
> The mlx5e_fec_in_caps() function is type bool so these negative returns
> become "return true;" when they should be "return false;"
>
> Fixes: 2132b71f78d2 ("net/mlx5e: Advertise globaly supported FEC modes")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en/port.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Thanks,
Acked-by: Leon Romanovsky <leonro@mellanox.com>
