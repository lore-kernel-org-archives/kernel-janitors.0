From: =?utf-8?Q?Javier_Gonz=C3=A1lez?= <jg@lightnvm.io>
Date: Tue, 09 May 2017 10:19:42 +0000
Subject: Re: [PATCH] lightnvm: Remove an unused variable
Message-Id: <79988EFB-7909-4234-B4D9-435AAFAE2E07@lightnvm.io>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail=_ADCA1BE8-68AE-4BFA-9C91-361001EFE221"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170509093450.dgj3qghdwefpg6li@mwanda>
In-Reply-To: <20170509093450.dgj3qghdwefpg6li@mwanda>
To: kernel-janitors@vger.kernel.org


--Apple-Mail=_ADCA1BE8-68AE-4BFA-9C91-361001EFE221
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

> On 9 May 2017, at 11.34, Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
>=20
> "rq" is never used in nvme_nvm_rqtocmd().  We also recently shifted =
some
> code around so it's uninitialized and causes a static checker warning.
> Let's just remove it.
>=20

Looks good. I didn't see it when I refactored that part.
Matias: If it is ok with you, can you pick it up?

Reviewed-by: Javier Gonz=C3=A1lez <javier@cnexlabs.com>

--Apple-Mail=_ADCA1BE8-68AE-4BFA-9C91-361001EFE221
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJZEZe/AAoJEGMfBTt1mRjKhSYP/iKsY90iH/SA/gawBVmnBFvG
tv858UvSz+66n20QKDGgSXIiYE2pRrBhCmjiGoTyxnMd38bFs/qqtAGK1NLKKH6K
9uF1gjgOferYAsyolfGm9PjuGgiV90fcza/5HIsOq3YQ0K4Y/0Xeg9p8JrMgqf2m
RSyn8wrX/wrUrZmkxYey4nETRnVEiOo7ZjCDdlN/UOEpnbZSQHh4RciOlf7VHYz2
bJCDyGwbz2gRWAAKJAgdJxWHIcUIkmW7numHWMKeB6XNw14lDTpVyy0dyqlNh1Mq
DJwngRtV5S8TQI1znpVfYfuAYEFfneCweBgZBQOJxSWSlHbbNlo60fd0I9J1zaF0
tIiyuz6FPUHJJe+M6mAQeJX6/jTjSJMB6A6LCyG1zrO8VmLaiG0it45hxtESh+D1
CVuVd/7BPRM3x2FW+ZyVGknXQO28qbWyiUJBJ7quZAjk/9379TOmHKkt8BwzSNwp
/VneBjoPLZktHIuBpvoBSDHN9xRbj5KFJuuR268EJbl07ZIiJbrIkM0mzrnKqGx4
TJEbBYJgKd1goG1430TczMtcegDrdgf4u2PAPqrnLiiFy+F72b3NTNNVWHWAovO+
74Jp8IcyV4HJjsnC1Fykr6VwPMXm/E+U1PEds/hScnGAqTnebzhKbb3hwuHJ/WD9
2MX5Dq93IklfeYjSSBeS
=LCQ3
-----END PGP SIGNATURE-----

--Apple-Mail=_ADCA1BE8-68AE-4BFA-9C91-361001EFE221--
