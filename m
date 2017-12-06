From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Dec 2017 13:18:34 +0000
Subject: Re: [PATCH] USB: emi26: Delete an error message for a failed memory allocation in emi26_writememory(
Message-Id: <20171206131834.qxlswkis72wmzed7@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <244f8baf-0cd7-89f5-b210-7c321e180f11@users.sourceforge.net>
In-Reply-To: <244f8baf-0cd7-89f5-b210-7c321e180f11@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-usb@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 06, 2017 at 01:12:32PM +0100, Julia Lawall wrote:
> 
> 
> On Wed, 6 Dec 2017, SF Markus Elfring wrote:
> 
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 6 Dec 2017 13:03:21 +0100
> >
> > Omit an extra message for a memory allocation failure in this function.
> >
> > This issue was detected by using the Coccinelle software.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/usb/misc/emi26.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/misc/emi26.c b/drivers/usb/misc/emi26.c
> > index 24d841850e05..654e93857d65 100644
> > --- a/drivers/usb/misc/emi26.c
> > +++ b/drivers/usb/misc/emi26.c
> > @@ -42,10 +42,9 @@ static int emi26_writememory (struct usb_device *dev, int address,
> >  	int result;
> >  	unsigned char *buffer =  kmemdup(data, length, GFP_KERNEL);
> >
> > -	if (!buffer) {
> > -		dev_err(&dev->dev, "kmalloc(%d) failed.\n", length);
> 
> I guess the length information would not be so easy to find in the
> backtrace.
> 

I think it prints the "order" but not the exact size.

regards,
dan carpeneter
