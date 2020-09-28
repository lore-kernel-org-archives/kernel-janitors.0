From: Saeed Mahameed <saeed@kernel.org>
Date: Mon, 28 Sep 2020 23:21:47 +0000
Subject: Re: [PATCH net-next] net/mlx5e: Fix a use after free on error in mlx5_tc_ct_shared_counter_get()
Message-Id: <1017ab3724b83818c03dfa7661b3f31827a7f62f.camel@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928090556.GA377727@mwanda>
         <20200928.122952.688062131867166420.davem@davemloft.net>
In-Reply-To: <20200928.122952.688062131867166420.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, dan.carpenter@oracle.com
Cc: leon@kernel.org, kuba@kernel.org, roid@mellanox.com, ozsh@mellanox.com, paulb@mellanox.com, elibr@mellanox.com, lariel@nvidia.com, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2020-09-28 at 12:29 -0700, David Miller wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Mon, 28 Sep 2020 12:05:56 +0300
> 
> > This code frees "shared_counter" and then dereferences on the next
> line
> > to get the error code.
> > 
> > Fixes: 1edae2335adf ("net/mlx5e: CT: Use the same counter for both
> directions")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Saeed, I assume you will pick this up.
> 
> Thank you.

Applied to net-next-mlx5.

Thanks
