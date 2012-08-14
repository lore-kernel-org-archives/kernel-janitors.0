From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2012 11:05:46 +0000
Subject: Re: [patch] [media] em28xx: use after free in em28xx_v4l2_close()
Message-Id: <20120814110546.GD4559@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120814065814.GB4791@elgon.mountain>
 <CALF0-+UU8dGBdihLgm==d0gCE4aHKdAbEVfe54U1LDjBHss8XQ@mail.gmail.com>
In-Reply-To: <CALF0-+UU8dGBdihLgm==d0gCE4aHKdAbEVfe54U1LDjBHss8XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ezequiel Garcia <elezegarcia@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Hans Verkuil <hans.verkuil@cisco.com>, Hans de Goede <hdegoede@redhat.com>, Gianluca Gennari <gennarone@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 14, 2012 at 07:50:12AM -0300, Ezequiel Garcia wrote:
> Hi Dan,
> 
> On Tue, Aug 14, 2012 at 3:58 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > We need to move the unlock before the kfree(dev);
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Applies to linux-next.
> >
> > diff --git a/drivers/media/video/em28xx/em28xx-video.c b/drivers/media/video/em28xx/em28xx-video.c
> > index ecb23df..78d6ebd 100644
> > --- a/drivers/media/video/em28xx/em28xx-video.c
> > +++ b/drivers/media/video/em28xx/em28xx-video.c
> > @@ -2264,9 +2264,9 @@ static int em28xx_v4l2_close(struct file *filp)
> >                 if (dev->state & DEV_DISCONNECTED) {
> >                         em28xx_release_resources(dev);
> 
> Why not unlocking here?

I don't see a reason to prefer one over the other.

regards,
dan carpenter

> 
> >                         kfree(dev->alt_max_pkt_size);
> > +                       mutex_unlock(&dev->lock);
> >                         kfree(dev);
> >                         kfree(fh);
> > -                       mutex_unlock(&dev->lock);
> 
> Thanks,
> Ezequiel.
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
