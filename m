From: Oliver Neukum <oneukum@suse.com>
Date: Thu, 07 Dec 2017 09:17:11 +0000
Subject: Re: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
Message-Id: <1512638231.17062.5.camel@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
In-Reply-To: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dmitry Fleytman <dmitry@daynix.com>, Daniel Drake <drake@endlessm.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, Dan Carpenter <dan.carpenter@oracle.com>, Joe Perches <joe@perches.com>, =?ISO-8859-1?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Alan Stern <stern@rowland.harvard.edu>, SF Markus Elfring <elfring@users.sourceforge.net>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>

Am Donnerstag, den 07.12.2017, 09:56 +0100 schrieb Greg Kroah-Hartman:
> On Thu, Dec 07, 2017 at 09:45:38AM +0100, Geert Uytterhoeven wrote:
> > 
> > A few comments (this is in response to a patch from Markus, so there have
> > to be lots of questions and uncertainties ;-)
> 
> Note, because of the patch author, I'm not applying it no matter what,
> so this discussion is really going nowhere.

We really need to come to a consensus on that question.
If those additional messages really are redundant, we could save
memory deleting them. Or alternatively, if they are not and we need to
know which device is hit, we should centralize that reporting
and tell the VM subsystem not the dump a stack trace.

	Regards
		Oliver

