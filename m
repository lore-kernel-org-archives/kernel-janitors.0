From: Greg KH <greg@kroah.com>
Date: Wed, 29 Jun 2005 16:58:53 +0000
Subject: Re: [KJ] cleanup-drivers_usb_serial_cypress_m8.patch
Message-Id: <20050629165853.GA24347@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16580295583006599=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200506292049.52068.adobriyan@gmail.com>
In-Reply-To: <200506292049.52068.adobriyan@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============16580295583006599==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 29, 2005 at 08:49:51PM +0400, Alexey Dobriyan wrote:
> > Reading this driver I noticed some trailing whitespaces and tabs so I
> > removed them with some 80th column fitting and a few more similar
> > things.
> 
> > --- quilt.orig/drivers/usb/serial/cypress_m8.c
> > +++ quilt/drivers/usb/serial/cypress_m8.c
> 
> > -			tty->termios->c_cflag = B4800 | CS8 | CREAD | HUPCL | CLOCAL;
> > +			tty->termios->c_cflag = B4800 | CS8 | CREAD | HUPCL |
> > +				CLOCAL;
> 
> Well, this should be changed to:
> 
> 			tty->termios->c_cflag =
> 					B4800 | CS8 | CREAD | HUPCL | CLOCAL;

Ick, no.  Why?  We don't inforce the 80 column rule that hard...

But if you really are worried about it try:

			tty->termios->c_cflag = B4800 | CS8 | CREAD | 
					        HUPCL | CLOCAL;

Which is more readable.

thanks,

greg k-h

--===============16580295583006599==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16580295583006599==--
