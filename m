From: Manuel Schoelling <manuel.schoelling@gmx.de>
Date: Sun, 25 May 2014 18:24:33 +0000
Subject: Re: [PATCH] staging: gdm72xx: use time_before()
Message-Id: <1401042273.7538.10.camel@schoellingm.dzne.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401023339-29712-1-git-send-email-manuel.schoelling@gmx.de>
	 <20140525181431.GA20614@kroah.com>
In-Reply-To: <20140525181431.GA20614@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, arnd@arndb.de, peter.p.waskiewicz.jr@intel.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, khoroshilov@ispras.ru

On So, 2014-05-25 at 11:14 -0700, Greg KH wrote:
> On Sun, May 25, 2014 at 03:08:59PM +0200, Manuel Schölling wrote:
> > To be future-proof and for better readability the time comparisons are
> > modified to use time_before() instead of plain, error-prone math.
> > 
> > Signed-off-by: Manuel Schölling <manuel.schoelling@gmx.de>
> > ---
> >  drivers/staging/gdm72xx/gdm_usb.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This patch doesn't apply, can you please refresh it against my latest
> tree and resend?
That's weird. I pulled the lastest master from Linus and rebased the
patch, but no modification of my patch was required (latest commit
before my patch to that file was
8943a92fc257c439ffe55fb0f9896be57c58c56b according to my repo). 

Maybe you have a more recent version than Linus?

Bye,

Manuel

> thanks,
> 
> greg k-h


