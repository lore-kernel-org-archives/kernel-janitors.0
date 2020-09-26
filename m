From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
Date: Sat, 26 Sep 2020 19:11:44 +0000
Subject: Re: [Cocci] coccinelle: Convert comma to semicolons (was Re: [PATCH] checkpatch: Add test for comma 
Message-Id: <173999.1601147504@turing-police>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="==_Exmh_1601147504_3912P"
List-Id: <kernel-janitors.vger.kernel.org>
References: <87r1qqvo2d.fsf@nanos.tec.linutronix.de>
 <a53048f738dacc1c58654eb94e229de79d4f94c2.camel@perches.com>
 <alpine.DEB.2.22.394.2009251904540.2772@hadrien>
 <58673398c6b836ebd7509f787e6f0d10bfd751bc.camel@perches.com>
In-Reply-To: <58673398c6b836ebd7509f787e6f0d10bfd751bc.camel@perches.com>
To: Joe Perches <joe@perches.com>
Cc: Giuseppe Scrivano <gscrivan@redhat.com>, kernelnewbies <kernelnewbies@kernelnewbies.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, cocci <cocci@systeme.lip6.fr>, Andy Whitcroft <apw@shadowen.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel-mentees@lists.linuxfoundation.org, Andrew Morton <akpm@linux-foundation.org>

--==_Exmh_1601147504_3912P
Content-Type: text/plain; charset=us-ascii

On Fri, 25 Sep 2020 10:26:27 -0700, Joe Perches said:
> And the generic individual maintainer apply rate for
> each specific patch is always less than 50%.
>
> For instance the patches that converted the comma uses
> in if/do/while statements to use braces and semicolons
> from a month ago:

> 29 patches, 13 applied.

To be fair, it's *always* been hard to get pure style patches applied, because
they usually hit one of two types of code, with different results:

Some of them hit code that's been stable for a long time - and those patches
don't get applied because of the (admittedly small) risk that a "style" patch
may actually break something - yes, that *does* happen often enough to worry a
risk-adverse subtree maintainer.

Some of them hit code that's actively being worked on - and those patches don't
get applied because they can cause merge conflicts.

This is a hard problem to fix, because it's difficult to say that either of
those viewpoints is *totally* wrong. At best, you can make the case that some
maintainers are a tad over-zealous on their attitude. And since its *hard* to
find good maintainers, it's not possible to fix the problem by just putting
somebody else in charge of a subtree. It's theoretically possible to bypass a
problematic maintainer by sending the patch to the person one level up, or
directly to Linus - but although that usually works if you have an urgent patch
and the maintainer is on vacation or stubborn or whatever, that's got
essentially zero chance of succeeding for a mere style patch.

Unfortunately, although I understand the problem, I don't have a solution. It's
easy to tactfully say "this code is wrong, and here is the fix".  It's a lot
harder to find a tactful way to say "This person is wrong and should do it this
way", because code doesn't fight back when you offer constructive criticism....



--==_Exmh_1601147504_3912P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBX2+ScAdmEQWDXROgAQI8Ag//YKel+oxk8JlWyUFEbQz41v44EhWHlykN
LLlOnRINghANJbunFpoUgD+KW9I9mPy8MmbdF+SeQq8fT+g5qfIwsYNsTeJI/Bu8
K3ksbdy6qcuqO5ZmfqS9d1VYykaAXbIi1OqTa6gkX60EU+c1zLuCo78gFyO0c27T
193bWbUG7iCkEXN3261e+a8p1XvQOUtRULuedBbyUQ9GmIEv8oLOMErq4YSBVx5t
k/FKSrRfu5ZesBbxOOzGpPQXMpq64vwatpcZlNs6fKZjnzgmCYtnSzMCZ13bhkGE
zPQQs1Ak0c1GmBVTlZVYHUNNLG4SKdHchF9yKZ5gooqLu1eWEg6O5WxeMWAjIQ1d
qbxKveWY0E8xj0PM//BgyZraCRrAT8KGcpXjFEWtsw07dKD3hnpdXg2PlrX972v2
BPk+M7pGEe/qZJPdGiptefli6zxtuv+hQI9sVif99+FRQ3RlKx4/xte1O7iKn3/N
wzXNZ7pFG0UPGIkM5pEzUWv1VmBXoZqDT9qqanHNZDkRjYuv0IouI0QWaZ5v363E
SOK0YBnHPUHA+bMOek59eof91yAwzgCqUrmAlZ3T/AKKHY1jUIujKbr/zVhAfa9b
x0mn/NSmOmLc86BSgNKrAhxkbfoOzPnwnMVx1AHMhzZ43mlsaNyDz09SomWDWkzX
GcnpFZnyRSo=
=Cdbo
-----END PGP SIGNATURE-----

--==_Exmh_1601147504_3912P--
