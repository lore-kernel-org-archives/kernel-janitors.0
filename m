From: Jason Gunthorpe <jgg@nvidia.com>
Date: Tue, 22 Sep 2020 23:27:42 +0000
Subject: Re: [PATCH 05/14] RDMA/efa: drop double zeroing
Message-Id: <20200922232742.GA809724@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
 <1600601186-7420-6-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-6-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Gal Pressman <galpress@amazon.com>, kernel-janitors@vger.kernel.org, Yossi Leybovich <sleybo@amazon.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 20, 2020 at 01:26:17PM +0200, Julia Lawall wrote:
> sg_init_table zeroes its first argument, so the allocation of that argument
> doesn't have to.
> 
> the semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,n,flags;
> @@
> 
> x = 
> - kcalloc
> + kmalloc_array
>   (n,sizeof(*x),flags)
> ...
> sg_init_table(x,n)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> Acked-by: Gal Pressman <galpress@amazon.com>
> ---
>  drivers/infiniband/hw/efa/efa_verbs.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to rdma.git for-next, thanks

Jason
