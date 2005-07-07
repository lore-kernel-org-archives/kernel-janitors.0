From: Greg KH <greg@kroah.com>
Date: Thu, 07 Jul 2005 20:56:51 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/qlogicfc.c: It's changes
Message-Id: <20050707205651.GA31263@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92907288904466379=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050707010526.GA5406@garfield.casa.sp.br>
In-Reply-To: <20050707010526.GA5406@garfield.casa.sp.br>
To: kernel-janitors@vger.kernel.org

--===============92907288904466379==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 07, 2005 at 08:25:56PM +0100, Matthew Wilcox wrote:
> On Thu, Jul 07, 2005 at 12:01:38PM -0700, Greg KH wrote:
> > Please read the description of how pci_get_device() works.  In short it
> > increments the reference count of the pci_dev that is returned.  Later
> > on in this function, that pointer is saved off into a structure, which
> > is fine.  Problem happens when that larger structure is freed when the
> > device or driver is removed.  You need to decrement the usage count of
> > that structure at that point in time.
> > 
> > Care to redo this?
> 
> Have we given up on getting people to convert drivers to the pci_driver
> model then?

Not at all.  But that's a much harder task :(

thanks,

greg k-h

--===============92907288904466379==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92907288904466379==--
