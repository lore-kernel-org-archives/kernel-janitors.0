From: Christoph Hellwig <hch@lst.de>
Date: Tue, 12 Jan 2016 15:12:52 +0000
Subject: Re: [patch] RDMA/nes: checking for NULL instead of IS_ERR
Message-Id: <20160112151252.GA2294@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160112092743.GA29804@mwanda>
In-Reply-To: <20160112092743.GA29804@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Faisal Latif <faisal.latif-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Jan 12, 2016 at 12:27:43PM +0300, Dan Carpenter wrote:
> nes_reg_phys_mr() returns ERR_PTRs on error.  It doesn't return NULL.
> 
> This bug has been there for a while, but we recently changed from
> calling a function pointer to calling nes_reg_phys_mr() directly so now
> Smatch is able to detect the bug.

Looks fine,

Reviewed-by: Christoph Hellwig <hch@lst.de>
