From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Dec 2017 11:11:44 +0000
Subject: Re: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
Message-Id: <20171208111144.qneozhok457wuukj@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
In-Reply-To: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, USB list <linux-usb@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?iso-8859-1?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Dec 06, 2017 at 09:20:05PM +0100, Geert Uytterhoeven wrote:
> Hi Markus,
> 
> On Wed, Dec 6, 2017 at 6:51 PM, SF Markus Elfring
> <elfring@users.sourceforge.net> wrote:
> >> The system will come to a grinding halt anyway if it can't allocate 24 or 40 bytes.
> >
> > Maybe.
> 
> Since you've been sending zillions of patches for this, perhaps the time
> is ripe to actually try to trigger this, and see what happens?
> 
> >> Which is BTW more or less the amount of memory saved by killing
> >> the useless (error) message.
> >
> > Would you dare to resend this update suggestion after such a view?
> 
> Of course. That was implied.
> 

No.  Greg maintains USB and he's has blocked Markus, because he never
listens to feedback but instead just repsonds that he has a different
opinion.

regards,
dan carpenter

