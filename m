From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Dec 2017 08:35:42 +0000
Subject: Re: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
Message-Id: <20171207083542.gohu4z3v4fp7gvsu@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
In-Reply-To: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, SF Markus Elfring <elfring@users.sourceforge.net>, USB list <linux-usb@vger.kernel.org>, Joe Perches <joe@perches.com>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?iso-8859-1?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, Dec 07, 2017 at 08:40:07AM +0100, Geert Uytterhoeven wrote:
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
> 

Small allocations never fail in the current kernel.

regards,
dan carpenter

