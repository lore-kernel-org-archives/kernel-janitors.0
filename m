From: Joe Perches <joe@perches.com>
Date: Tue, 15 Dec 2015 18:22:07 +0000
Subject: Re: staging: lustre: Delete unnecessary goto statements in six functions
Message-Id: <1450203727.4142.13.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	 <566D7733.1030102@users.sourceforge.net>
	 <566D7830.9060000@users.sourceforge.net>
	 <1450189676.3551.1.camel@perches.com> <20151215144133.GC5284@mwanda>
	 <1450191751.3551.14.camel@perches.com>
	 <567055C4.8000806@users.sourceforge.net>
In-Reply-To: <567055C4.8000806@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleg Drokin <oleg.drokin@intel.com>, lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Tue, 2015-12-15 at 19:02 +0100, SF Markus Elfring wrote:
> > This is the original code:
> Really =E2=80=A6?
> > 	result =3D baz();
> > 	if (result)
> > 		goto label;
> >=20
> > label:
> > 	go on...
>=20
> I do not see such a source code structure
> at the six places I propose to clean-up.
>=20
>=20
> > I don't find the test->goto label; label: use offensive,
> > but if he does, I think keeping a blank line in place of
> > the test->goto might be better.
>=20
> I find this an interesting view on source code layout.
> Are there any more opinions around such implementation details?

Or to put it another way, use a blank line before the
first or only label in an error/out block.

I don't find it different then commonly written blocks like:

void foo(void)
{
	...;

	wind1();

	val =3D func1(...);
	if (val) {
		printk(...);
		goto err_type;
	}

	wind2();

	val =3D func2(...);
	if (val) {
		printk(...);
		goto err_type2;
	}

	...

	return 0;

err_type2:
	unwind2();
err_type:
	unwind1();
	return -ERR;
}

Yes, you can elide all the blank lines, but using them can
help readability.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
