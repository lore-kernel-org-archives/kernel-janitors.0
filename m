From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Sep 2015 06:41:50 +0000
Subject: Re: [patch] IB/hfi1: info leak in get_ctxt_info()
Message-Id: <20150916064150.GH5004@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150916062142.GB21542@mwanda>
 <alpine.DEB.2.02.1509160824370.2049@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1509160824370.2049-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Sep 16, 2015 at 08:25:00AM +0200, Julia Lawall wrote:
> On Wed, 16 Sep 2015, Dan Carpenter wrote:
> 
> > The cinfo struct has a hole after the last struct member so we need to
> > zero it out.  Otherwise we don't disclose some uninitialized stack data.
> 
> I think the "don't" wasn't intended in the second sentence?
> 

Derp...  I will resend.

regards,
dan carpenter

