From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 11 Jan 2004 20:17:26 +0000
Subject: Re: [Kernel-janitors] TODO suggestions.
Message-Id: <20040111201726.GA1425@mail.sternwelten.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77289745666555065=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073548328.2024.27.camel@telecentrolivre>
In-Reply-To: <1073548328.2024.27.camel@telecentrolivre>
To: kernel-janitors@vger.kernel.org


--===============77289745666555065==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 08 Jan 2004, Luiz Fernando Capitulino wrote:
>  Is this still valid ?
> [..]=20
> ----
>=20
> "From: Jeff Garzik <jgarzik at mandrakesoft dot com>
>=20
> The string form
>=20
> 	[const] char *foo =3D "blah";
>=20
> creates two variables in the final assembly output, a static string, and
> a char pointer to the static string.  The alternate string form
>=20
> 	[const] char foo[] =3D "blah";
>=20
> is better because it declares a single variable.
>=20
> [..]=20
> ----

as matthew wilcox pointed out on 30 jul 2003 on kjml,=20
it isn't that straight forward, sometimes it hurts,
but there are cases where you see size benefit:
actually one of those patches went into 2.6.0-test2-kj1
http://developer.osdl.org/rddunlap/kj-patches/2.6.0-test2/split/string_form=
3.patch
and afterwards in 2.6.0-test3 "use char arrays for strings":
http://marc.theaimsgroup.com/?l=3Dlinux-kernel&m=3D106040784910861&w=3D2

i have up to 9 benefial patches pending,=20
i'll send them in after retest and rediff on current
soo the aboves item can be kicked off.

same applies to:
--
strtok() isn't SMP/thread safe.
Replace with strsep() where possible since it is considered safer.
Read lib/string.c:14
+ completed for 2.5; possibly not worth doing for 2.4.

-       for (opt =3D strtok(options, ",");
-			opt !=3D NULL;
-			opt =3D strtok(NULL, ",")) {
+       while (opt =3D strsep(&options, ",")) {
+               if (!*opt)
+                       continue;
--
a quick grep doesn't show not any use of strtok in 2.6.1

regards maks



--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAAa9W6//kSTNjoX0RAsEMAJ49c5fP0svv276W6fRHtaVGlkfPJACfVvzZ
d/K57ETRZAEKQ1tJrcJs4cY=
=I24F
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--

--===============77289745666555065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77289745666555065==--
