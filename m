From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 20 Feb 2019 21:43:29 +0000
Subject: Re: [PATCH -next] IB/qib: Remove unused variable 'locked'
Message-Id: <20190220214329.GA15474@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216033618.116680-1-yuehaibing@huawei.com>
In-Reply-To: <20190216033618.116680-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Feb 16, 2019 at 04:15:52AM -0800, Davidlohr Bueso wrote:

> [PATCH] drivers/IB,qib: Fix pinned/locked limit check in qib_get_user_pages()
> 
> The current check does not take into account the previous value of
> pinned_vm; thus it is quite bogus as is. Fix this by checking the
> new value after the (optimistic) atomic inc.
> 
> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
> --
> drivers/infiniband/hw/qib/qib_user_pages.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next thanks

Jason
