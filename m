From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 Sep 2017 20:34:09 +0000
Subject: Re: [PATCH] i40iw: delete some stray tabs
Message-Id: <20170929203409.gd3yczvfnflwrwth@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170929074943.cs2jea5xttk2r6vm@mwanda>
 <20170929102929.GA2723@mtr-leonro.local>
 <20170929104004.svcnntqmgdxnzgnn@mwanda>
 <20170929144554.GB2965@mtr-leonro.local>
In-Reply-To: <20170929144554.GB2965-U/DQcQFIOTAAJjI8aNfphQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Romanovsky <leon-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Faisal Latif <faisal.latif-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Shiraz Saleem <shiraz.saleem-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, Sep 29, 2017 at 05:45:54PM +0300, Leon Romanovsky wrote:
> On Fri, Sep 29, 2017 at 01:40:04PM +0300, Dan Carpenter wrote:
> > On Fri, Sep 29, 2017 at 01:29:29PM +0300, Leon Romanovsky wrote:
> > > On Fri, Sep 29, 2017 at 10:49:43AM +0300, Dan Carpenter wrote:
> > > > These lines were indented too far by mistake.
> > > >
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > >
> > > > diff --git a/drivers/infiniband/hw/i40iw/i40iw_cm.c b/drivers/infiniband/hw/i40iw/i40iw_cm.c
> > >
> > > Dan,,
> > >
> > > I saw in your patches and don't know if it important. There is no
> > > diffstat after your Signed-off-by and there is no "---" trailing line
> > > too.
> >
> > Yeah.  I leave those out.  I normally write two line patches like this
> > one so the diffstat is normally -2+2 and I figure people will see that
> > they're tiny just from glancing at the email.  When I create patches
> > that touch multiple files, what I do is just merge the diffs together in
> > my email client.  If I tried to create diffstats for those, I'd just end
> > up messing up a lot.
> 
> What are the benefits avoiding them?
> 

The way I develop the kernel is way different from how other people do
and different from how I develop Smatch.  I've spent 9 years tweaking
my scripts to make it work for me.  Please don't force me to use git
commit...  :(

regards,
dan carpenter


