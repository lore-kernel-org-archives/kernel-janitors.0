From: Robert Bihlmeyer <robbe@orcus.priv.at>
Date: Wed, 24 Mar 2004 19:11:34 +0000
Subject: [Kernel-janitors] cdrom_tocentry.cdte_datamode in
Message-Id: <87oeqmdpqx.fsf@orcus.priv.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37156940365764068=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
It has been signed conforming to RFC3156.
You need GPG or PGP to check the signature.

--===============37156940365764068==
content-Type: multipart/signed; boundary="----------=_1080155542-2182-0";
	micalg="pgp-sha1"; protocol="application/pgp-signature"

This is a multi-part message in MIME format.
It has been signed conforming to RFC3156.
You need GPG or PGP to check the signature.

------------=_1080155542-2182-0
Content-Type: text/plain; charset=us-ascii

Hi,

this field is broken and should not be used, two cdrom drivers put
different things in it, most leave it alone. See also
<URL:http://www.ussg.iu.edu/hypermail/linux/kernel/9905.3/0495.html>

I think this fact should at least be stated by a comment in cdrom.h,
so nobody gets any funny ideas (been there, done that).

I'd prefer renaming the field so that apps relying on it will clearly
break. They will anyway, e.g. when moving from SCSI cdrom to IDE.

Comments?

-- 
Robbe

------------=_1080155542-2182-0
Content-Type: application/pgp-signature
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAYevZ8g21h7wYWrMRAliXAJ9EXiqxTroTDerwl4NCg+DWJlkFwgCg2RJr
1rwC5kHSl1zMT7ZlmASkiFc=
=elCM
-----END PGP SIGNATURE-----

------------=_1080155542-2182-0--

--===============37156940365764068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37156940365764068==--
