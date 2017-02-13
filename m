From: Alan Stern <stern@rowland.harvard.edu>
Date: Mon, 13 Feb 2017 16:45:31 +0000
Subject: Re: [PATCH] usb: misc: usbtest: remove redundant check on retval < 0
Message-Id: <Pine.LNX.4.44L0.1702131142520.1905-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <8760keqshs.fsf@linux.intel.com>
References: <20170212183518.22528-1-colin.king@canonical.com>
In-Reply-To: <20170212183518.22528-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@nxp.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Lu Baolu <baolu.lu@linux.intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 13 Feb 2017, Felipe Balbi wrote:

> Hi,
> 
> Colin King <colin.king@canonical.com> writes:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The check for retval being less than zero is always true since
> > retval equal to -EPIPE at that point.  Replace the existing
> > conditional with just return retval.
> >
> > Detected with CoverityScan, CID#114349 ("Logically dead code")
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/usb/misc/usbtest.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> > index 3525626..17c0810 100644
> > --- a/drivers/usb/misc/usbtest.c
> > +++ b/drivers/usb/misc/usbtest.c
> > @@ -992,7 +992,7 @@ static int ch9_postconfig(struct usbtest_dev *dev)
> >  				dev_err(&iface->dev,
> >  						"hs dev qualifier --> %d\n",
> >  						retval);
> > -				return (retval < 0) ? retval : -EDOM;
> > +				return retval;
> 
> you're changing return value here, are you sure there's nothing else
> depending on this error?

I bet you didn't look at the original code.  :-)  Just before the start
of the patch there is:

		if (retval = -EPIPE) {
			...

So no, the patch does not change the return value.

Alan Stern

