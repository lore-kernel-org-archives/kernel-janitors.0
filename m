From: Felipe Balbi <balbi@kernel.org>
Date: Tue, 03 May 2016 07:53:05 +0000
Subject: Re: [patch] usb: dwc3: gadget: fix mask and shift order in DWC3_DCFG_NUMP()
Message-Id: <87shxzfuhq.fsf@intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160503074900.GA9816@mwanda>
In-Reply-To: <20160503074900.GA9816@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Dan Carpenter <dan.carpenter@oracle.com> writes:
> In the original DWC3_DCFG_NUMP() was always zero.  It looks like the
> intent was to shift first and then do the mask.
>
> Fixes: 2a58f9c12bb3 ('usb: dwc3: gadget: disable automatic calculation of=
 ACK TP NUMP')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for this fix, I completely missed it :-) Greg, if you want to
take this as a patch, that's fine by me. Otherwise I can queue it for
=2Drc1. In any case, S-o-B below:

Signed-off-by: Felipe Balbi <balbi@kernel.org>

> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 186a886..7ddf944 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -277,7 +277,7 @@
>  #define DWC3_DCFG_FULLSPEED1	(3 << 0)
>=20=20
>  #define DWC3_DCFG_NUMP_SHIFT	17
> -#define DWC3_DCFG_NUMP(n)	(((n) & 0x1f) >> DWC3_DCFG_NUMP_SHIFT)
> +#define DWC3_DCFG_NUMP(n)	(((n) >> DWC3_DCFG_NUMP_SHIFT) & 0x1f)
>  #define DWC3_DCFG_NUMP_MASK	(0x1f << DWC3_DCFG_NUMP_SHIFT)
>  #define DWC3_DCFG_LPM_CAP	(1 << 22)
>=20=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXKFjiAAoJEIaOsuA1yqREjEsP/A4/DNcWBu521A2NKZQsCaUM
pIjsTXaOANEv6X9oyaAUEAYWfLVj/EKAJSw73bftWp2m5HvDE9VwGvGzW3NlWFjZ
yW3rA++NXm2X3w8yOrQuKjSMq8ncddJYKWkNXWhnvuYs8RjoZZ2gANLQae8/haLS
Dis7Vzqgu9+HnYSXeEnT+TLSB7iMjKFIQQJUgljr/5o72Rzg5WQN44VBddm/Zbci
tCy42tXxG2p2m6kXLHYZsMSIvPBMb3o9Soeydc7zAdb6TQTzFxMih5viu05qWWsg
5PkoJwszSnLc/99PCyo9yLprIdgzzhx64fl+9w64d9v84ulGDuCnNo7SfvC2plgD
yHbDFo+YzTTswPh8xYhNhJXGpULK/fCA+Fq7gdzMMGjfiCwLva4UpOvCdWAYhf/j
B/iSwUiEtRtyowuP1LqS2d4n29jKTYh2UEibSZONYgTquyV8GLdzemEfQcZqBJIm
35SgZf3yhGg4TSKkNGXHFprMGzFkKss4zgda1TxUZdfVU5digq035Im5DirbbQx/
h952IpQASqvA4jI5BYbNYwRuXUc3SqjpZdt9Nda8s1D4GThLxAdOSJ1uu+u6Kwod
6av7sX4a9t1POH1ii9u4jx+m4iGMqExD1o2VLEPuk3d32KHtFQn8DjhcuJTXO4ZV
m80YY+OyrObG7g54/25P
=+Evs
-----END PGP SIGNATURE-----
--=-=-=--
