From: David Laight <David.Laight@ACULAB.COM>
Date: Mon, 26 Sep 2016 16:00:37 +0000
Subject: RE: [PATCH 5/5] ISDN-Gigaset: Enclose two expressions for the sizeof operator by parentheses
Message-Id: <063D6719AE5E284EB5DD2968C1650D6DB0109E63@AcuExch.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
 <e97b38b6-8c02-6733-8b57-9786bfb911a6@users.sourceforge.net>
In-Reply-To: <e97b38b6-8c02-6733-8b57-9786bfb911a6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: 'SF Markus Elfring' <elfring@users.sourceforge.net>, "gigaset307x-common@lists.sourceforge.net" <gigaset307x-common@lists.sourceforge.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Karsten Keil <isdn@linux-pingi.de>, Paul Bolle <pebolle@tiscali.nl>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: SF Markus Elfring
> Sent: 26 September 2016 16:45
...
> The script "checkpatch.pl" can point information out like the following.
>=20
> WARNING: sizeof =85 should be sizeof(=85)
...
> ---
>  drivers/isdn/gigaset/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/isdn/gigaset/common.c b/drivers/isdn/gigaset/common.c
> index 2e9382f..d901ed7 100644
> --- a/drivers/isdn/gigaset/common.c
> +++ b/drivers/isdn/gigaset/common.c
> @@ -53,7 +53,7 @@ void gigaset_dbg_buffer(enum debuglevel level, const un=
signed char *msg,
>  {
>  	unsigned char outbuf[80];
>  	unsigned char c;
> -	size_t space =3D sizeof outbuf - 1;
> +	size_t space =3D sizeof(outbuf - 1);

wrong ...
think that is 7 instead of 79.

	David

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
