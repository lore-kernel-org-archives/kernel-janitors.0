From: Eric Anholt <eric@anholt.net>
Date: Thu, 01 Jul 2010 22:59:43 +0000
Subject: Re: [PATCH] drm/i915: fix warn, struct may be used uninitialized
Message-Id: <87wrtezu3k.fsf@pollan.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100616145452.GA30948@lovely.krouter>
In-Reply-To: <20100616145452.GA30948@lovely.krouter>
To: kernel-janitors@vger.kernel.org

--=-=-=
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Jun 2010 15:27:29 +0200, Christoph Fritz <chf.fritz@googlemail.c=
om> wrote:
> I meant to send the following patch.
>=20
> Thanks for pointing out,
>   chf

I went with a simpler one from another submitter that didn't change the
structure of the function.

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEARECAAYFAkwtHd8ACgkQHUdvYGzw6vf0tQCYxzDUuBKmzFE0a/Uozpdj0QW8
YQCdH2B4W3AjLMI0prVwBtYj3V//Hlk=
=u1Dm
-----END PGP SIGNATURE-----
--=-=-=--
