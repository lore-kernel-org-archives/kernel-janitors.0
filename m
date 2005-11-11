From: Ingo Oeser <ioe-lkml@rameria.de>
Date: Fri, 11 Nov 2005 08:10:24 +0000
Subject: [KJ] Re: [PATCH 6/9] Cleanup kmem_cache_create()
Message-Id: <200511110910.38350.ioe-lkml@rameria.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10924431399843915=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4373DD82.8010606@us.ibm.com> <4373E011.9070508@us.ibm.com>
In-Reply-To: <4373E011.9070508@us.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Matthew Dobson <colpatch@us.ibm.com>, kernel-janitors@lists.osdl.org, manfred@colorfullife.com, Pekka J Enberg <penberg@cs.helsinki.fi>

--===============10924431399843915==
Content-Type: multipart/signed; boundary="nextPart1722313.OTyhkiMz6n";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1722313.OTyhkiMz6n
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 11 November 2005 01:04, Matthew Dobson wrote:
> - if (size < 4096 || fls(size - 1) =3D=3D fls(size - 1 + 3 * BYTES_PER_WO=
RD))
> + if (size < RED_ZONE_LIMIT ||
> +	fls(size - 1) =3D=3D fls(size - 1 + 3 * BYTES_PER_WORD))
>              flags |=3D SLAB_RED_ZONE|SLAB_STORE_USER;

I would suggest sth. like

if (size < RED_TONE_LIMIT
    || fls(size - 1) =3D fls(size - 1 + 3 * BYTES_PER_WORD))
	flags |=3D SLAB_RED_ZONE | SLAB_STORE_USER


Reason: A binary operator in front is a huge hint=20
	that this is a continued line.

Just compare when you go to a store next time.

	1
+	2
=2D	3
*	4

is much more readable then

1	+
2	-
3	*
4

right?


Regards

Ingo Oeser



--nextPart1722313.OTyhkiMz6n
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDdFH+U56oYWuOrkARAu/zAKC84MBIOYcpFRv2iZb6QkZmL8aDJwCeOndu
PeTYW02XkeVFe8ne3MeerO0=
=9BIp
-----END PGP SIGNATURE-----

--nextPart1722313.OTyhkiMz6n--

--===============10924431399843915==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10924431399843915==--
