From: Greg KH <gregkh@suse.de>
Date: Wed, 29 Jul 2009 13:13:24 +0000
Subject: Re: [PATCH 4/4] Staging: hv: Fix warning by casting a (const void
Message-Id: <20090729131324.GA28049@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907291410.29355.npalix@diku.dk>
 <200907291508.24608.arnd@arndb.de>
In-Reply-To: <200907291508.24608.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nicolas Palix <npalix@diku.dk>, hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 29, 2009 at 03:08:24PM +0200, Arnd Bergmann wrote:
> On Wednesday 29 July 2009, Nicolas Palix wrote:
> > Fix compilation warning by casting the const void *Buffer
> > variable into a void *.
> > 
> > Signed-off-by: Nicolas Palix <npalix@diku.dk>
> 
> Not sure if this one is worthwhile. Replacing SG_BUFFER_LIST
> with the existing struct scatterlist might be a better
> fix, as sg_set_buf() does not generate a warning like this
> anyway.

Yes, that's the correct fix to make.  That should be done instead.

thanks,

greg k-h
