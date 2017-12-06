From: Alan Stern <stern@rowland.harvard.edu>
Date: Wed, 06 Dec 2017 21:18:53 +0000
Subject: Re: [PATCH] USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buf
Message-Id: <Pine.LNX.4.44L0.1712061618140.1507-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <659939f3-da51-0cfd-2eb2-8a726cb1a42f@users.sourceforge.net>
In-Reply-To: <659939f3-da51-0cfd-2eb2-8a726cb1a42f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-usb@vger.kernel.org, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?ISO-8859-1?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, 6 Dec 2017, Joe Perches wrote:

> On Wed, 2017-12-06 at 11:45 -0500, Alan Stern wrote:
> > On Wed, 6 Dec 2017, SF Markus Elfring wrote:
> > > Omit an extra message for a memory allocation failure in this function.
> 
> Markus' typical terrible commit message.
> 
> > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> []
> > > @@ -829,7 +829,6 @@ int usb_hub_clear_tt_buffer(struct urb *urb)
> > >        */
> > >       clear = kmalloc(sizeof *clear, GFP_ATOMIC);
> > >       if (clear = NULL) {
> > > -             dev_err(&udev->dev, "can't save CLEAR_TT_BUFFER state\n");
> > >               /* FIXME recover somehow ... RESET_TT? */
> > >               return -ENOMEM;
> > >       }
> > 
> > Does the existing memory allocation error message include the 
> > &udev->dev device name and driver name?  If it doesn't, there will be 
> > no way for the user to tell that the error message is related to the 
> > device failure.
> 
> No, but the effect is similar.
> 
> OOM does a dump_stack() so this function's call tree is shown.

A call stack doesn't tell you which device was being handled.

Alan Stern

