From: Greg KH <greg@kroah.com>
Date: Thu, 20 Jan 2005 20:09:33 +0000
Subject: Re: [KJ] [PATCH] unified spinlock
Message-Id: <20050120200933.GA11617@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6265923063703831=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41EFCFDC.4060509@osdl.org>
In-Reply-To: <41EFCFDC.4060509@osdl.org>
To: kernel-janitors@vger.kernel.org

--===============6265923063703831==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 20, 2005 at 08:04:13PM +0000, Matthew Wilcox wrote:
> On Thu, Jan 20, 2005 at 08:50:47AM -0800, Greg KH wrote:
> > On Thu, Jan 20, 2005 at 07:44:24AM -0800, Randy.Dunlap wrote:
> > > Matthew Wilcox wrote:
> > > >I think this is referring to initialisation of spinlocks that are
> > > >allocated dynamically, not statically.  If a lock validator can't cope
> > > >with that, it needs to be fixed, IMO.
> > 
> > Yes, it is.  See the number of patches that have been flowing into the
> > kernel lately to fix this issue up.
> 
> However, the correct way to fix this is to use DEFINE_SPIN_LOCK, not to
> make static locks dynamically initialised.

Where ever possible, yes.

--===============6265923063703831==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6265923063703831==--
