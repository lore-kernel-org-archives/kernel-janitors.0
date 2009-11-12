From: =?ISO-8859-1?Q?J=F6rg-Volker_Peetz?= <jvpeetz@web.de>
Date: Thu, 12 Nov 2009 10:17:24 +0000
Subject: Re: [PATCH 1/4] drivers/net/enic: decrement sizeof size in strncmp
Message-Id: <4AFBE0B4.6070904@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911120848100.16627@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911120848100.16627@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Law all <julia@diku.dk>
>=20
> As observed by Joe Perches, sizeof of a constant string includes the
> trailing 0.  If what is wanted is to check the initial characters of
> another string, this trailing 0 should not be taken into account.  If an
> exact match is wanted, strcmp should be used instead.
>=20
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @@
> expression foo;
> constant char *abc;
> @@
>=20
> strncmp(foo, abc,=20
> - sizeof(abc)
> + sizeof(abc)-1
>  )
> // </smpl>
>=20
<snip>
How about this pattern (uses length of first argument):

strncmp(foo, abc,
- sizeof(foo)

?
--=20
Best regards,
J=F6rg-Volker.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
