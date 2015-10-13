From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Oct 2015 12:51:35 +0000
Subject: Re: [patch 2/2] misc: mic/scif: fix wrap around tests
Message-Id: <20151013125135.GN7289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151009064021.GA7540@mwanda>
 <1444554884.93285.233.camel@localhost>
In-Reply-To: <1444554884.93285.233.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Nikhil Rao <nikhil.rao@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Oct 11, 2015 at 02:14:44AM -0700, Sudeep Dutt wrote:
> On Fri, 2015-10-09 at 09:40 +0300, Dan Carpenter wrote:
> > Signed integer overflow is undefined.  Also I added a check for
> > "(offset < 0)" in scif_unregister() because that makes it match the
> > other conditions and because I didn't want to subtract a negative.
> > 
> > Fixes: ba612aa8b487 ('misc: mic: SCIF memory registration and unregistration')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > 
> > Imagine you are on 64 bit and len is larger than INT_MAX << 12, it means
> > that we truncate it because scif_get_window_offset() takes an integer
> > argument.  I don't know if this is an issue. 
> 
> scif_get_window_offset(..) takes an integer argument for the number of
> pages. We believe that an int for number of 4K pages is sufficient for
> current systems. I don't think there is an issue here.

The issue isn't that we need more pages, it's that we can overflow
INT_MAX so scif_get_window_offset() succeeds when it should fail.

> 
> >  Maybe I should use
> > INT_MAX instead of LONG_MAX?  I am working on a static checker warning
> > for these types of issues:
> > drivers/misc/mic/scif/scif_rma.c:1631 scif_register() warn: truncating user data 'len >> 12' '0-4503599627370495'
> > drivers/misc/mic/scif/scif_rma.c:1643 scif_register() warn: truncating user data 'len >> 12' '0-4503599627370495'
> > 
> > The other static warnings here are:
> > 
> > drivers/misc/mic/scif/scif_rma.c:745 scif_unregister_window() warn: inconsistent returns 'mutex:&ep->rma_info.rma_lock'.
> >   Locked on:   line 745
> >   Unlocked on: line 687
> 
> The function expects the lock to be held by the caller so there is no
> issue here.
> 

You're missing the point.  Never mind, I will send a patch for this.

> > @@ -1613,7 +1613,7 @@ off_t scif_register(scif_epd_t epd, void *addr, size_t len, off_t offset,
> >  	if ((map_flags & SCIF_MAP_FIXED) &&
> >  	    ((ALIGN(offset, PAGE_SIZE) != offset) ||
> >  	    (offset < 0) ||
> > -	    (offset + (off_t)len < offset)))
> > +	    (len < LONG_MAX - offset)))
> 
> Why is this change required? The earlier code was being used to detect
> wraparound and I think it works fine.

It doesn't work.  off_t is a signed type so it's undefined.  The
compiler will often just remove the condition.

regards,
dan carpenter

