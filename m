From: Mike Day <ncmike@ncultra.org>
Date: Tue, 24 Oct 2006 21:42:33 +0000
Subject: Re: [KJ] gcc 4x warnings, x86_64
Message-Id: <20061024214232.GA4409@silverwood.ncultra.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0682370485=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061024124142.GA10832@silverwood.ncultra.org>
In-Reply-To: <20061024124142.GA10832@silverwood.ncultra.org>
To: kernel-janitors@vger.kernel.org


--===============0682370485==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/10/06 21:54 +0400, Alexey Dobriyan wrote:
>On Tue, Oct 24, 2006 at 08:41:42AM -0400, Mike Day wrote:
>> A lot of drivers are producing warnings and I would like to submit
>> some patches to clean the warnings up.
>
>Note, that
>
>	warning: 'foo' may be used uninitialized in this function
>
>style patches must have a description of codepath where foo is indeed
>used initialized.

Yes, I'm aware of that gcc 4.x bug.=20

thanks!

Mike

--=20
Mike Day
http://www.ncultra.org
AIM: ncmikeday  Yahoo: ultra.runner
PGP key: http://www.ncultra.org/ncmike/pubkey.asc

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFFPojIOycxVEUrfCERAuQfAJsHweV1q42GAffZX2lY8Oz9ZyGMLgCgpzmF
jtG+beXSZEy7AkHn4ZqV06o=
=w2ap
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--

--===============0682370485==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0682370485==--
