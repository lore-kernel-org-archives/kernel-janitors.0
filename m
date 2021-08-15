Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA31BC4338F
	for <kernel-janitors@archiver.kernel.org>; Sun, 15 Aug 2021 22:00:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9580461250
	for <kernel-janitors@archiver.kernel.org>; Sun, 15 Aug 2021 22:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbhHOWBL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 15 Aug 2021 18:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbhHOWBJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 15 Aug 2021 18:01:09 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A109BC061764;
        Sun, 15 Aug 2021 15:00:38 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 5E0461F423BC
Received: by earth.universe (Postfix, from userid 1000)
        id 427D63C0C9B; Mon, 16 Aug 2021 00:00:33 +0200 (CEST)
Date:   Mon, 16 Aug 2021 00:00:33 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] misc: gehc-achc: Fix spelling mistake
 "Verfication" -> "Verification"
Message-ID: <20210815220033.vfz3v356ucmhgb5x@earth.universe>
References: <20210815214206.47970-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sqzpx57nwoalmjlm"
Content-Disposition: inline
In-Reply-To: <20210815214206.47970-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--sqzpx57nwoalmjlm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Aug 15, 2021 at 10:42:06PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a spelling mistake in a dev_dbg debug message. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> ---
>  drivers/misc/gehc-achc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/misc/gehc-achc.c b/drivers/misc/gehc-achc.c
> index 891d9a214454..02f33bc60c56 100644
> --- a/drivers/misc/gehc-achc.c
> +++ b/drivers/misc/gehc-achc.c
> @@ -280,7 +280,7 @@ static int ezport_flash_compare(struct spi_device *sp=
i, u32 address,
>  	ret =3D memcmp(payload, buffer + 4 + 1, payload_size);
>  	if (ret) {
>  		ret =3D -EBADMSG;
> -		dev_dbg(&spi->dev, "Verfication failure @ %06x", address);
> +		dev_dbg(&spi->dev, "Verification failure @ %06x", address);
>  		print_hex_dump_bytes("fw:  ", DUMP_PREFIX_OFFSET, payload, payload_siz=
e);
>  		print_hex_dump_bytes("dev: ", DUMP_PREFIX_OFFSET, buffer + 4, payload_=
size);
>  	}
> --=20
> 2.32.0
>=20

--sqzpx57nwoalmjlm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmEZjoEACgkQ2O7X88g7
+pqFIg/9GGXPpAFtIMHh0gKssA/YS7dn7Z6P8b6B2Oz398kZJFs9UfyOhVLHNGdE
6h62OHmV9anR8jS+8a0LIWvqZRCsGSfgquVssGChJqriPXEKnNJXwP2988IsnV+4
MRB5SgeXawwjEW481yCB/TtUG5EjuS30YyCozKUkJsSbP+r05uVI9Y3tYn2IjQOL
SePI6rDQz+SkGUioA44to/3IDODjwUyvLvln72Qg4hme7E4R+2CCCH6MS8tpC6Z9
HzRIzbw9+5l0U3MhHD6JugFI+HUSx/iIhrAVzvS5J3PqIVrb+Tm9fnzg6GWmA/3T
ZUZZGK0mj84k25nKqU8IQB3vssaWu0kZYrjBu1ygZQPvVvuT6lPF50Gk1MG/o0an
tOJ7TjvOdsk8dlV2wmlVxExpQrIn7X7GsaUlconh2QGhorDf7TFJY1zaM23EJ82l
DAbV23dgd/Izdm7syGCI41xy8IiKBLRzcey2j17qRJgqWikNvyvnzuu0AW3r/oWU
7fvSO2CMUEf9sFcsvlJpRPo1XBCBQS+fdT3zuR4Uq5aKu4iEWUUG31z2W9A2gFnL
epBtPKYIoDaNX6H0oM5zK8+zePo56bcwUnvL9IXi26Lg8IXzJ3iKkl0pzYNC7yXf
kPBB7xg+TC2pEu0WjdwnuXgtcSfgX/syazA6ANvkw7BWClgLg9c=
=UXeE
-----END PGP SIGNATURE-----

--sqzpx57nwoalmjlm--
