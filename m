From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Date: Mon, 01 May 2017 09:06:43 +0000
Subject: Re: [PATCH 0/3] HSI: nokia-modem: Fine-tuning for two function implementations
Message-Id: <20170501090643.c2mtwge4yybw5pzk@earth>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ge6bskk3iiboco4r"
List-Id: <kernel-janitors.vger.kernel.org>
References: <be1a9b8a-bc9f-d96e-04b4-a6edf2dc37c6@users.sourceforge.net>
In-Reply-To: <be1a9b8a-bc9f-d96e-04b4-a6edf2dc37c6@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--ge6bskk3iiboco4r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 25, 2017 at 10:40:10AM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 25 Apr 2017 10:36:54 +0200
>=20
> Three update suggestions were taken into account
> from static source code analysis.
>=20
> Markus Elfring (3):
>   Use devm_kcalloc() in nokia_modem_gpio_probe()
>   Delete error messages for a failed memory allocation in two functions
>   Add a space character for better code readability in nokia_modem_probe()
>=20
>  drivers/hsi/clients/nokia-modem.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)

Thanks for your patchset. We are currently in the merge
window and your patch will appear in linux-next once
4.12-rc1 has been tagged by Linus Torvalds.

Until then I queued it into this branch:

https://git.kernel.org/cgit/linux/kernel/git/sre/linux-hsi.git/log/?h=3Dfor=
-next-next

-- Sebastian

--ge6bskk3iiboco4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlkG+qAACgkQ2O7X88g7
+poqFxAAlrWO98wTOLddvY3UdQY5R5cwIpJVgjOjoZsRsmssIt92lT45384ToHzu
cPsPiweHo88pcHsk2+SZGdwrl8HpkISnmO4RbsDKJhaoDFg43hLwwO1JZSGcWH/v
m1snYeOp5shyhK3x9U2iwQdAvS+VjcasG98o3NGhqBeHIL57KczuwXOPQ7vh6wmp
/yL4ANT6ofwU/shsDQqORWdIWeZTuUVQB5f48ImN9YeKfexL31wNIDaGpDij2v9U
E2QL2faev8ikp9WVycG64B4nM4bjpeHs9hGCTjZMggSXib0Vjs1oVB4WqNAhVBeD
WQVUxPSe5trv0Qu+ScnqIT0IPUCK39LReB/Lf7LPm1r6PczroL9aFY2sDuDD7PFO
T50IYWtX+LhdCI9fJa6SCSUTJAUNYXw0NJMrIZ3P0roxBvWNdeeL8n3cRwiv5sR0
TpF9vv3y3UkBttYHBD4AXP1M0Om8LBoBRJq9jAjUC+b+sUVLbIB2cexU3gAaT9Sj
2Ip/ZyjW2WERFJ1FXD84j+2YO8oBh8K1AJP9Ho/LE+DD3CEyLLjeqoqtIghTnmUl
/7gECRWuIv4QYa41O58NMgMWtlh0aT2oT8FuwSKzBtcZ2zU+1z8575go9M9fIOG3
fCWIFzE+/9b9Ji9a6GNQOiGwjG9MM+qqjBYUFr/f9YV0Lo77m7E=
=/MH9
-----END PGP SIGNATURE-----

--ge6bskk3iiboco4r--
