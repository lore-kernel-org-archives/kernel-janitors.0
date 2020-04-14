From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 14 Apr 2020 19:02:11 +0000
Subject: Re: [PATCH v2] RDMA/cm: Fix an error check in cm_alloc_id_priv()
Message-Id: <20200414190211.GA12156@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200406145109.GQ20941@ziepe.ca>
 <20200407093714.GA80285@mwanda>
In-Reply-To: <20200407093714.GA80285@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Doug Ledford <dledford@redhat.com>, Matthew Wilcox <willy@infradead.org>, Leon Romanovsky <leon@kernel.org>, Danit Goldberg <danitg@mellanox.com>, Parav Pandit <parav@mellanox.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 07, 2020 at 12:37:14PM +0300, Dan Carpenter wrote:
> The xa_alloc_cyclic_irq() function returns either 0 or 1 on success and
> negatives on error.  This code treats 1 as an error and returns
> ERR_PTR(1) which will cause an Oops in the caller.
> 
> Fixes: ae78ff3a0f0c ("RDMA/cm: Convert local_id_table to XArray")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
> v2: Use the correct Fixes tag and add Matthew to the CC list.
> 
>  drivers/infiniband/core/cm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
