From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 24 Mar 2020 22:49:32 +0000
Subject: Re: [PATCH] IB/mlx5: Fix a NULL vs IS_ERR() check
Message-Id: <20200324224932.GA28435@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200320132641.GF95012@mwanda>
In-Reply-To: <20200320132641.GF95012@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Leon Romanovsky <leon@kernel.org>, Yishai Hadas <yishaih@mellanox.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 20, 2020 at 04:26:41PM +0300, Dan Carpenter wrote:
> The kzalloc() function returns NULL, not error pointers.
> 
> Fixes: 30f2fe40c72b ("IB/mlx5: Introduce UAPIs to manage packet pacing")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Leon Romanovsky <leonro@mellanox.com>
> ---
>  drivers/infiniband/hw/mlx5/qos.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to for-next, thanks

Jason
