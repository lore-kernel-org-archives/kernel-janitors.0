From: Alan Stern <stern@rowland.harvard.edu>
Date: Thu, 07 Dec 2017 21:26:48 +0000
Subject: Re: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
Message-Id: <Pine.LNX.4.44L0.1712071624410.1280-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
In-Reply-To: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, SF Markus Elfring <elfring@users.sourceforge.net>, USB list <linux-usb@vger.kernel.org>, Joe Perches <joe@perches.com>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?iso-8859-1?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, 7 Dec 2017, Dan Carpenter wrote:

> On Thu, Dec 07, 2017 at 10:12:27AM -0500, Alan Stern wrote:
> > The real problem is that the kernel development community doesn't have
> > a fixed policy on how to handle memory allocation errors.  There are
> > several possibilities:
> > 
> > 	Ignore them on the grounds that they will never happen.
> > 	(Really?  And what is the size limit above which they
> > 	might happen?)
> > 
> 
> It's pretty rare to ignore allocation failures these days.  It causes
> static checker warnings.
> 
> Sometimes it's accepted for people to ignore errors during boot but
> I hate that because how am I supposed to filter out those static checker
> warnings?  It's better to pretend that the kernel will still boot
> without essential hardware instead of wasting everyone's time who looks
> at checker output.
> 
> > 	Ignore them on the grounds that the machine will hang or
> > 	crash in the near future.  (Is this guaranteed?)
> 
> On boot sometimes yes.
> 
> > 
> > 	Treat them like other errors: try to press forward (perhaps
> > 	in a degraded mode).
> > 
> > 	Treat them like other errors: log an error message and try
> > 	to press forward.
> > 
> 
> The standard is to treat them like errors and try press forward in a
> degraded mode but don't print a message.  Checkpatch.pl complains if you
> print a warning for allocation failures.  A lot of low level functions
> handle their own messages pretty well but especially kmalloc() does.

Which brings us back to my original objection.  If an allocation 
failure has localized effects, but the low-level warning is unable to 
specify what will be affected, how is the user supposed to connect the 
effect to the cause?

Alan Stern

> 
> I also have a special static checker warning for when people do:
> 
> 	foo = alloc();
> 	BUG_ON(!foo);
> 
> People do that occasionally but fortunately it's pretty rare.  10 years
> ago that's how btrfs did error handling, but now there are only 4 of
> these still remaining in btrfs.
> 
> regards,
> dan carpenter
> 
> 
> 

