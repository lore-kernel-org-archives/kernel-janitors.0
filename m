From: David Miller <davem@davemloft.net>
Date: Wed, 19 Jun 2019 02:30:23 +0000
Subject: Re: [PATCH][next] net/mlx5: add missing void argument to function mlx5_devlink_alloc
Message-Id: <20190618.223023.244389297657538568.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190618151510.18672-1-colin.king@canonical.com>
In-Reply-To: <20190618151510.18672-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: saeedm@mellanox.com, leon@kernel.org, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 18 Jun 2019 16:15:10 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Function mlx5_devlink_alloc is missing a void argument, add it
> to clean up the non-ANSI function declaration.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
