From: Matthew Wilcox <willy@debian.org>
Date: Mon, 15 Mar 2004 19:39:33 +0000
Subject: Re: [Kernel-janitors] [PATCH] - style fixes for kernel/cpu.c.
Message-Id: <20040315193933.GJ25059@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1079377456.28138.39.camel@telecentrolivre>
In-Reply-To: <1079377456.28138.39.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Mar 15, 2004 at 04:30:56PM -0300, Luiz Fernando Capitulino wrote:
> Why they are bad ?
>=20
> Em Seg, 2004-03-15 =E0s 16:18, Matthew Wilcox escreveu:
> > > -	if (cpu_online(cpu)) {
> > > +	ret =3D cpu_online(cpu);
> > > +	if (ret) {
> > >  		ret =3D -EINVAL;
> > >  		goto out;
> > >  	}
> > > +
> >=20
> > This one is bad.

It's bad because the changed form reads worse than the previous one.

Before:

	"if cpu is online, set ret to -EINVAL and go to out"

After:

	"set ret to the result of cpu_online, check ret for being non-zero,
	 set ret to -EINVAL and go to out"

> > > @@ -49,8 +52,9 @@ int __devinit cpu_up(unsigned int cpu)
> > > =20
> > >  	/* Arch-specific enabling code. */
> > >  	ret =3D __cpu_up(cpu);
> > > -	if (ret !=3D 0)
> > > +	if (ret)
> > >  		goto out_notify;
> > > +
> >=20
> > I wouldn't change this one, personally.

This one seems more of a matter of opinion.  Not worth changing.

> > > @@ -58,7 +62,7 @@ int __devinit cpu_up(unsigned int cpu)
> > >  	notifier_call_chain(&cpu_chain, CPU_ONLINE, hcpu);
> > > =20
> > >  out_notify:
> > > -	if (ret !=3D 0)
> > > +	if (ret)
> > >  		notifier_call_chain(&cpu_chain, CPU_UP_CANCELED, hcpu);
> > >  out:
> > >  	up(&cpucontrol);
> >=20
> > This one's a bit dodgy too.

This one I don't have much preference about.  I think it all depends
how you read it.

--=20
"Next the statesmen will invent cheap lies, putting the blame upon=20
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince=20
himself that the war is just, and will thank God for the better sleep=20
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
