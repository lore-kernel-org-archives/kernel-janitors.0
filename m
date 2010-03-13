From: Wolfram Sang <w.sang@pengutronix.de>
Date: Sat, 13 Mar 2010 02:28:55 +0000
Subject: Re: [PATCH 1/3] arch/mips/txx9/generic: init dynamic bin_attribute
Message-Id: <20100313022855.GD4034@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="DiL7RhKs8rK9YGuF"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1268377431-11671-1-git-send-email-w.sang@pengutronix.de> <1268377431-11671-2-git-send-email-w.sang@pengutronix.de> <20100312183450.GC8736@core.coreip.homeip.net>
In-Reply-To: <20100312183450.GC8736@core.coreip.homeip.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org


--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2010 at 10:34:51AM -0800, Dmitry Torokhov wrote:
> On Fri, Mar 12, 2010 at 08:03:49AM +0100, Wolfram Sang wrote:
> > Commit 6992f5334995af474c2b58d010d08bc597f0f2fe introduced this require=
ment.
> > Found with coccinelle, but fixed manually. Compile tested on X86 where
> > possible.
> >=20
>=20
> Regarding all 3 - it looks like these dynamically alocated attributes
> could be converted to statically allocated ones. I'd recommend doing
> that instead (in fact, I posted patch for the firmware_class couple days
> ago).

I agree for the firmware-patch. Regarding the MIPS one, 'size' might differ=
 and
'private' will differ per instance. Regarding the RTC driver, 'size' might =
also
differ. I don't know if somebody really wants two RTCs or the SRAM for MIPS=
 can
be instantiated more than once. Unless somebody with actual hardware jumps =
in,
I'd say better safe than sorry.

Thanks for the comment!

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--DiL7RhKs8rK9YGuF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkua+GcACgkQD27XaX1/VRsmUgCgxpG37bpkUetDGyW/fT8vhGaU
9XoAoIbuIfLRmEolrdu01v0d4cjAMYZJ
=pKV6
-----END PGP SIGNATURE-----

--DiL7RhKs8rK9YGuF--
