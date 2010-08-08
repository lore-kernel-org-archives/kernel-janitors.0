From: Tilman Schmidt <tilman@imap.cc>
Date: Sun, 08 Aug 2010 12:50:02 +0000
Subject: Re: [patch] isdn: gigaset: add missing unlock
Message-Id: <4C5EA7FA.9020504@imap.cc>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enig984294F52AD71101E34A4962"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100806082323.GU9031@bicker>
In-Reply-To: <20100806082323.GU9031@bicker>
To: Dan Carpenter <error27@gmail.com>
Cc: Hansjoerg Lipp <hjlipp@web.de>, Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <ext-andriy.shevchenko@nokia.com>, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig984294F52AD71101E34A4962
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 06.08.2010 10:23 schrieb Dan Carpenter:
> We should unlock here.  This is the only place where we return from the=

> function with the lock held.  The caller isn't expecting it.

Thanks, good catch.

> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Tilman Schmidt <tilman@imap.cc>

>=20
> diff --git a/drivers/isdn/gigaset/capi.c b/drivers/isdn/gigaset/capi.c
> index e5ea344..bcc174e 100644
> --- a/drivers/isdn/gigaset/capi.c
> +++ b/drivers/isdn/gigaset/capi.c
> @@ -1052,6 +1052,7 @@ static inline void remove_appl_from_channel(struc=
t bc_state *bcs,
>  	do {
>  		if (bcap->bcnext =3D=3D ap) {
>  			bcap->bcnext =3D bcap->bcnext->bcnext;
> +			spin_unlock_irqrestore(&bcs->aplock, flags);
>  			return;
>  		}
>  		bcap =3D bcap->bcnext;

--=20
Tilman Schmidt                    E-Mail: tilman@imap.cc
Bonn, Germany
Diese Nachricht besteht zu 100% aus wiederverwerteten Bits.
Unge=F6ffnet mindestens haltbar bis: (siehe R=FCckseite)


--------------enig984294F52AD71101E34A4962
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkxeqAYACgkQQ3+did9BuFsWaQCeM9gAi9DKGpMSVD4C+SYpI96e
4IgAni97HQnQS5b5QBWfTJPGJ+LjxDIk
=LjhY
-----END PGP SIGNATURE-----

--------------enig984294F52AD71101E34A4962--
