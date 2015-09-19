From: "Weiny, Ira" <ira.weiny@intel.com>
Date: Sat, 19 Sep 2015 22:49:52 +0000
Subject: RE: [patch] IB/hfi1: checking for NULL instead of IS_ERR
Message-Id: <2807E5FD2F6FDA4886F6618EAC48510E1CB98D06@CRSMSX101.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150916062220.GC21542@mwanda> <55FC32ED.1000404@redhat.com>
 <20150919030153.GA30373@kroah.com>
In-Reply-To: <20150919030153.GA30373-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, infinipath <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Hefty, Sean" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

> 
> On Fri, Sep 18, 2015 at 11:51:09AM -0400, Doug Ledford wrote:
> > On 09/16/2015 02:22 AM, Dan Carpenter wrote:
> > > __get_txreq() returns an ERR_PTR() but this checks for NULL so it
> > > would oops on failure.
> > >
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Thanks, applied.
> 
> Applied to what?  Should I just ignore these types of patches and not take them
> in my tree and you will send them on later on?  I don't remember what we
> agreed to do, sorry.

My recollection was that Doug was going to handle the staging/rdma sub-tree because of the large churn he expected between the rdma subsystem and those drivers.

Therefore, I have been submitting my patches against staging/rdma/hfi directly to Doug and Linux-rdma.

Ira

> 
> thanks,
> 
> greg k-h
> --
> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in the body
> of a message to majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
