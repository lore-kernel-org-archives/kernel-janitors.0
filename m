From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Feb 2017 12:03:12 +0000
Subject: Re: [patch] staging: bcm2835-camera: free first element in array
Message-Id: <20170216120312.GH4162@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170215122523.GA12198@mwanda>
 <58A44DFB.6090105@bfs.de>
In-Reply-To: <58A44DFB.6090105@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Eric Anholt <eric@anholt.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-rpi-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org

On Wed, Feb 15, 2017 at 01:47:55PM +0100, walter harms wrote:
> 
> 
> Am 15.02.2017 13:25, schrieb Dan Carpenter:
> > We should free gdev[0] so the > should be >=.
> > 
> > Fixes: 7b3ad5abf027 ("staging: Import the BCM2835 MMAL-based V4L2 camera driver.")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/staging/media/platform/bcm2835/bcm2835-camera.c b/drivers/staging/media/platform/bcm2835/bcm2835-camera.c
> > index ca15a698e018..9bcd8e546a14 100644
> > --- a/drivers/staging/media/platform/bcm2835/bcm2835-camera.c
> > +++ b/drivers/staging/media/platform/bcm2835/bcm2835-camera.c
> > @@ -1998,7 +1998,7 @@ static int __init bm2835_mmal_init(void)
> >  free_dev:
> >  	kfree(dev);
> >  
> > -	for ( ; camera > 0; camera--) {
> > +	for ( ; camera >= 0; camera--) {
> >  		bcm2835_cleanup_instance(gdev[camera]);
> >  		gdev[camera] = NULL;
> >  	}
> 
> since we already know that programmers are bad in counting backwards ...
> 
> is is possible to change that into std. loop like:
> 
>  for(i=0, i< camera; i++ {
> 	bcm2835_cleanup_instance(gdev[i]);
> 	gdev[i] = NULL;
>   	}
> 
> this is way a much more common pattern.

Hm...  My patch is buggy.  It frees the wong thing on the first
iteration through the loop.  I'll resend.

regards,
dan carpenter

