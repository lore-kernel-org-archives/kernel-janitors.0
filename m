From: David Miller <davem@davemloft.net>
Date: Tue, 30 Jun 2020 20:38:58 +0000
Subject: Re: [PATCH][next] net/mlx5e: fix memory leak of tls
Message-Id: <20200630.133858.836154523537769936.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200630151646.517757-1-colin.king@canonical.com>
In-Reply-To: <20200630151646.517757-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: borisp@mellanox.com, saeedm@mellanox.com, leon@kernel.org, kuba@kernel.org, tariqt@mellanox.com, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Jun 2020 16:16:46 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The error return path when create_singlethread_workqueue fails currently
> does not kfree tls and leads to a memory leak. Fix this by kfree'ing
> tls before returning -ENOMEM.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 1182f3659357 ("net/mlx5e: kTLS, Add kTLS RX HW offload support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
