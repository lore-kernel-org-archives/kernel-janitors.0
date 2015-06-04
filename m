From: "Dave Goodell (dgoodell)" <dgoodell@cisco.com>
Date: Thu, 04 Jun 2015 16:14:44 +0000
Subject: Re: [patch] IB/usnic: clean up some error handling code
Message-Id: <A7405890-8794-4A04-A6B6-C84094BBD58A@cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150604090218.GD22838@mwanda>
In-Reply-To: <20150604090218.GD22838@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Upinder Malhi <umalhi-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Jun 4, 2015, at 4:02 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This code causes a static checker warning:
> 
> 	drivers/infiniband/hw/usnic/usnic_uiom.c:476 usnic_uiom_alloc_pd()
> 	warn: passing zero to 'PTR_ERR'
> 
> This code isn't buggy, but iommu_domain_alloc() doesn't return an error
> pointer so we can simplify the error handling and silence the static
> checker warning.
> 
> The static checker warning is to catch place which do:
> 
> 	if (!ptr)
> 		return ERR_PTR(ptr);
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good to me, thanks.

Reviewed-by: Dave Goodell <dgoodell@cisco.com>

-Dave

