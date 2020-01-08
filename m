From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Date: Wed, 08 Jan 2020 10:17:19 +0000
Subject: Re: [PATCH] selftests: Uninitialized variable in test_cgcore_proc_migration()
Message-Id: <20200108101719.GA9281@blackbody.suse.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="UlVJffcvxoiEqYs2"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108054629.jtq36feyhxsfhf6u@kili.mountain>
In-Reply-To: <20200108054629.jtq36feyhxsfhf6u@kili.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Shuah Khan <shuah@kernel.org>, Tejun Heo <tj@kernel.org>, Roman Gushchin <guro@fb.com>, Alex Shi <alex.shi@linux.alibaba.com>, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2020 at 08:46:29AM +0300, Dan Carpenter <dan.carpenter@orac=
le.com> wrote:
> The "c_threads" variable is used in the error handling code before it
> has been initialized
Thank you for fixing this.

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

Michal

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAl4VrCsACgkQia1+riC5
qSgepg//at1PmnH0lpT7396h7qrWalZ4jjmOy4BAYL9bIz/HPJL3CLWMCkCC1Dmv
Egja2j6GHvgEiOpHkOlFlgqrOyz0oFpt3p0VfBlhPNtRoy4LtjniopYgO4vQj6eM
tr7AsHEpwaGTYSgxxs5RtSwA/Ddn7N3pnrB8VdSsJ396HffBMK4yIjYfLsGCVRst
0l6z5pRW1eiS4BKjbk3FSJ7ga6e0+Fgb+YcLBjEQ9W1rOYTjpxOt4RC5+Dd6SosS
P4HT80ftJw71aljyjLp5gdR3Pvc/wubw2IQf5EwFvre/k20Ct8a5osGNXlAo5a+h
ElNvs/6fHarqR4BSrX4J+IhDv42pIvyTZtBw8oXudN0wft5li6qWzKQH18Cwrfp/
6rSaE2ArTGRsM1A9IFGsKmi808OHEZfTcR/PcLDt2J19F918dgi8ymseOgzHFr94
NV4sUiTq7pu7SmUGL7NeAq9yUl1gJGKFIn6qyWq5U7q9dK1Au8krQ5wmtrI65hRT
Gs+jWygma54Vb7jdKYKC6SZGvrC2DN8iuQdzY+NoqrSNirZv9+C5O+3hib2+DX7x
90GYj7j0jbCueAswzsAnS0o5vuPWjFffKizeTvH8m4WoN4HbcBpu/8qR7y+m+2P6
PCvttwIx9lfv/W7MW+W0Y5xJUjD7XI1Bdnhr1YUPAguhb0sLW7k=
=40fW
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
