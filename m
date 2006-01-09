From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 09 Jan 2006 19:29:32 +0000
Subject: Re: [KJ] linux-2.6.15-rc7/drivers/pci/syscall.c
Message-Id: <20060109192932.GR19769@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77355333170267804=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601091138.03704.cneira@srb.cl>
In-Reply-To: <200601091138.03704.cneira@srb.cl>
To: kernel-janitors@vger.kernel.org

--===============77355333170267804==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2006 at 11:12:01AM -0800, Greg KH wrote:
> On Mon, Jan 09, 2006 at 08:02:19PM +0100, Jesper Juhl wrote:
> > On 1/9/06, Greg KH <greg@kroah.com> wrote:
> > > On Mon, Jan 09, 2006 at 11:38:03AM +0000, carlos neira wrote:
> > > > Greetings :
> > > >
> > > > patch :linux-2.6.15-rc7/drivers/pci/syscall.c
> > > >
> > > > replaced a  lock_kernel with spinlocks  , compile tested ok
> > >
> > > What arch did you compile this for?
> > >
> > > And why remove the lock_kernel calls here, are they hurting anything?
> 
> "over time, if it makes sense to do so."  
> 
> For this specific example, the code should be converted to the kthread
> api, which would remove these instances.

I think you're confused with which patch is being commented on.  The locks
around daemonize() should be converted to kthread(), but this patch is
for the PCI syscalls.  As I said in a recent post to linux-pci, I think
they can be deleted without bad effect.


--===============77355333170267804==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77355333170267804==--
