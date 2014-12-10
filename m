From: Valdis.Kletnieks@vt.edu
Date: Wed, 10 Dec 2014 01:50:47 +0000
Subject: Re: List my Staging Drivers
Message-Id: <72569.1418176247@turing-police.cc.vt.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="==_Exmh_1418176247_3854P"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAJyon0tny1BjTUDN3WF=cXAKQ5u6_jHUAfOuW6m7NzLsnxmGvQ@mail.gmail.com>
	<42976981.0zcCP3BMYl@mayhem>
	<CAK25hWMJJJ_ChunXcZEgbuo1EHQEPF+dWnp5CwXtxcz7=1QZWQ@mail.gmail.com>
	<CAJyon0u7J7x2+7syeEZUpwNHjemYO14Gp2LELcpm-dkrE3pEmA@mail.gmail.com>
	<CAJyon0vqHauxYxy0=efGr1Hpk6pE5mQUUTutDj5jMSf6u_Ysgw@mail.gmail.com>
In-Reply-To: Your message of "Tue, 09 Dec 2014 22:18:48 -0200."
	<CAJyon0vqHauxYxy0=efGr1Hpk6pE5mQUUTutDj5jMSf6u_Ysgw@mail.gmail.com>
To: kernelnewbies@lists.kernelnewbies.org

--==_Exmh_1418176247_3854P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Dec 2014 22:18:48 -0200, Lucas Tanure said:

> This command:
>=20
> =24 lsmod  =7C grep -Eo '=5E=5B=5E =5D+' =7C sed 1d =7C xargs modinfo =
=7C grep filename

Note that only finds stuff that's been built with CONFIG_FOOMOD=3Dm,  Mod=
ules
that were built into the kernel with =3Dy won't show on an lsmod.  On my =
laptop
at the moment:

% lsmod =7C wc -l
34
% ls /sys/module =7C wc -l
129

Quite obviously, relying on lsmod isn't going to help.

So you really want something like:

% ls /sys/module =7C xargs modinfo 2> /dev/null =7C grep filename
% echo the following are built-in; echo =60ls /sys/module =7C xargs modin=
fo 2>&1 > /dev/null =7C awk '=7Bprint =244=7D'=60

The following *seems* to work.  I admit I haven't tested it against a dis=
tro kernel
where the build/ and source/ symlinks may point different places, etc etc=
...

find /lib/modules/=60uname -r=60/build/ =60ls /sys/module =7C xargs modin=
fo 2>&1 > /dev/null =7C awk '=7Bprint =22 -name =22 =244=22.o -o=22=7D EN=
D =7Bprint =22-name null=22=7D'=60

(And even the 129 entries in /sys/module doesn't cover the whole story.

find /lib/modules/3.18.0-next-20141208/build/ -name '*.o' =7C wc -l
4257
zgrep =3Dy /proc/config.gz =7C wc -l
1072

So there's *lots* more chunks of code that are builtin as options that
simply don't identify as =22modules=22.  At that point, it's time to re-a=
sk
what question you *really* wanted answered. =22Find drivers that I'm usin=
g=22
is *not* the same thing as =22what modules do I have=22....



--==_Exmh_1418176247_3854P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Exmh version 2.5 07/13/2001

iQIVAwUBVIem9wdmEQWDXROgAQIktw//WL707TKMlAHpFrqtrXuI9RmhsNJC/qzK
h1ze4gaiGuh1SjLTqtG4oOv7li4mFJgu3j1ona3PkGZcE05QCI60CIQy9gkjgAgj
f8hHMSPMMvv8jB8uUxeRjAe9wND688+8r0Ppkzt0OgklpYUW32Os7kX3poCEMed9
h3+mfgwHfJl8yzXT1H1kTG91dK4VAlGgtnUsksFDdsjcpa0f66buPiZuFpWYM4U8
py/XqjU2JOVDheuiLiil+jrQVDuVEJQfCugdEH6IXr0gBdRzJxmrQ/QaD+F8LwZl
C972M4nFUiyTWKKg/5oGSlyi8MRzK+GaOIPxc7uSC664WS5c56m2gObH05eyCK0c
PqgCnU2Kgu7YssBQnrpQNbbOr2PvvrOPuxVhPWlEpI/zxoEkxcMakij33SCgKjOd
BGTP+CFne/Oyj+H0t9nJHwJV6/0jHYiXXlOFezkPxUL6Xt2Qk8a8mWOQnpdpyGqr
ivb7DV9oohwY223/ykp5kVCQ1SlF9QxyPqjqJcAEAr9a6OQe4GdS3ZjuNRbagibk
I3lWifIuzPoWwNl2oBcLCzUV3B3uilZvaYdhABHX082tcjRJmtZz5I5IoX9cwQSs
VBWxj0jB0uxTlPj8Li/LZtekRPpCcr3QQXmMCI8AYjyfPcQEdSUnAWSIU66P1GB6
EbZgeDEcN1A=
=zomX
-----END PGP SIGNATURE-----

--==_Exmh_1418176247_3854P--
