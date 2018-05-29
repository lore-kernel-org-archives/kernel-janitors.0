From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 29 May 2018 08:45:03 +0000
Subject: Re: [PATCH] vfio/pci: remove a bogus cast in vfio_msi_set_block()
Message-Id: <20180529084502.hltdpojgnkjieaaj@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180528074756.bgl5fxvn7foe5uhn@kili.mountain>
 <8df5c218-cc97-3dbc-e820-f8bdc710ac17@redhat.com>
In-Reply-To: <8df5c218-cc97-3dbc-e820-f8bdc710ac17@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Auger Eric <eric.auger@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, May 28, 2018 at 09:27:18PM +0200, Auger Eric wrote:
> Hi Dan,
> 
> On 05/28/2018 09:47 AM, Dan Carpenter wrote:
> > This cast is confusing...  The "start" variable is an unsigned int.  We
> > absolutely do not want to cast it to a negative int so why is the cast
> > there?  It turns out, when you look at the context, it's a no-op and we
> > can just remove it.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
> > index 1c46045b0e7f..2724fed62129 100644
> > --- a/drivers/vfio/pci/vfio_pci_intrs.c
> > +++ b/drivers/vfio/pci/vfio_pci_intrs.c
> > @@ -368,7 +368,7 @@ static int vfio_msi_set_block(struct vfio_pci_device *vdev, unsigned start,
> >  	}
> >  
> >  	if (ret) {
> > -		for (--j; j >= (int)start; j--)
> > +		for (--j; j >= start; j--)
> I think this was done one purpose as j can be -1 while start is an
> unsigned.
> 

Oh, wow...  Yeah.  Sorry.  I didn't think that through.  I will create
a static checker warning so this particular bug doesn't happen to me
again.

regards,
dan carpenter

