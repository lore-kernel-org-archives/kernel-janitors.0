From: David Miller <davem@davemloft.net>
Date: Sat, 24 Aug 2019 21:22:58 +0000
Subject: Re: [PATCH net-next] net/mlx5e: Use PTR_ERR_OR_ZERO in mlx5e_tc_add_nic_flow()
Message-Id: <20190824.142258.1684009361732174753.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822065219.73945-1-yuehaibing@huawei.com>
In-Reply-To: <20190822065219.73945-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: saeedm@mellanox.com, leon@kernel.org, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 22 Aug 2019 06:52:19 +0000

> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Saeed, please pick this up if you haven't already.

Thank you.
