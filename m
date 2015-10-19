From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 19 Oct 2015 09:32:34 +0000
Subject: Re: [PATCH] powerpc/prom: Avoid reference to potentially freed memory
Message-Id: <1445247154.30407.3.camel@ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444976055-19148-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <1444989750.12954.4.camel@ellerman.id.au> <mvrlh7$mjr$1@ger.gmane.org>
In-Reply-To: <mvrlh7$mjr$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linuxppc-dev@ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2015-10-16 at 22:09 +0200, Christophe JAILLET wrote:

> Le 16/10/2015 12:02, Michael Ellerman a =C3=A9crit :

> > As the kbuild robot detected you have left an extra "}" here.
> >=20
> > I don't mind too much if you send patches that aren't compile tested, b=
ut you
> > might save yourself some time by compiling them.
>=20
> Sorry about it, and thanks for your patience.
> IMHO, this should never happen and patches should be at least=20
> compile-tested.

Preferably yes. But for these sort of cleanup patches, where you're touching
lots of different arches, I realise it can be tedious to find all the vario=
us
cross compilers. So I'm willing to cut you a bit of slack :)

> I will be more careful and compile-test any new patch I submit.

Thanks.

cheers

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
