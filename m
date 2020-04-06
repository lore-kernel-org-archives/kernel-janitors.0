From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Mon, 06 Apr 2020 14:51:09 +0000
Subject: Re: [PATCH] RDMA/cm: Fix an error check in cm_alloc_id_priv()
Message-Id: <20200406145109.GQ20941@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200406144335.GD68494@mwanda>
In-Reply-To: <20200406144335.GD68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Doug Ledford <dledford@redhat.com>, Leon Romanovsky <leon@kernel.org>, Danit Goldberg <danitg@mellanox.com>, Parav Pandit <parav@mellanox.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Apr 06, 2020 at 05:43:35PM +0300, Dan Carpenter wrote:
> The xa_alloc_cyclic_irq() function returns either 0 or 1 on success and
> negatives on error.  This code treats 1 as an error and returns
> ERR_PTR(1) which will cause an Oops in the caller.
> 
> Fixes: e8dc4e885c45 ("RDMA/cm: Fix ordering of xa_alloc_cyclic() in ib_create_cm_id()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The Fixes tag may not be correct.  That's the patch which introduces an
> Oops but we may want to backport this further back.

Right it should be

Fixes: ae78ff3a0f0c ("RDMA/cm: Convert local_id_table to XArray")

Thanks,
Jason
