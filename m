From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Aug 2014 15:56:30 +0000
Subject: Re: [patch] drm/radeon: add a check for allocation failure
Message-Id: <20140807155630.GD11899@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140807152736.GA10299@mwanda>
 <CADnq5_Mxw=ZY-7cxj440Df6PG4bFDNBvX=v70i4CR5O-277bJw@mail.gmail.com>
In-Reply-To: <CADnq5_Mxw=ZY-7cxj440Df6PG4bFDNBvX=v70i4CR5O-277bJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, kernel-janitors@vger.kernel.org, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

On Thu, Aug 07, 2014 at 11:31:15AM -0400, Alex Deucher wrote:
> On Thu, Aug 7, 2014 at 11:27 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > We can easily return -ENOMEM here if kzalloc() fails.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
> > index ccae4d9..d15d987 100644
> > --- a/drivers/gpu/drm/radeon/radeon_vm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_vm.c
> > @@ -483,6 +483,8 @@ int radeon_vm_bo_set_addr(struct radeon_device *rdev,
> >                         /* add a clone of the bo_va to clear the old address */
> >                         struct radeon_bo_va *tmp;
> >                         tmp = kzalloc(sizeof(struct radeon_bo_va), GFP_KERNEL);
> > +                       if (!tmp)
> > +                               return -ENOMEM;
> 
> We need to drop the lock here too.  I'll apply and fix it up.  Thanks!
> 

Gar.  I'm sorry.  I thought it looked easier than it was.

Also I really should have caught that in my qc.  :/  I'm not sure what
happened.

regards,
dan carpenter

