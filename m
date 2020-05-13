From: Leon Romanovsky <leon@kernel.org>
Date: Wed, 13 May 2020 10:00:31 +0000
Subject: Re: [PATCH] RDMA/mlx5: Fix query_srq_cmd() function
Message-Id: <20200513100031.GT4814@unreal>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200513093741.GC347693@mwanda>
In-Reply-To: <20200513093741.GC347693@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 13, 2020 at 12:37:41PM +0300, Dan Carpenter wrote:
> The "srq_out" pointer is never freed so that causes a memory leak.  It's
> never used and can be deleted.  Freeing "out" will lead to a double in
> mlx5_ib_query_srq().
>
> Fixes: 31578defe4eb ("RDMA/mlx5: Update mlx5_ib to use new cmd interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/hw/mlx5/srq_cmd.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>

Thanks for the report, the change should be slightly different.

I'm sending fix right now.
