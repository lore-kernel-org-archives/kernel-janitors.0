From: Joe Perches <joe@perches.com>
Date: Thu, 07 Dec 2017 16:20:52 +0000
Subject: Re: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
Message-Id: <1512663652.960.41.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
In-Reply-To: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, USB list <linux-usb@vger.kernel.org>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?ISO-8859-1?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, 2017-12-07 at 10:12 -0500, Alan Stern wrote:
> The real problem is that the kernel development community doesn't have
> a fixed policy on how to handle memory allocation errors.
[]
> If there was one agreed-upon policy, then we could definitively point 
> to old code and say "That's wrong, and here is how it should be fixed."  
> But currently this is not possible, and we end up with repetitive 
> discussions like this one that aren't of general use.

Well stated.

My preferred policy would be to remove all the individual
allocation failure messages and only use the generic
warn_alloc()/dump_stack() mechanism.

