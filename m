From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 13 Dec 2017 18:19:56 +0000
Subject: Re: iw_cxgb4: make pointer reg_workq static
Message-Id: <20171213181956.GD5984@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171130133006.19699-1-colin.king@canonical.com>
In-Reply-To: <20171130133006.19699-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Nov 30, 2017 at 01:30:06PM +0000, Colin Ian King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer reg_workq is local to the source and does not need to be
> in global scope, so make it static.
> 
> Cleans up sparse warning:
> drivers/infiniband/hw/cxgb4/device.c:69:25: warning: symbol 'reg_workq'
> was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
> Reviewed-by: Steve Wise <swise@opengridcomputing.com>
>  drivers/infiniband/hw/cxgb4/device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to -next

Jason
