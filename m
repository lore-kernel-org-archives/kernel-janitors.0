From: Rodrigo Nascimento <underscore0x5f@gmail.com>
Date: Thu, 07 Jul 2005 21:40:24 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/qlogicfc.c: It's changes
Message-Id: <cbecb304050707144058102030@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050707010526.GA5406@garfield.casa.sp.br>
In-Reply-To: <20050707010526.GA5406@garfield.casa.sp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

qla2xxx is OK!
So, I need to redo qlogicfc.c, or not?

--
Rodrigo Nascimento

On 7/7/05, Patrick Mansfield <patmans@us.ibm.com> wrote:
> On Thu, Jul 07, 2005 at 01:56:51PM -0700, Greg KH wrote:
> > On Thu, Jul 07, 2005 at 08:25:56PM +0100, Matthew Wilcox wrote:
> > > On Thu, Jul 07, 2005 at 12:01:38PM -0700, Greg KH wrote:
> > > > Please read the description of how pci_get_device() works.  In short it
> > > > increments the reference count of the pci_dev that is returned.  Later
> > > > on in this function, that pointer is saved off into a structure, which
> > > > is fine.  Problem happens when that larger structure is freed when the
> > > > device or driver is removed.  You need to decrement the usage count of
> > > > that structure at that point in time.
> > > >
> > > > Care to redo this?
> 
> qlogicfc is nearly dead, don't bother updating it, use the qla2xxx driver
> instead. hch sent a patch to mark it broken, AFAICT patch was not included
> anywhere, mabye because some people are still using it (well at least one
> open-ended complaint on the thread).
> 
> Reference this thread (from February 2005):
> 
> http://marc.theaimsgroup.com/?l=linux-scsi&m0805956618612&w=2
> 
> -- Patrick Mansfield
> 
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 
> 


-- 
Rodrigo Nascimento

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
