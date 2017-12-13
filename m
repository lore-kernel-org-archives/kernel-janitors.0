From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 13 Dec 2017 18:20:26 +0000
Subject: Re: RDMA/cxgb4: Add a sanity check in process_work()
Message-Id: <20171213182026.GE5984@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143654.n5ybdhj3ga2tp7t4@mwanda>
In-Reply-To: <20171205143654.n5ybdhj3ga2tp7t4@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Dec 05, 2017 at 05:36:54PM +0300, Dan Carpenter wrote:
> The story is that Smatch marks skb->data as untrusted so it generates
> a warning message here:
> 
>     drivers/infiniband/hw/cxgb4/cm.c:4100 process_work()
>     error: buffer overflow 'work_handlers' 241 <= 255
> 
> In other places which handle this such as t4_uld_rx_handler() there is
> some checking to make sure that the function pointer is not NULL.  I
> have added bounds checking and a check for NULL here as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Steve Wise <swise@opengridcomputing.com>

Thanks, applied to -next

Jason
