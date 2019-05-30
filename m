From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Thu, 30 May 2019 18:47:09 +0000
Subject: Re: [PATCH] RDMA/uverbs: check for allocation failure in uapi_add_elm()
Message-Id: <20190530184709.GA982@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190530082024.GA11836@mwanda>
In-Reply-To: <20190530082024.GA11836@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 30, 2019 at 11:20:24AM +0300, Dan Carpenter wrote:
> If the kzalloc() fails then we should return ERR_PTR(-ENOMEM).  In the
> current code it's possible that the kzalloc() fails and the
> radix_tree_insert() inserts the NULL pointer successfully and we return
> the NULL "elm" pointer to the caller.  That results in a NULL pointer
> dereference.
> 
> Fixes: 9ed3e5f44772 ("IB/uverbs: Build the specs into a radix tree at runtime")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/core/uverbs_uapi.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied to for-next, thanks

Jason
