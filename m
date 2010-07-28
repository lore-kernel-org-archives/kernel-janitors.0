From: Dan Carpenter <error27@gmail.com>
Date: Wed, 28 Jul 2010 21:20:31 +0000
Subject: Re: [PATCH 09/10] oss: msnd: check request_region() return value
Message-Id: <20100728212031.GQ26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280335296-23475-1-git-send-email-segooon@gmail.com> <20100728200002.GP26313@bicker>
In-Reply-To: <20100728200002.GP26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Andrew Veliath <andrewtv@usa.net>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

On Wed, Jul 28, 2010 at 10:00:02PM +0200, Dan Carpenter wrote:
> This should be -EBUSY as well.  The same for "[PATCH 06/10] ALSA: msnd: 
> check request_region() return value"
> 
> Another way to write that would be:
> 

Gar.  I was thinking of request_resource().  request_region() returns a
pointer of course.

But still the return code should probably be -EBUSY.  Resource
conflicts are more likely than allocation failures.

regards,
dan carpenter

> -	request_region(dev.io, dev.numio, dev.name);
> +	err = request_region(dev.io, dev.numio, dev.name);
> +	if (err) {
> +		free_irq(dev.irq, &dev);
> +		return err;
> +	}
> 
> regards,
> dan carpenter
> 
> > +	if (request_region(dev.io, dev.numio, dev.name) = NULL) {
> > +		free_irq(dev.irq, &dev);
> > +		return -ENOMEM;
> > +	}
