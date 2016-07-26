From: Oleg Drokin <oleg.drokin@intel.com>
Date: Tue, 26 Jul 2016 19:11:40 +0000
Subject: Re: [PATCH 05/12] staging: lustre: Optimize error handling in class_register_type()
Message-Id: <3F437188-382B-46C8-9C30-7DBAB17F62E3@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <566D7733.1030102@users.sourceforge.net> <56784D83.7080108@users.sourceforge.net> <56784F0C.6040007@users.sourceforge.net> <20151221234857.GA27079@kroah.com> <59d94e70-7476-728e-5f63-013557ec2db9@users.sourceforge.net> <d1f69f4d-539b-e97d-fc0e-cb0a8754bd3a@users.sourceforge.net>
In-Reply-To: <d1f69f4d-539b-e97d-fc0e-cb0a8754bd3a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@driverdev.osuosl.org, lustre-devel@lists.lustre.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Bhumika Goyal <bhumirks@gmail.com>


On Jul 26, 2016, at 3:05 PM, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Jul 2016 14:23:23 +0200
>=20
> Return a constant error code without storing it in the local variable "rc"
> after a failed memory allocation at the beginning of this function.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> drivers/staging/lustre/lustre/obdclass/genops.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/lustre/lustre/obdclass/genops.c b/drivers/st=
aging/lustre/lustre/obdclass/genops.c
> index fd5e61f..4752091 100644
> --- a/drivers/staging/lustre/lustre/obdclass/genops.c
> +++ b/drivers/staging/lustre/lustre/obdclass/genops.c
> @@ -152,10 +152,9 @@ int class_register_type(struct obd_ops *dt_ops, stru=
ct md_ops *md_ops,
> 		return -EEXIST;
> 	}
>=20
> -	rc =3D -ENOMEM;

NAK.
when you do this, the next statement below breaks:

> 	type =3D kzalloc(sizeof(*type), GFP_NOFS);
> 	if (!type)
> -		return rc;
> +		return -ENOMEM;
>=20
> 	type->typ_dt_ops =3D kzalloc(sizeof(*type->typ_dt_ops), GFP_NOFS);
> 	if (!type->typ_dt_ops) {
=85
                goto failed;

 failed:
=85
return rc;

So we are now returning an unitialized rc, did you get a gcc warning about =
it when compiling?--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
