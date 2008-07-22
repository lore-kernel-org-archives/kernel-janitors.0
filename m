From: Julia Lawall <julia@diku.dk>
Date: Tue, 22 Jul 2008 19:18:27 +0000
Subject: Re: [PATCH 1/2] arch/ia64/kvm/kvm-ia64.c: Add local_irq_restore in
Message-Id: <Pine.LNX.4.64.0807222115210.2670@ask.diku.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-511516320-1442744024-1216754307=:2670"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807221843140.2670@ask.diku.dk>
 <1216753864.28082.11.camel@odie.local>
In-Reply-To: <1216753864.28082.11.camel@odie.local>
To: Simon Holm =?ISO-8859-1?Q?Th=F8gersen?= <odie@cs.aau.dk>
Cc: avi@qumranet.com, kvm@vger.kernel.org, xiantao.zhang@intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---511516320-1442744024-1216754307=:2670
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Jul 2008, Simon Holm Th=F8gersen wrote:

> tir, 22 07 2008 kl. 18:44 +0200, skrev Julia Lawall:
> > From: Julia Lawall <julia@diku.dk>
> >=20
> > There is a call to local_irq_restore in the normal exit case, so it wou=
ld
> > seem that there should be one on an error return as well.
> >=20
> > The semantic patch that makes this change is as follows:
> > (http://www.emn.fr/x-info/coccinelle/)
> >=20
> > // <smpl>
> > @@
> > expression l;
> > expression E,E1,E2;
> > @@
> >=20
> > local_irq_save(l);
> > ... when !=3D local_irq_restore(l)
> >     when !=3D spin_unlock_irqrestore(E,l)
> >     when any
> >     when strict
> > (
> > if (...) { ... when !=3D local_irq_restore(l)
> >                when !=3D spin_unlock_irqrestore(E1,l)
> > +   local_irq_restore(l);
> >     return ...;
> > }
> > |
> > if (...)
> > +   {local_irq_restore(l);
> >     return ...;
> > +   }
> > |
> > spin_unlock_irqrestore(E2,l);
> > |
> > local_irq_restore(l);
> > )
> > // </smpl>
> >=20
> > Signed-off-by: Julia Lawall <julia@diku.dk>
> >=20
> > ---
> >  arch/ia64/kvm/kvm-ia64.c      |    9 +++++++--
> >  1 files changed, 7 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/ia64/kvm/kvm-ia64.c b/arch/ia64/kvm/kvm-ia64.c
> > index 318b811..14e5c99 100644
> > --- a/arch/ia64/kvm/kvm-ia64.c
> > +++ b/arch/ia64/kvm/kvm-ia64.c
> > @@ -125,8 +125,10 @@ void kvm_arch_hardware_enable(void *garbage)
> >  				PAGE_KERNEL));
> >  	local_irq_save(saved_psr);
> >  	slot =3D ia64_itr_entry(0x3, KVM_VMM_BASE, pte, KVM_VMM_SHIFT);
> > -	if (slot < 0)
> > +	if (slot < 0) {
> > +		local_irq_restore(saved_psr);
> >  		return;
> > +	}
> >  	local_irq_restore(saved_psr);
>=20
> If this change makes sense, how about merging the two local_irq_restore
> calls and put them before the if? And shouldn't your checker be able to
> figure this?

No, it pretty much only does what it's told, which is to put a
local_irq_restore before the return. =20

Since slot is a local variable, it does seem like the call to=20
local_irq_restore could be safely moved upwards, so I will do that=20
instead.

thanks,
julia

---511516320-1442744024-1216754307=:2670--
