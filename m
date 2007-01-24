From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 24 Jan 2007 20:43:06 +0000
Subject: Re: [KJ] script to flag "dead" CONFIG variables
Message-Id: <Pine.LNX.4.64.0701241539440.4678@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701240736110.7569@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701240736110.7569@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, 24 Jan 2007, walter harms wrote:

> hi robert, are you aware of ifnames ? it is part auf the autoconf
> tools and lists all the #if #elif etc.
>
> that should surface all important vars and a compare with kconfig
> should show up any dead variables. bonus points for collecting all
> #defines also.

ok, i've rewritten the script using "ifnames" and i'm getting a *lot*
more "dead" config variables, just based on the fact that i'm pulling
more CONFIG variables out of preprocessor lines than i was before.

the updated script is again at:

http://www.fsdev.dreamhosters.com/wiki/index.php?title=DEad_CONFIG_variables

and it's taking a *while* to run.  yowch.  so far, it's found 407 dead
variables as compared to 284 last time, and it's still working on the
"S"s.

rday

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=3DKernel_Janitor%27s=
_Todo_List
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
