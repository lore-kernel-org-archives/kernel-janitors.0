From: "=?utf-8?B?RGF2aWQgSMOkcmRlbWFu?=" <david@hardeman.nu>
Date: Wed, 19 Oct 2016 13:03:45 +0000
Subject: Re: [PATCH 1/5] [media] winbond-cir: Use kmalloc_array() in wbcir_tx()
Message-Id: <ff9593f2d918e13b39ed272e3c74cef8@hardeman.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <74b439c6-fa6f-1f78-424a-ebeb6c8bbb4f@users.sourceforge.net>
 <566ABCD9.1060404@users.sourceforge.net>
 <1d7d6a2c-0f1e-3434-9023-9eab25bb913f@users.sourceforge.net>
In-Reply-To: <74b439c6-fa6f-1f78-424a-ebeb6c8bbb4f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

October 14, 2016 1:41 PM, "SF Markus Elfring" <elfring@users.sourceforge.ne=
t> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 14 Oct 2016 07:19:00 +0200
>=20
> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "kmalloc_array".
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Sure...why not...

Signed-off-by: David H=C3=A4rdeman <david@hardeman.nu>


> ---
> drivers/media/rc/winbond-cir.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/rc/winbond-cir.c b/drivers/media/rc/winbond-ci=
r.c
> index 95ae60e..59050f5 100644
> --- a/drivers/media/rc/winbond-cir.c
> +++ b/drivers/media/rc/winbond-cir.c
> @@ -660,7 +660,7 @@ wbcir_tx(struct rc_dev *dev, unsigned *b, unsigned co=
unt)
> unsigned i;
> unsigned long flags;
>=20
> - buf =3D kmalloc(count * sizeof(*b), GFP_KERNEL);
> + buf =3D kmalloc_array(count, sizeof(*b), GFP_KERNEL);
> if (!buf)
> return -ENOMEM;
>=20
> --=20
> 2.10.1
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
