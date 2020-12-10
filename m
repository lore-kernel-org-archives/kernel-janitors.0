From: Joe Perches <joe@perches.com>
Date: Thu, 10 Dec 2020 18:13:40 +0000
Subject: Re: [PATCH] checkpatch: Fix "Missing a blank line after declarations" test on patches
Message-Id: <c0382efac23a4fb18f31974b80f25558cada7243.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201210175235.65657-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201210175235.65657-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, apw@canonical.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2020-12-10 at 18:52 +0100, Christophe JAILLET wrote:
> "Missing a blank line after declarations" is not triggered on patches.

That's not true.
It does work on any patch that does a new function addition.
There are some patch context complications here when lines are
added and removed such that '+' add, '-' delete, and ' ' context
testing isn't always obvious.

So, the code was intentionally limited to just new functions.

If there are simple ways to avoid false positives, great, but I
believe it's not trivial.

> Tweak the regex to match such cases.

Please send multiple patch examples of different forms where it
does not work.

> This patch is mostly a PoC. I don't know enough about checkpatch.pl to be
> sure that the fix is the right thing to do.
> At least, it works for me :)

Always a starting point...

>=20
> The [\+ ] is taken from the test just above.
>=20
> I also wonder if there is a missing ^ in the last test:
> =A0=A0(($prevline =3D~ /[\+ ](\s+)\S/) && $sline =3D~ /^[\+ ]$1\S/))
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0^
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0|___ here
