From: Tilman Schmidt <tilman@imap.cc>
Date: Mon, 29 Dec 2008 11:46:30 +0000
Subject: Re: [PATCH 3/13] drivers/isdn/gigaset: use USB API functions rather
Message-Id: <4958B896.3030801@imap.cc>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enigC7261E909D30CE9F9F5095B7"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812291119340.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812291119340.9555@pc-004.diku.dk>
To: Julia Lawall <julia@diku.dk>
Cc: hjlipp@web.de, gigaset307x-common@lists.sourceforge.net, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigC7261E909D30CE9F9F5095B7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Dec 2008 11:19:55 +0100 (CET), Julia Lawall wrote:
> This set of patches introduces calls to the following set of functions:=

>=20
> usb_endpoint_dir_in(epd)
> usb_endpoint_dir_out(epd)
> usb_endpoint_is_bulk_in(epd)
> usb_endpoint_is_bulk_out(epd)
> usb_endpoint_is_int_in(epd)
> usb_endpoint_is_int_out(epd)
> usb_endpoint_num(epd)
> usb_endpoint_type(epd)
> usb_endpoint_xfer_bulk(epd)
> usb_endpoint_xfer_control(epd)
> usb_endpoint_xfer_int(epd)
> usb_endpoint_xfer_isoc(epd)
[...]
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Tilman Schmidt <tilman@imap.cc>

Thanks,
Tilman

> ---
>  drivers/isdn/gigaset/usb-gigaset.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/isdn/gigaset/usb-gigaset.c b/drivers/isdn/gigaset/=
usb-gigaset.c
> index e847c6e..16399fb 100644
> --- a/drivers/isdn/gigaset/usb-gigaset.c
> +++ b/drivers/isdn/gigaset/usb-gigaset.c
> @@ -783,7 +783,7 @@ static int gigaset_probe(struct usb_interface *inte=
rface,
>  	/* Fill the interrupt urb and send it to the core */
>  	usb_fill_int_urb(ucs->read_urb, udev,
>  			 usb_rcvintpipe(udev,
> -					endpoint->bEndpointAddress & 0x0f),
> +					usb_endpoint_num(endpoint)),
>  			 cs->inbuf[0].rcvbuf, buffer_size,
>  			 gigaset_read_int_callback,
>  			 cs->inbuf + 0, endpoint->bInterval);

--=20
Tilman Schmidt                    E-Mail: tilman@imap.cc
Bonn, Germany
Diese Nachricht besteht zu 100% aus wiederverwerteten Bits.
Unge=F6ffnet mindestens haltbar bis: (siehe R=FCckseite)


--------------enigC7261E909D30CE9F9F5095B7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFJWLigQ3+did9BuFsRAmj/AKCId1mtOjzYLX2B2FRNzq+5Wu8NVgCfWOZV
KuJyrR6d1ZLK7sHir9YAZvw=
=tQQd
-----END PGP SIGNATURE-----

--------------enigC7261E909D30CE9F9F5095B7--
