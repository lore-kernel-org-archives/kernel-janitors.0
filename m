From: Wolfram Sang <w.sang@pengutronix.de>
Date: Mon, 15 Mar 2010 10:12:32 +0000
Subject: Re: [rtc-linux] Re: [PATCH] init dynamic bin_attribute structures
Message-Id: <20100315101232.GB20604@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="neYutvxvOLaeuPCA"
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.2.00.1003141054050.3719@i5.linux-foundation.org> <1268612981-9009-1-git-send-email-w.sang@pengutronix.de> <alpine.LRH.2.00.1003151055060.26353@twin.jikos.cz>
In-Reply-To: <alpine.LRH.2.00.1003151055060.26353@twin.jikos.cz>
To: rtc-linux@googlegroups.com
Cc: linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, kernel-janitors@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Linus Torvalds <torvalds@linux-foundation.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Gortmaker <p_gortmaker@yahoo.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-mips@linux-mips.org, Jiri Kosina <jkosina@suse.cz>


--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I don't understand how cocinelle works, but the resulting patch seems to=
=20
> be incomplete.

Okay, will investigate, thanks for the pointer.

> The fix is needed at least in firmware loader (for which Greg has already=
=20
> queued patch), in ACPI thermal driver [1], etc).

Firmware loader should be handled differently, see other mails in the
originating thread, so I skipped it intentionally. at24 also needed a fix, =
but
that one was just applied via the i2c-tree, so I skipped it, too. Will check
the ACPI-case!

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkueCBAACgkQD27XaX1/VRswuQCdFiF8i3Vjj2s0QPm1v4UCjE2R
pJYAoI5n8xxHNNFVFuS3KCJDpN1uBst/
=9hnN
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
