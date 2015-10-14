From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Oct 2015 18:05:41 +0000
Subject: Re: [patch 2/2] misc: mic/scif: fix wrap around tests
Message-Id: <20151014180541.GO7289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151009064021.GA7540@mwanda>
 <1444792884.93285.276.camel@localhost>
In-Reply-To: <1444792884.93285.276.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Nikhil Rao <nikhil.rao@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 13, 2015 at 08:21:24PM -0700, Sudeep Dutt wrote:

> > @@ -1613,7 +1613,7 @@ off_t scif_register(scif_epd_t epd, void *addr, size_t len, off_t offset,
> >  	if ((map_flags & SCIF_MAP_FIXED) &&
> >  	    ((ALIGN(offset, PAGE_SIZE) != offset) ||
> >  	    (offset < 0) ||
> > -	    (offset + (off_t)len < offset)))
> > +	    (len < LONG_MAX - offset)))
> 
> Hi Dan,
> Should this be > instead of < like the others?

Gar.  You're right, obviously.  Thanks.  I will resend tomorrow.

regards,
dan carpenter

