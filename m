From: Patrick Mansfield <patmans@us.ibm.com>
Date: Thu, 07 Jul 2005 21:23:52 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/qlogicfc.c: It's changes
Message-Id: <20050707212352.GA416@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73801061683062263=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050707010526.GA5406@garfield.casa.sp.br>
In-Reply-To: <20050707010526.GA5406@garfield.casa.sp.br>
To: kernel-janitors@vger.kernel.org

--===============73801061683062263==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 07, 2005 at 01:56:51PM -0700, Greg KH wrote:
> On Thu, Jul 07, 2005 at 08:25:56PM +0100, Matthew Wilcox wrote:
> > On Thu, Jul 07, 2005 at 12:01:38PM -0700, Greg KH wrote:
> > > Please read the description of how pci_get_device() works.  In short it
> > > increments the reference count of the pci_dev that is returned.  Later
> > > on in this function, that pointer is saved off into a structure, which
> > > is fine.  Problem happens when that larger structure is freed when the
> > > device or driver is removed.  You need to decrement the usage count of
> > > that structure at that point in time.
> > > 
> > > Care to redo this?

qlogicfc is nearly dead, don't bother updating it, use the qla2xxx driver
instead. hch sent a patch to mark it broken, AFAICT patch was not included
anywhere, mabye because some people are still using it (well at least one
open-ended complaint on the thread).

Reference this thread (from February 2005):

http://marc.theaimsgroup.com/?l=linux-scsi&m=110805956618612&w=2

-- Patrick Mansfield

--===============73801061683062263==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73801061683062263==--
