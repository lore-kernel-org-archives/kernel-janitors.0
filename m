From: Markus Grabner <grabner@icg.tugraz.at>
Date: Tue, 04 Dec 2012 21:22:12 +0000
Subject: Re: [Line6linux-devel] [PATCH] line6: Use kmemdup rather than duplicating its implementation
Message-Id: <4461097.8nbt8bgEO9@medialab>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354540825-17735-1-git-send-email-laurent.navet@gmail.com> <CAJSP0QXcv3CYE=4Ci=vRZQgHU=nDjAYx3kbbCnVgGfcn0seTDg@mail.gmail.com>
In-Reply-To: <CAJSP0QXcv3CYE=4Ci=vRZQgHU=nDjAYx3kbbCnVgGfcn0seTDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: line6linux-devel@lists.sourceforge.net
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Laurent Navet <laurent.navet@gmail.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

Am Montag, 3. Dezember 2012, 17:34:07 schrieb Stefan Hajnoczi:
> On Mon, Dec 3, 2012 at 2:20 PM, Laurent Navet <laurent.navet@gmail.com> 
wrote:
> > staging: line6: driver.c
> > 
> >  The semantic patch that makes this output is available
> >  in scripts/coccinelle/api/memdup.cocci.
> > 
> > Signed-off-by: Laurent Navet <laurent.navet@gmail.com>
> > ---
> > 
> >  drivers/staging/line6/driver.c |    5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/line6/driver.c
> > b/drivers/staging/line6/driver.c index f5c19b2..e1d6241 100644
> > --- a/drivers/staging/line6/driver.c
> > +++ b/drivers/staging/line6/driver.c
> > @@ -331,14 +331,13 @@ int line6_version_request_async(struct usb_line6
> > *line6)> 
> >         char *buffer;
> >         int retval;
> > 
> > -       buffer = kmalloc(sizeof(line6_request_version), GFP_ATOMIC);
> > +       buffer = kmemdup(line6_request_version,
> > +                       sizeof(line6_request_version), GFP_ATOMIC);
> > 
> >         if (buffer = NULL) {
> >         
> >                 dev_err(line6->ifcdev, "Out of memory");
> >                 return -ENOMEM;
> >         
> >         }
> > 
> > -       memcpy(buffer, line6_request_version,
> > sizeof(line6_request_version)); -
> > 
> >         retval = line6_send_raw_message_async(line6, buffer,
> >         
> >                                               sizeof(line6_request_version
> >                                               ));
> >         
> >         kfree(buffer);
> > 
> > --
> > 1.7.10.4
> 
> Your change is fine but I'm not sure whether we should allocate memory
> in the first place:
I can't remember the precise reason for this copy operation, it was related to 
which type of memory is allowed for a URB data block, and memory declared with 
"static const char[]" at global scope in the driver is not allowed. I just 
verified on my system (kernel 3.4.11) that requesting the device's firmware 
version doesn't work when passing the line6_request_version pointer directly 
(instead of its kmemdup copy), so I think the kmemdup is necessary here. It's 
a bit unsatisfactory to make a copy just because the original data is not 
accessible for whatever reason, but I don't know of a better solution. Maybe 
somebody else can clarify this or propose an alternative method?

	Kind regards,
		Markus

