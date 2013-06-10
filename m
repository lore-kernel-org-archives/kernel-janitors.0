From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Mon, 10 Jun 2013 10:07:47 +0000
Subject: Re: [patch] [media] media: info leak in __media_device_enum_links()
Message-Id: <2131110.fTHJyNQdyt@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130413093215.GB11215@elgon.mountain> <20130531122444.GS23987@mwanda>
In-Reply-To: <20130531122444.GS23987@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Friday 31 May 2013 15:24:45 Dan Carpenter wrote:
> Ping?

Oops, sorry for having missed the patch.

> On Sat, Apr 13, 2013 at 12:32:15PM +0300, Dan Carpenter wrote:
> > These structs have holes and reserved struct members which aren't
> > cleared.  I've added a memset() so we don't leak stack information.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've taken the patch in my tree, Added a "CC: stable@vger.kernel.org" and 
issued a pull request.

> > diff --git a/drivers/media/media-device.c b/drivers/media/media-device.c
> > index 99b80b6..450c0d1 100644
> > --- a/drivers/media/media-device.c
> > +++ b/drivers/media/media-device.c
> > @@ -139,6 +139,8 @@ static long __media_device_enum_links(struct
> > media_device *mdev,> 
> >  		for (p = 0; p < entity->num_pads; p++) {
> >  		
> >  			struct media_pad_desc pad;
> > 
> > +
> > +			memset(&pad, 0, sizeof(pad));
> > 
> >  			media_device_kpad_to_upad(&entity->pads[p], &pad);
> >  			if (copy_to_user(&links->pads[p], &pad, sizeof(pad)))
> >  			
> >  				return -EFAULT;
> > 
> > @@ -156,6 +158,7 @@ static long __media_device_enum_links(struct
> > media_device *mdev,> 
> >  			if (entity->links[l].source->entity != entity)
> >  			
> >  				continue;
> > 
> > +			memset(&link, 0, sizeof(link));
> > 
> >  			media_device_kpad_to_upad(entity->links[l].source,
> >  			
> >  						  &link.source);
> >  			
> >  			media_device_kpad_to_upad(entity->links[l].sink,

-- 
Regards,

Laurent Pinchart

