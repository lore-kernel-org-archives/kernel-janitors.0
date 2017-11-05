From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 05 Nov 2017 07:30:13 +0000
Subject: Re: [PATCH] USB: core: Improve unlocking of a mutex in two functions
Message-Id: <20171105073013.GA1431@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0ff5f74e-ae23-5c97-8998-0e598ceae96b@users.sourceforge.net>
 <CAMuHMdUXn4YVPBFCoqmwcdU7eTWO5jy2ZXZQaAxPi1P5bM4q2A@mail.gmail.com>
In-Reply-To: <CAMuHMdUXn4YVPBFCoqmwcdU7eTWO5jy2ZXZQaAxPi1P5bM4q2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, USB list <linux-usb@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Eugene Korenevsky <ekorenevsky@gmail.com>, =?iso-8859-1?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Jaejoong Kim <climbbb.kim@gmail.com>, Johan Hovold <johan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Sun, Nov 05, 2017 at 12:25:19AM +0100, Geert Uytterhoeven wrote:
> On Sat, Nov 4, 2017 at 9:12 PM, SF Markus Elfring
> <elfring@users.sourceforge.net> wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sat, 4 Nov 2017 21:00:46 +0100
> >
> > * Add jump targets so that a call of the function "mutex_unlock" is stored
> >   only twice in these function implementations.
> >
> > * Replace five calls by goto statements.
> >
> > This issue was detected by using the Coccinelle software.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> NAKed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Don't worry, or waste your time, I don't take patches from this author
as they are in my blacklist.

greg k-h
