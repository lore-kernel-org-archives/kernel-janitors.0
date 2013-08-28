From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Date: Wed, 28 Aug 2013 07:50:10 +0000
Subject: Re: [patch] [media] mx3-camera: locking typo in mx3_videobuf_queue()
Message-Id: <Pine.LNX.4.64.1308280947190.22743@axis700.grange>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823094530.GN31293@elgon.mountain>
 <Pine.LNX.4.64.1308232313220.14796@axis700.grange> <20130824070650.GA19256@mwanda>
In-Reply-To: <20130824070650.GA19256@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 24 Aug 2013, Dan Carpenter wrote:

> On Fri, Aug 23, 2013 at 11:16:51PM +0200, Guennadi Liakhovetski wrote:
> > Hi Dan,
> > 
> > On Fri, 23 Aug 2013, Dan Carpenter wrote:
> > 
> > > There is a return in the middle where we haven't restored the IRQs to
> > > their original state.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > 
> > > diff --git a/drivers/media/platform/soc_camera/mx3_camera.c b/drivers/media/platform/soc_camera/mx3_camera.c
> > > index 1047e3e..4bae910 100644
> > > --- a/drivers/media/platform/soc_camera/mx3_camera.c
> > > +++ b/drivers/media/platform/soc_camera/mx3_camera.c
> > > @@ -334,7 +334,7 @@ static void mx3_videobuf_queue(struct vb2_buffer *vb)
> > >  	if (!mx3_cam->active)
> > >  		mx3_cam->active = buf;
> > >  
> > > -	spin_unlock_irq(&mx3_cam->lock);
> > > +	spin_unlock_irqrestore(&mx3_cam->lock, flags);
> > >  
> > >  	cookie = txd->tx_submit(txd);
> > >  	dev_dbg(icd->parent, "Submitted cookie %d DMA 0x%08x\n",
> > 
> > Please, wait with this. The above doesn't seem quite right to me. IIRC, 
> > the purpose of unlock_irq(), i.e. of the unconditionally enabling IRQs was 
> > to make sure ->tx_submit() is called with interrupts enabled. I'm 
> > currently on holiday with very scarce internet access. Either please 
> > double-check this yourself or I'll have another look at it when back home 
> > next week.
> > 
> 
> No problem.   This is static checker stuff.  The currect code is
> definitely wrong because the return in the middle.  When the
> function returns we don't know if IRQs are enabled or not.

Ok, I did suspect this, but just wanted to check, when I have a better 
access to sources. This function cannot be called with IRQs disabled. So, 
it is ok to replace ..._irqsave() / ..._irqrestore() calls in it with 
their plain ..._irq() counterparts. Could you cook up a patch, please?

Thanks
Guennadi

> > > @@ -343,7 +343,7 @@ static void mx3_videobuf_queue(struct vb2_buffer *vb)
> > >  	if (cookie >= 0)
> > >  		return;
>             ^^^^^^^^^^^
> > >  
> > > -	spin_lock_irq(&mx3_cam->lock);
> > > +	spin_lock_irqsave(&mx3_cam->lock, flags);
> 
> I thought about using local_irq_restore(flags) but it seemed like
> an obvious oversight.
> 
> regards,
> dan carpenter
> 

---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
