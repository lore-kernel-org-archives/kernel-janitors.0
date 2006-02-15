From: Greg KH <greg@kroah.com>
Date: Wed, 15 Feb 2006 17:05:10 +0000
Subject: Re: [KJ] [PATCH] Fix warning in drivers/usb/media/ov511.c
Message-Id: <20060215170510.GC1546@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7832421668709364=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139970072.25492.4.camel@localhost.localdomain>
In-Reply-To: <1139970072.25492.4.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============7832421668709364==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 15, 2006 at 05:30:21PM +0100, Nico Golde wrote:
> Hallo Greg,
> 
> * Greg KH <greg@kroah.com> [2006-02-15 11:14]:
> > On Tue, Feb 14, 2006 at 08:21:12PM -0600, Matthew Martin wrote:
> [...] 
> > >  	struct usb_ov511 *ov = cd_to_ov(cd);
> > > -	unsigned char exp;
> > > +	unsigned char exp = '\0';
> > 
> > What's wrong with just "0" here?
> 
> Nothing, doesnt matter.

Great, care to redo the patch then with 0?

thanks,

greg k-h

--===============7832421668709364==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7832421668709364==--
