From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Jan 2012 13:58:58 +0000
Subject: Re: [patch] exofs: fix endian conversion in exofs_sync_fs()
Message-Id: <20120130135858.GH3356@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="4N29bJelYIMOTi0e"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111121144311.GA19025@elgon.mountain>
In-Reply-To: <20111121144311.GA19025@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--4N29bJelYIMOTi0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 03:45:07PM +0200, Boaz Harrosh wrote:
> Do you mean this code:
> 	struct __alloc_ore_devs_and_exofs_devs {
> 		/* Twice bigger table: See exofs_init_comps() and comment at
> 		 * exofs_read_lookup_dev_table()
> 		 */
> =3D>		struct ore_dev *oreds[numdevs * 2 - 1];
> =3D>		struct exofs_dev eds[numdevs];
> 	} *aoded;
>=20
>=20
> If so than Sparse should be fixed. It is plain wrong. This complete
> structure is kmalloc(ed) two lines below.
>=20

Oh yeah.  You are right.  I misread how that worked.

regards,
dan carpenter



--4N29bJelYIMOTi0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPJqIiAAoJEOnZkXI/YHqRZnkP/0NUKhkXB2cizs/j7aLAalC4
L3of55ElwO6eLeyBFhgPzVGLCYIrhQgbqS+GyDP6WrVTEedqtSC/mEaVX1I8BUAM
gjGchI0x+MvGSfobivwcXEH0mklzTQ8CPbFo7ii52/sQfv5/U97Oclm8NgA+qGN6
ylZLUzoJX7mGCY4cmj3DYQyrhagVa/9V+xkT4rYcICYPURNfzlmou485KlPjZYyz
j0ArudoemtzcVW7jMtXj/tZ5Tr6Wc2Hoh+hv/ZnonLQZ09bHHoFYDl2iH/UGDb8T
0HNiFn2s3mYiReUfCzJh31XR+yWwVniJ4zVhviS+GPYVN6gTWUsc5N9aBUtUBWLi
FcLwZxIndEoMyo0AfQQV12CF4BHhkM40JkPUhPkiPCLUFu6x3MIc1/7aPnpGmug8
1VD5lVckrJezIQ/jrYFcN+zrFSTH5moaKaJx9RjDe43IQ7CCaoT3+0P5RrOhs9eK
6Yu0rnxempRSW1UYfGECzFPHJ1NN7Q+zzGASFazm+Ep9FUM+2P9TumiO3woOAXMn
8RRKB/PsFNm+myjcvQhgAUzxuPFsUkrDdpXkMVa8nzCvbN0tfvzXj3s29snmmjix
odP8wzl+47hKukd1hZrqlci1TU53w/cEbh23bRWr2i9bYemLKKA/gbWSrAlttMYN
HXTrYC1lbmF4FKVyo7IW
=lZCE
-----END PGP SIGNATURE-----

--4N29bJelYIMOTi0e--
