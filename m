From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Feb 2012 12:36:17 +0000
Subject: Re: [patch] relay: prevent integer overflow in relay_open()
Message-Id: <20120209123617.GC4141@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="adJ1OR3c6QgCpb/j"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120209104433.GA5540@elgon.mountain>
 <4F33B448.1040207@bfs.de>
In-Reply-To: <4F33B448.1040207@bfs.de>
To: walter harms <wharms@bfs.de>
Cc: Jens Axboe <axboe@kernel.dk>, Paul Gortmaker <paul.gortmaker@windriver.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2012 at 12:55:52PM +0100, walter harms wrote:
> numerical this is ok, but ...
> maybe it is better to cap the chan->n_subbufs at a useful number ?

We considered this question already earlier in the thread.

> The user can still allocate an insane number of bytes.
> Restricting subbuf_size*n_subbufs seems more logical (otherwise is this a=
 real problem ?)
>=20

Yes.  It is a real problem.

regards,
dan carpenter


--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPM73BAAoJEOnZkXI/YHqR2K0QAKZYavGkdsfIyee+J8QyZGG2
PCAwQN1MzKTKZvFHJruAUrOctRh36E6eeuu6fzUhdmDnrpOgws6vifZlBQSDWh2l
zC+aV6gRWPY05qTYDpPl8HvHC2u7BdT3/l8RtcKP089HqhRtGH9ukYvzbomKByPy
qTp/ipJrHdI6UfKOLBOg/6FR1YjLyKZg42/Q0vDiLk+A234/Ped01UsdKBKUcBWV
l0SYweTh1OMnYOFXGM79pgh7ViXtkPjwo4iykz9ejORfpHHE7XJ94+FcfsuM0fuo
JF8qLlrzIOSuGCnrOSxdXcdnmqzRgWdG/gu0AM4XLpcyV//wT3Sb+0GI93E4NXJ3
zSSXOqQmGWLV5D6fFcEz4stZdMpxDPwNXot1N9fmWGyxrrTFi7gTXOmo3C5ywltp
NbzdYQeZL6bx+amhdWNRg0c7/0fvcJiuPwHVkFJvWWQh3ezJMeT9loI5/TfT0KPm
jx1tHwHYEbPTivmet3qy8D29Bj1vPkd+zrbyceJ/gFkgnjq5Xh/RLXiO9sTOjQLJ
kcp6jmwdS6s7CPpdKeeHzEMcw3rgWRtA+iXdlahNT0cZld/G8iXyrkJA8EgMZIzY
OED3fxm5U03Wp1YtTI6SHIzXY3Q7oqCB78+S/bf7MVtwCPuW977rkBUjI4fcNrQt
AJIHcgv6CXwXDFinN6GE
=A+ft
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
