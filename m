From: Leon Romanovsky <leon@kernel.org>
Date: Sun, 11 Aug 2019 09:56:57 +0000
Subject: Re: [PATCH] RDMA/core: Fix error code in stat_get_doit_qp()
Message-Id: <20190811095657.GG28049@mtr-leonro.mtl.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190809101311.GA17867@mwanda>
In-Reply-To: <20190809101311.GA17867@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Doug Ledford <dledford@redhat.com>, Mark Zhang <markz@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>, Parav Pandit <parav@mellanox.com>, Majd Dibbiny <majd@mellanox.com>, Steve Wise <swise@opengridcomputing.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 09, 2019 at 01:13:19PM +0300, Dan Carpenter wrote:
> We need to set the error codes on these paths.  Currently the only
> possible error code is -EMSGSIZE so that's what the patch uses.
>
> Fixes: 83c2c1fcbd08 ("RDMA/nldev: Allow get counter mode through RDMA netlink")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/core/nldev.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

Thanks,
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
