From: Richard Weinberger <richard@nod.at>
Date: Mon, 11 Dec 2017 09:33:37 +0000
Subject: Re: [PATCH 1/2] um: vector_kern: Unlock on error in vector_net_open()
Message-Id: <3254171.LO6pLlHuPk@blindfold>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171209114940.fsi7jbxd7zbhhu74@mwanda>
In-Reply-To: <20171209114940.fsi7jbxd7zbhhu74@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Anton,

Am Samstag, 9. Dezember 2017, 18:09:17 CET schrieb Anton Ivanov:
> Thanks,
> 
> I guess I missed that one.
> 
> A.
> 
> On 09/12/17 11:49, Dan Carpenter wrote:
> > We need to unlock and restore IRQs on this error path.
> > 
> > Fixes: ad1f62ab2bd4 ("High Performance UML Vector Network Driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
> > index d1d53015d572..bb83a2d22ac2 100644
> > --- a/arch/um/drivers/vector_kern.c
> > +++ b/arch/um/drivers/vector_kern.c
> > @@ -1156,8 +1156,10 @@ static int vector_net_open(struct net_device *dev)
> > 
> >  	struct vector_device *vdevice;
> >  	
> >  	spin_lock_irqsave(&vp->lock, flags);
> > 
> > -	if (vp->opened)
> > +	if (vp->opened) {
> > +		spin_unlock_irqrestore(&vp->lock, flags);
> > 
> >  		return -ENXIO;
> > 
> > +	}
> > 
> >  	vp->opened = true;
> >  	spin_unlock_irqrestore(&vp->lock, flags);

Please review/ack these patches.

Thanks,
//richard
