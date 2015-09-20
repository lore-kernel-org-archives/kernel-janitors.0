From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 20 Sep 2015 17:26:27 +0000
Subject: Re: [patch] IB/hfi1: checking for NULL instead of IS_ERR
Message-Id: <20150920172627.GC27148@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150916062220.GC21542@mwanda>
 <55FC32ED.1000404@redhat.com>
 <20150919030153.GA30373@kroah.com>
 <2807E5FD2F6FDA4886F6618EAC48510E1CB98D06@CRSMSX101.amr.corp.intel.com>
In-Reply-To: <2807E5FD2F6FDA4886F6618EAC48510E1CB98D06-8k97q/ur5Z2krb+BlOpmy7fspsVTdybXVpNB7YpNyf8@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Weiny, Ira" <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, infinipath <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Hefty, Sean" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

On Sat, Sep 19, 2015 at 10:49:52PM +0000, Weiny, Ira wrote:
> > 
> > On Fri, Sep 18, 2015 at 11:51:09AM -0400, Doug Ledford wrote:
> > > On 09/16/2015 02:22 AM, Dan Carpenter wrote:
> > > > __get_txreq() returns an ERR_PTR() but this checks for NULL so it
> > > > would oops on failure.
> > > >
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >
> > > Thanks, applied.
> > 
> > Applied to what?  Should I just ignore these types of patches and not take them
> > in my tree and you will send them on later on?  I don't remember what we
> > agreed to do, sorry.
> 
> My recollection was that Doug was going to handle the staging/rdma sub-tree because of the large churn he expected between the rdma subsystem and those drivers.
> 
> Therefore, I have been submitting my patches against staging/rdma/hfi directly to Doug and Linux-rdma.

Ok, but Doug better start syncing up with me soon, as we are about to
start to get a ton of staging patches due to the Outreachy application
process, and we will start to get merge errors very quickly.

Doug, what's the plan for this?  Can you just forward me patches every
so often to sync up?  Or I can take anything that is cc: me and/or the
driverdevel mailing list.

thanks,

greg k-h
