From: Alan Stern <stern@rowland.harvard.edu>
Date: Thu, 07 Dec 2017 15:12:27 +0000
Subject: Re: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
Message-Id: <Pine.LNX.4.44L0.1712071000560.1361-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
In-Reply-To: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, USB list <linux-usb@vger.kernel.org>, Joe Perches <joe@perches.com>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, 7 Dec 2017, Geert Uytterhoeven wrote:

> Hi Alan,
> 
> On Wed, Dec 6, 2017 at 11:02 PM, Alan Stern <stern@rowland.harvard.edu> wrote:
> > On Wed, 6 Dec 2017, SF Markus Elfring wrote:
> >> >>> Does the existing memory allocation error message include the
> >> >>> &udev->dev device name and driver name?  If it doesn't, there will be
> >> >>> no way for the user to tell that the error message is related to the
> >> >>> device failure.
> >> >>
> >> >> No, but the effect is similar.
> >> >>
> >> >> OOM does a dump_stack() so this function's call tree is shown.
> >> >
> >> > A call stack doesn't tell you which device was being handled.
> >>
> >> Do you find a default Linux allocation failure report insufficient then?
> >>
> >> Would you like to to achieve that the requested information can be determined
> >> from a backtrace?
> >
> > It is not practical to do this.  The memory allocation routines do not
> > for what purpose the memory is being allocated; hence when a failure
> > occurs they cannot tell what device (or other part of the system) will
> > be affected.
> 
> If even allocation of 24 bytes fails, lots of other devices and other parts of
> the system will start failing really soon...

In fact, one wonders if the allocation routine's own error message and
stack trace would actually appear anywhere...

> > That's why we have a secondary error message.
> 
> ... and the secondary error message would still be useless.

Well, there is still a difference between GFP_ATOMIC and GFP_KERNEL 
allocations.  Failure of the first doesn't necessarily imply failure of 
the second, so perhaps the system could recover.

The real problem is that the kernel development community doesn't have
a fixed policy on how to handle memory allocation errors.  There are
several possibilities:

	Ignore them on the grounds that they will never happen.
	(Really?  And what is the size limit above which they
	might happen?)

	Ignore them on the grounds that the machine will hang or
	crash in the near future.  (Is this guaranteed?)

	Treat them like other errors: try to press forward (perhaps
	in a degraded mode).

	Treat them like other errors: log an error message and try
	to press forward.

And probably a few more that haven't occurred to me.  No doubt there 
are examples of each at various places in the kernel.  Nobody seems
able to agree on a single course of action.  Maybe not even Linus.

If there was one agreed-upon policy, then we could definitively point 
to old code and say "That's wrong, and here is how it should be fixed."  
But currently this is not possible, and we end up with repetitive 
discussions like this one that aren't of general use.

Alan Stern

