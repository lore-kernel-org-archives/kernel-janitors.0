From: Alan Stern <stern@rowland.harvard.edu>
Date: Fri, 08 Dec 2017 17:42:05 +0000
Subject: Re: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
Message-Id: <Pine.LNX.4.44L0.1712081235230.1371-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
In-Reply-To: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, SF Markus Elfring <elfring@users.sourceforge.net>, USB list <linux-usb@vger.kernel.org>, Joe Perches <joe@perches.com>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, 8 Dec 2017, Geert Uytterhoeven wrote:

> Hi Alan,
> 
> On Thu, Dec 7, 2017 at 10:26 PM, Alan Stern <stern@rowland.harvard.edu> wrote:
> > On Thu, 7 Dec 2017, Dan Carpenter wrote:
> >> The standard is to treat them like errors and try press forward in a
> >> degraded mode but don't print a message.  Checkpatch.pl complains if you
> >> print a warning for allocation failures.  A lot of low level functions
> >> handle their own messages pretty well but especially kmalloc() does.
> >
> > Which brings us back to my original objection.  If an allocation
> > failure has localized effects, but the low-level warning is unable to
> > specify what will be affected, how is the user supposed to connect the
> > effect to the cause?
> 
> The backtrace would include usb_hub_clear_tt_buffer, so the user will
> know USB is affected.
> Note that the cause of the memory exhaustion is usually not the caller.
> Unless it requests a real big block of memory, in which case that will be
> mentioned in the backtrace, too.
> 
> In this particular case, the driver uses GFP_ATOMIC, so allocation failures
> aren't that rare, and I think the driver should be prepared for that, and try
> to recover gracefully.
> 
> The comment
> 
>                 /* FIXME recover somehow ... RESET_TT? */
> 
> makes me think it isn't.
> 
> As this is a pretty small allocation, perhaps it can be done beforehand, without
> GFP_ATOMIC?

I can't see how to make that work.  We don't know beforehand how many
structures will be needed at any time.

Alan Stern

