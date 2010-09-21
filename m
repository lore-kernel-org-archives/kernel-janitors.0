From: Greg KH <greg@kroah.com>
Date: Tue, 21 Sep 2010 22:49:47 +0000
Subject: Re: [PATCH 04/14] memstick: core: fix device_register() error
Message-Id: <20100921224947.GA20183@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284900889-24369-1-git-send-email-segooon@gmail.com>
 <20100921152031.30365b3f.akpm@linux-foundation.org>
In-Reply-To: <20100921152031.30365b3f.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Kay Sievers <kay.sievers@vrfy.org>
Cc: Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Tejun Heo <tj@kernel.org>, Jiri Slaby <jirislaby@gmail.com>, linux-kernel@vger.kernel.org, James Bottomley <James.Bottomley@suse.de>, Dan Carpenter <error27@gmail.com>, Boaz Harrosh <bharrosh@panasas.com>

On Tue, Sep 21, 2010 at 03:20:31PM -0700, Andrew Morton wrote:
> On Sun, 19 Sep 2010 16:54:49 +0400
> Vasiliy Kulikov <segooon@gmail.com> wrote:
> 
> > If device_register() fails then call put_device().
> > See comment to device_register.
> > 
> > Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> > ---
> >  compile tested.
> > 
> >  drivers/memstick/core/memstick.c |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> > 
> > diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/memstick.c
> > index c00fe82..4303b7e 100644
> > --- a/drivers/memstick/core/memstick.c
> > +++ b/drivers/memstick/core/memstick.c
> > @@ -465,6 +465,7 @@ static void memstick_check(struct work_struct *work)
> >  		if (!host->card) {
> >  			host->card = card;
> >  			if (device_register(&card->dev)) {
> > +				put_device(&card->dev);
> >  				kfree(host->card);
> >  				host->card = NULL;
> >  			}
> 
> A failed device_register() takes a bogus ref on the not-registered
> device?  It's no surprise that people are getting this wrong.  
> 
> The principle of least surprise says: fix device_register()!

One might think that, but it's a bit more difficult.

How does device_register know it should destroy the device if it fails?

Here's how it works:
 - device_register is just a wrapper around device_initialize() and
   device_add()
     - device_initialize() can't do anything wrong, so it's safe, BUT,
       at this point in time, the reference for the device is
       incremented, so any caller must now drop the reference and
       properly free stuff.
     - device_add() does a lot.

Hm, I guess, because we "know" in device_register() that we must drop
something if device_add() fails, then I guess it's not being consistant
with it's own calls...

So, something as simple as this?


diff --git a/drivers/base/core.c b/drivers/base/core.c
index d1b2c9a..4ba8599 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1084,14 +1084,16 @@ name_error:
  * have a clearly defined need to use and refcount the device
  * before it is added to the hierarchy.
  *
- * NOTE: _Never_ directly free @dev after calling this function, even
- * if it returned an error! Always use put_device() to give up the
- * reference initialized in this function instead.
  */
 int device_register(struct device *dev)
 {
+	int retval;
+
 	device_initialize(dev);
-	return device_add(dev);
+	retval = device_add(dev);
+	if (retval)
+		put_device(dev);
+	return retval;
 }
 
 /**
     	


Kay, what am I missing here, why can't we just do this?  Hm, the
side-affect might be that if device_register() fails, NO ONE had better
touch that device again, as it might have just been freed from the
system.  I wonder if that will cause problems...

thanks,

greg k-h
