From: David Miller <davem@davemloft.net>
Date: Mon, 28 Sep 2020 19:29:52 +0000
Subject: Re: [PATCH net-next] net/mlx5e: Fix a use after free on error in mlx5_tc_ct_shared_counter_get()
Message-Id: <20200928.122952.688062131867166420.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928090556.GA377727@mwanda>
In-Reply-To: <20200928090556.GA377727@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: saeedm@nvidia.com, leon@kernel.org, kuba@kernel.org, roid@mellanox.com, ozsh@mellanox.com, paulb@mellanox.com, elibr@mellanox.com, lariel@nvidia.com, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Sep 2020 12:05:56 +0300

> This code frees "shared_counter" and then dereferences on the next line
> to get the error code.
> 
> Fixes: 1edae2335adf ("net/mlx5e: CT: Use the same counter for both directions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Saeed, I assume you will pick this up.

Thank you.
