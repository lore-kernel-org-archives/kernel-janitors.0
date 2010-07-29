From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 29 Jul 2010 10:22:10 +0000
Subject: Re: [PATCH 09/10] oss: msnd: check request_region() return value
Message-Id: <s5h8w4utwod.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280335296-23475-1-git-send-email-segooon@gmail.com>
	<20100728200002.GP26313@bicker> <20100728212031.GQ26313@bicker>
In-Reply-To: <20100728212031.GQ26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Kulikov Vasiliy <segooon@gmail.com>, Andrew Veliath <andrewtv@usa.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

At Wed, 28 Jul 2010 23:20:31 +0200,
Dan Carpenter wrote:
> 
> On Wed, Jul 28, 2010 at 10:00:02PM +0200, Dan Carpenter wrote:
> > This should be -EBUSY as well.  The same for "[PATCH 06/10] ALSA: msnd: 
> > check request_region() return value"
> > 
> > Another way to write that would be:
> > 
> 
> Gar.  I was thinking of request_resource().  request_region() returns a
> pointer of course.
> 
> But still the return code should probably be -EBUSY.  Resource
> conflicts are more likely than allocation failures.

Agreed.

Kulikov, could you rewrite the patches with -EBUSY?


thanks,

Takashi

> 
> regards,
> dan carpenter
> 
> > -	request_region(dev.io, dev.numio, dev.name);
> > +	err = request_region(dev.io, dev.numio, dev.name);
> > +	if (err) {
> > +		free_irq(dev.irq, &dev);
> > +		return err;
> > +	}
> > 
> > regards,
> > dan carpenter
> > 
> > > +	if (request_region(dev.io, dev.numio, dev.name) = NULL) {
> > > +		free_irq(dev.irq, &dev);
> > > +		return -ENOMEM;
> > > +	}
> 
