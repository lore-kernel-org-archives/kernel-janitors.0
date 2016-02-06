From: Joe Perches <joe@perches.com>
Date: Sat, 06 Feb 2016 23:08:50 +0000
Subject: Re: [PATCH] checkpatch.pl: fix naked sscanf false positives
Message-Id: <1454800130.21293.6.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160205082952.GA18361@kwern-VirtualBox>
In-Reply-To: <20160205082952.GA18361@kwern-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sat, 2016-02-06 at 13:24 -0800, Kevin Wern wrote:
> On Sat, Feb 6, 2016 at 9:20 AM, Joe Perches <joe@perches.com> wrote:
> >=20
> > It's a single line sscanf vs multi-line sscanf issue
> >=20
> > $line works on
> > =A0=A0=A0=A0=A0=A0=A0=A0ret =3D sscanf(buf, &foo, &bar);
> >=20
> > $stat works on that and
> > =A0=A0=A0=A0=A0=A0=A0=A0ret =3D sscanf(buf,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0&foo,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0&bar);
> >=20
>=20
> Ah, ok. I dont think having just the ending paren will work though
> because the
> paren can be on the next line, so the pre-patch statement is most
> correct.
> What we should do, then, is something like:

Not really.

That'd only find an additional
	sscanf
		(buf,
		=A0foo,
		=A0bar);

And that's quite unlikely.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
