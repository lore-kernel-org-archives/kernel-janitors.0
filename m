From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Dec 2017 09:30:25 +0000
Subject: Re: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
Message-Id: <20171207093025.jzrloia7ea364iob@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
In-Reply-To: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, SF Markus Elfring <elfring@users.sourceforge.net>, USB list <linux-usb@vger.kernel.org>, Joe Perches <joe@perches.com>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?iso-8859-1?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, Dec 07, 2017 at 09:45:38AM +0100, Geert Uytterhoeven wrote:
> >
> > Small allocations never fail in the current kernel.
> 
> A few comments (this is in response to a patch from Markus, so there have
> to be lots of questions and uncertainties ;-)
> 1. In the current kernel. What about the future?

Right.  No one can predict.  And the small allocations don't fail rule
causes some problems.

> 2. If a small allocation cannot fail, what happens if the small memory slab
>    is exhausted? A new page must be allocated, which will trigger an OOM,
>    and some other part of the system will be killed and fail.

Right.


> 3. This driver uses GFP_ATOMIC, is that guaranteed to succeed? I think not.
> 

Right again.  I was missing the first email in the thread because of my
email filters so I didn't see this was atomic.

regards,
dan carpenter

