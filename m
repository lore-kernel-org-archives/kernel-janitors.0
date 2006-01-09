From: Greg KH <greg@kroah.com>
Date: Mon, 09 Jan 2006 19:12:01 +0000
Subject: Re: [KJ] linux-2.6.15-rc7/drivers/pci/syscall.c
Message-Id: <20060109191201.GA22772@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75875588038307962=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601091138.03704.cneira@srb.cl>
In-Reply-To: <200601091138.03704.cneira@srb.cl>
To: kernel-janitors@vger.kernel.org

--===============75875588038307962==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2006 at 08:02:19PM +0100, Jesper Juhl wrote:
> On 1/9/06, Greg KH <greg@kroah.com> wrote:
> > On Mon, Jan 09, 2006 at 11:38:03AM +0000, carlos neira wrote:
> > > Greetings :
> > >
> > > patch :linux-2.6.15-rc7/drivers/pci/syscall.c
> > >
> > > replaced a  lock_kernel with spinlocks  , compile tested ok
> >
> > What arch did you compile this for?
> >
> > And why remove the lock_kernel calls here, are they hurting anything?
> >
> I can't comment on the specific patch, but in general I thought we
> wanted to get rid of lock_kernel() / unlock_kernel() over time?  If
> that is indeed the case, then patches like this one are a step in the
> right direction - no?

"over time, if it makes sense to do so."  

For this specific example, the code should be converted to the kthread
api, which would remove these instances.

thanks,

greg k-h

--===============75875588038307962==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75875588038307962==--
