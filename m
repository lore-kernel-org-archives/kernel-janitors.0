From: Greg KH <greg@kroah.com>
Date: Wed, 15 Feb 2006 23:27:36 +0000
Subject: Re: [KJ] [PATCH] Fix warning in drivers/usb/media/ov511.c
Message-Id: <20060215232736.GA10232@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47935542809397136=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139970072.25492.4.camel@localhost.localdomain>
In-Reply-To: <1139970072.25492.4.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============47935542809397136==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 16, 2006 at 12:16:35AM +0100, H?kon L?vdal wrote:
> On 2/15/06, Greg KH <greg@kroah.com> wrote:
> > On Tue, Feb 14, 2006 at 08:21:12PM -0600, Matthew Martin wrote:
> > > -     unsigned char exp;
> > > +     unsigned char exp = '\0';
> >
> > What's wrong with just "0" here?
> 
> In my opinion '\0' is the correct representation here.
> 
> '\0'	ASCII nul character
> 0	arithmetic value zero
> NULL	null pointer

If you look at how this variable is used, it's not used as an ASCII
value, but rather as a arithmetic value.

That is why I said it should be 0, not '\0'.

thanks,

greg k-h

--===============47935542809397136==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47935542809397136==--
