From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 20 Jan 2005 15:47:59 +0000
Subject: Re: [KJ] [PATCH] unified spinlock
Message-Id: <20050120154759.GJ25940@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34387416299139351=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41EFCFDC.4060509@osdl.org>
In-Reply-To: <41EFCFDC.4060509@osdl.org>
To: kernel-janitors@vger.kernel.org

--===============34387416299139351==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 20, 2005 at 07:35:56AM -0800, Randy.Dunlap wrote:
> Matthew Wilcox wrote:
> >On Thu, Jan 20, 2005 at 08:56:18PM +0530, Amit Gud wrote:
> >
> >>Unify the spinlock initialization as far as possible.
> >
> >
> >Why would you want to replace a statically initialised spinlock with
> >one that's initialised at runtime?
> 
> I wondered that also, since I prefer the compile-time inits myself.
> so I looked at the KJ TODO list
> <http://janitor.kernelnewbies.org/TODO> and it says:
> 
> From: Jonathan Corbet
> 
> Unified spinlock initialization:
> convert all explicit lock initializations to spin_lock_init() or
> rwlock_init().  (Besides consistency this also helps automatic lock
> validators and debugging code.)
> 
> http://lwn.net/Articles/109505/
> http://linux.bkbits.net:8080/linux-2.6/cset@419a6f292wHnthuDzw7VfgECNLmvLg?nav=index.html|ChangeSet@-8w
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> I don't find the consistency part compelling at all.
> If the change helps some static source analyzers, however, that would
> be a good thing, but not a strong one (IMO).

I think this is referring to initialisation of spinlocks that are
allocated dynamically, not statically.  If a lock validator can't cope
with that, it needs to be fixed, IMO.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============34387416299139351==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34387416299139351==--
