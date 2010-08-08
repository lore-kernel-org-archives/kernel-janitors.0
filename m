From: Tilman Schmidt <tilman@imap.cc>
Date: Sun, 08 Aug 2010 12:55:45 +0000
Subject: Re: [patch] isdn: gigaset: use after free
Message-Id: <4C5EA951.9040106@imap.cc>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enigF09227431A15EFE8806CBC5F"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100806082126.GT9031@bicker>
In-Reply-To: <20100806082126.GT9031@bicker>
To: Dan Carpenter <error27@gmail.com>
Cc: Hansjoerg Lipp <hjlipp@web.de>, Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, Tejun Heo <tj@kernel.org>, Joe Perches <joe@perches.com>, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigF09227431A15EFE8806CBC5F
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 06.08.2010 10:21 schrieb Dan Carpenter:
> I moved the kfree(cb) below the dereferences.

Thanks for finding and fixing that bug.

> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Tilman Schmidt <tilman@imap.cc>

> diff --git a/drivers/isdn/gigaset/bas-gigaset.c b/drivers/isdn/gigaset/=
bas-gigaset.c
> index 0ded364..707d9c9 100644
> --- a/drivers/isdn/gigaset/bas-gigaset.c
> +++ b/drivers/isdn/gigaset/bas-gigaset.c
> @@ -1914,11 +1914,13 @@ static int gigaset_write_cmd(struct cardstate *=
cs, struct cmdbuf_t *cb)
>  	 * The next command will reopen the AT channel automatically.
>  	 */
>  	if (cb->len =3D=3D 3 && !memcmp(cb->buf, "+++", 3)) {
> -		kfree(cb);
>  		rc =3D req_submit(cs->bcs, HD_CLOSE_ATCHANNEL, 0, BAS_TIMEOUT);
>  		if (cb->wake_tasklet)
>  			tasklet_schedule(cb->wake_tasklet);
> -		return rc < 0 ? rc : cb->len;
> +		if (!rc)
> +			rc =3D cb->len;
> +		kfree(cb);
> +		return rc;
>  	}
> =20
>  	spin_lock_irqsave(&cs->cmdlock, flags);

--=20
Tilman Schmidt                    E-Mail: tilman@imap.cc
Bonn, Germany
Diese Nachricht besteht zu 100% aus wiederverwerteten Bits.
Unge=F6ffnet mindestens haltbar bis: (siehe R=FCckseite)


--------------enigF09227431A15EFE8806CBC5F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkxeqVEACgkQQ3+did9BuFsumwCfWvealz+ws3fQ7KXg9eHtzwup
gGYAn1s2fZdRjoyatpj99zsvvl6kkXKI
=AACW
-----END PGP SIGNATURE-----

--------------enigF09227431A15EFE8806CBC5F--
