From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 03 Aug 2018 02:17:53 +0000
Subject: Re: [PATCH] rdma/cxgb4: fix some info leaks
Message-Id: <20180803021753.GA16533@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180802075613.4zu6m6rv2dcumr5l@kili.mountain>
In-Reply-To: <20180802075613.4zu6m6rv2dcumr5l@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 02, 2018 at 10:56:13AM +0300, Dan Carpenter wrote:
> In c4iw_create_qp() there are several struct members which potentially
> aren't inintialized like uresp.rq_key.  I've fixed this code before in
> in commit ae1fe07f3f42 ("RDMA/cxgb4: Fix stack info leak in
> c4iw_create_qp()") so this time I'm just going to take a big hammer
> approach and memset the whole struct to zero.  Hopefully, it will stay
> fixed this time.
> 
> In c4iw_create_srq() we don't clear uresp.reserved.
> 
> Fixes: 6a0b6174d35a ("rdma/cxgb4: Add support for kernel mode SRQ's")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Raju Rangoju <rajur@chelsio.com>
> ---
> These bugs are detected with Smatch btw if you want to go back to fixing
> them yourselves in a more delicate way.

Applied to for-next, thanks

Jason
