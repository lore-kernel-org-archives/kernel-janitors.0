From: Samuel Iglesias =?ISO-8859-1?Q?Gons=E1lvez?=  <siglesias@igalia.com>
Date: Mon, 15 May 2017 04:52:47 +0000
Subject: Re: [PATCH 2/2] ipack: Improve a size determination in ipack_bus_register()
Message-Id: <1494823967.2172.1.camel@igalia.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-TsQNZe3Mkdizqh6nvpcz"
List-Id: <kernel-janitors.vger.kernel.org>
References: <b3fea957-b1bf-f681-8f70-d9d85106651b@users.sourceforge.net>
         <4c250243-7441-3c07-764d-1a23f950def7@users.sourceforge.net>
In-Reply-To: <4c250243-7441-3c07-764d-1a23f950def7@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>, industrypack-devel@lists.sourceforge.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jens Taprogge <jens.taprogge@taprogge.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--=-TsQNZe3Mkdizqh6nvpcz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Markus,

Thanks for the patches!

Series is,

Acked-by: Samuel Iglesias Gonsalvez <siglesias@igalia.com>

Greg, Would you mind picking this patch series through your char-misc
tree?

Sam

On Sat, 2017-05-13 at 10:56 +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 13 May 2017 10:37:06 +0200
>=20
> Replace the specification of a data structure by a pointer
> dereference
> as the parameter for the operator "sizeof" to make the corresponding
> size
> determination a bit safer according to the Linux coding style
> convention.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> =C2=A0drivers/ipack/ipack.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/ipack/ipack.c b/drivers/ipack/ipack.c
> index 575c4f29e0f7..a1e07a77d4e6 100644
> --- a/drivers/ipack/ipack.c
> +++ b/drivers/ipack/ipack.c
> @@ -212,7 +212,7 @@ struct ipack_bus_device
> *ipack_bus_register(struct device *parent, int slots,
> =C2=A0	int bus_nr;
> =C2=A0	struct ipack_bus_device *bus;
> =C2=A0
> -	bus =3D kzalloc(sizeof(struct ipack_bus_device), GFP_KERNEL);
> +	bus =3D kzalloc(sizeof(*bus), GFP_KERNEL);
> =C2=A0	if (!bus)
> =C2=A0		return NULL;
> =C2=A0
--=-TsQNZe3Mkdizqh6nvpcz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEQP+ZAvaXWkfuKXiEf/S6MvF9w0MFAlkZNB8ACgkQf/S6MvF9
w0NslA/+LALFj7X269HMY3XZngUXEEfPnn0oFp/OIvkCif+k87FH/e9TQBKzvl9H
fumHUtXYEB0vSiXnArqu655d+yQvRaJE87LRwlZ5AowG2vbCBVCEJlerEtnT9bMC
cMwBMrwaVxug7tVUf0q+M06neefb8LGCogAfl6YdRkiSY9pGh6dXIaE7Y11Ga3f4
0NI7OeQv+VmGZ6THGaD085nhXF1zioW6LSKGNiyD9luiW07IpnXoitfhzNYVgeym
FqVfGbUGAX1ov5tdwSWVGAzznzlnIP+zATMjEB0q/ZbV4MVh+hvDjyGSam7UKN0t
54HzldOjFc4kMqLBAKiQh+8qFS76a0srnYhMn+7+i8ciiL8g7ZvZS9ZY+tSOb7zE
DOW8Y8TUBcRKAbzy9mCSy1OifvUBsTuH/i/A+sfkpund4giSfhWl0qAIvBtea77q
1EgZCiatPKLkVnoupDxeQV608sKKSsP7fhHFZFBdXaEQCiINnDHVpwKuiFBLPI26
aLk9fz9JgSFyhL7RMux4wwTZXGwoVTfdu0TJY0TKD9++gs9miRYNFxal2IuL1cjd
j9Uo6KFQ10QSy4NJLRSrPM7lgkCehpUafin9mCL0/wRXE7vl+m6xnwYvmy0D/NCA
oG4j0BBguRSXZCt6PLwg4saZIgAriIvK36K2guP7j5C3oh4zS9Y=
=BCAb
-----END PGP SIGNATURE-----

--=-TsQNZe3Mkdizqh6nvpcz--

