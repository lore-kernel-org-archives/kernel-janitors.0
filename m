From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
Date: Sat, 22 Aug 2020 03:35:38 +0000
Subject: Re: [Cocci] coccinelle: Convert comma to semicolons (was Re: [PATCH] checkpatch: Add test for comma 
Message-Id: <162653.1598067338@turing-police>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="==_Exmh_1598067338_2109P"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org>
 <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
 <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com>
 <alpine.DEB.2.22.394.2008201021400.2524@hadrien>
 <a5713d8597065ef986f780499428fcc4cd31c003.camel@perches.com>
 <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
 <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
In-Reply-To: <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
To: Joe Perches <joe@perches.com>
Cc: Giuseppe Scrivano <gscrivan@redhat.com>, kernelnewbies <kernelnewbies@kernelnewbies.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel-mentees@lists.linuxfoundation.org, cocci <cocci@systeme.lip6.fr>

--==_Exmh_1598067338_2109P
Content-Type: text/plain; charset=us-ascii

On Fri, 21 Aug 2020 18:08:08 -0700, Joe Perches said:
> (forwarding on to kernel-janitors/mentees and kernelnewbies)
>
> Just fyi for anyone that cares:
>
> A janitorial task for someone might be to use Julia's coccinelle
> script below to convert the existing instances of commas that
> separate statements into semicolons.

Note that you need to *really* check for possible changes in semantics.
It's *usually* OK to do that, but sometimes it's not...

for (i=0; i++, last++; !last) {

changing that comma to a ; will break the compile.  In other cases, it can
introduce subtle bugs.

> > I do appreciate that coccinelle adds braces for multiple
> > expression comma use after an if.
> >
> > i.e.:
> > 	if (foo)
> > 		a = 1, b = 2;
> > becomes
> > 	if (foo) {
> > 		a = 1; b = 2;
> > 	}

Yeah.  Like there, if you forget to add the {}.

--==_Exmh_1598067338_2109P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBX0CSigdmEQWDXROgAQKNCQ/8DDgTmFpZiCAqadYFLPHzj4cazPnhAUXW
F7pYc//dQ403pifqc84z6kGRQsocCpaXTMRzYfSe/EMYP/oCLxYr+qvbG2UJg1qs
ltyI+7Z3UY0lz/OxBmzwm+/QmCc5YHpEZ+eK4zmQwgP4KfgjD8BDrraWqAueAHi2
mOBcWxQ2/KcYwN4dvDJ3ESRJyiws6KOfCe4a216h1mpc+u94zgmRUkUXBxVNZQB+
Ew3a+GI5cLTAXt9JbSrakXqoj/sH9+GqJnJ1T0flu/mBhs5gRRXDmcfoEDgxUeJQ
T+5Yunwj00vqcCql+G6jOaLvBcPnxI2xx7UaOIzl3JO+4wQZOjj6JC3EJjpLYtLL
RZGwHt/35XSJV6Tci/tAE/5H7twYwhig68ChnuGAOgxm2yg1sUxpKdgl/K6u+qOs
xIzp1f66xWljUPSx7xJxxc1445gd1I6udjeY8tUP2wVLlUseD4L2JwJInRvfufy5
7dN3nTy4e1s3Vu5P6CK4PntJagNPNm83EQtBk9a0A3skoPZyADW1UUCPRhIdy/te
Z1IC/I3rGRw6lVzVZR8tXox70QhVBRHLL99Zxv4w5DedB0dDNsu7//pE3YSQrRW+
t2vRvfBi0Nz6MZVxMMV/uMHa4sqJjqt9T4JD3uijdvQFkMxtm5o6cSXWuAobIU/T
w6QQ1Tjr1Z4=
=9BEy
-----END PGP SIGNATURE-----

--==_Exmh_1598067338_2109P--
