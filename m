From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Mar 2012 08:58:46 +0000
Subject: Re: [PATCH] [SCSI] pm8001: Add error handler in pm8001_init_sas_add() if kzalloc fails.
Message-Id: <20120321085846.GB3967@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="LpQ9ahxlCli8rRTG"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1332319094-11864-1-git-send-email-santoshprasadnayak@gmail.com>
 <1332319785.2909.11.camel@dabdike.int.hansenpartnership.com>
In-Reply-To: <1332319785.2909.11.camel@dabdike.int.hansenpartnership.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: santosh nayak <santoshprasadnayak@gmail.com>, jack_wang@usish.com, mark_salyzyn@xyratex.com, lindar_liu@usish.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 08:49:45AM +0000, James Bottomley wrote:
> On Wed, 2012-03-21 at 14:08 +0530, santosh nayak wrote:
> > From: Santosh Nayak <santoshprasadnayak@gmail.com>
> >=20
> > We need to add error handler if kzalloc fails to allocate and initializ=
e.
> > Otherwise it may lead to Null derefernce error in=20
> > 'pm8001_chip_get_nvmd_req()'.
>=20
> It's a GFP_KERNEL allocation.  They sleep until memory is available
> (__GFP_WAIT).  It's GFP_ATOMIC that can return NULL.
>=20

That's not right at all.  Only __GFP_NOFAIL allocations don't need
to be checked.

regards,
dan carpenter


--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPaZhFAAoJEOnZkXI/YHqRNqUP/RrDbQfjIxu789yyCs2P8hCT
nfUw3pid+uZGDG1hk8wBLIzWmHh4BBeen3HZRywcUpYGxf15VVm7/Hw45hADCPWR
AffaPzgnOXU5T4JqbVkc6OLdGh1Fdlk4RbO39hNgtvoOPEkUwniMm9utFVw28ydt
hHLTRwzGzfjrvDXkmdsxyxedlGgMmWjZISxcxo/yE5CgN+PoAMIm0J7XkBvdf2Qz
pvVYUlxFjCSNObQKMlvXuz2z42tQhLDN3ZE8PUYykdN/t/RdYhQUF/chtCGo5ZZp
kOKgxqj/0hTay3DNSHwuB46W+WpTAkFyoS4xhfsX6oNRLFitvqhH2t6Teiz9BkU3
cO5TX2+1peRjURRj5N0vkqNP+L/AGBdpRC1h9Al1/7vyW5yUMNSCmacbx7j0Xvxr
JIMtEqlJbvdeB+35kXLj3VEvzMeTrvWkuhTVYShDEQcAD4ff3iW3waqsEWlx97BB
WrpHlduRB9vGJZIoU6TZ5K8eLGzRy+cJzy1YVIP/9K4Xx8ZJnVc3dhteumT74SyJ
owUALilI2gN7o/b6C51KChyc0pts7XXmng7NCqI9lsp5ZEIPPCax0cJaS6G/5uCb
8Y/Xky+X/dAaBn2UCxlAjEa2cEXRnUT40Wm81C8WPOPumTJUQQTixykRpCXkZ/rW
FlEpAeqts7TGzsuyeB9H
=GSAg
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
