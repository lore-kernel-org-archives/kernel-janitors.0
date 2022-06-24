Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF4EC43334
	for <kernel-janitors@archiver.kernel.org>; Fri, 24 Jun 2022 14:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232729AbiFXOhf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 24 Jun 2022 10:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbiFXOgn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 24 Jun 2022 10:36:43 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D62B562DB
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Jun 2022 07:35:54 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4A7C120002;
        Fri, 24 Jun 2022 14:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1656081352;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Z/XGzdtFqcVGB8e2YIX6omwGWK/S08DpKJpbNqUDcSE=;
        b=oieKVySo+sXGflMfukphC5meksFzkcoxcCg02IWYya5zyd/f0S4Usb8zkYwGr7rm6JdrFC
        vyyLSKtZuEuWjXhUGMKNBmul8KodDjqTLW3NvI/U2874+2Mq6nvRKOTJvE3I9c37M+JhdK
        vh+FDeqsdq6F1J/eDWBugMuH/x8mT9SeIviWKF/G/ugZbnGfcL+oXc8PPBp2BVOZ26kTVg
        bU8bPNDn1M3NVD3as3V5+60E7VBlMwZBs8eVayHCeMMx/Sz6omPGCTApidz0c4xT4VZCxe
        yZKL1ifCuUDQsLuZ2rYyHEVrl052J89MHKHyYsedoWXmzfG3hOx9y2YaGeKcag==
Date:   Fri, 24 Jun 2022 16:35:51 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: logicvc: fix error code in logicvc_layer_init()
Message-ID: <YrXLx8AXRObZEbVi@aptenodytes>
References: <Yqh6VdNiDvJYMOQ+@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9rmVoEPHcjZhZxQy"
Content-Disposition: inline
In-Reply-To: <Yqh6VdNiDvJYMOQ+@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--9rmVoEPHcjZhZxQy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 14 Jun 22, 15:08, Dan Carpenter wrote:
> Return -EINVAL if logicvc_layer_formats_lookup() fails.  Don't return
> success.
>=20
> Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller=
")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the fix!

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Paul

> ---
>  drivers/gpu/drm/logicvc/logicvc_layer.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/lo=
gicvc/logicvc_layer.c
> index bae1c7f99569..9c94b67afbed 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_layer.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> @@ -489,6 +489,7 @@ static int logicvc_layer_init(struct logicvc_drm *log=
icvc,
>  	if (!formats) {
>  		drm_err(drm_dev, "Failed to lookup formats for layer #%d\n",
>  			index);
> +		ret =3D -EINVAL;
>  		goto error;
>  	}
> =20
> --=20
> 2.35.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--9rmVoEPHcjZhZxQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmK1y8cACgkQ3cLmz3+f
v9Hc+Af/T9/8gpMFxU6r6DJMRLFfZzthyHv1domnxFjanb7l02hKHLHGfQlLumy4
ho9uZ0vjKUTHqM1XmQk7gH968MRWCAxJu+085dSlcnruMfwKb1VH4T/6IQVLp6jx
Sa1aNuJ5BbJTGfD36fDDd6SxnBQ4meJ6HnEgwV7ObfCoeTbVoIePttk8G9u6zKvS
o1je62yimInw6xi2wMjxKh848pa2wyOUhDKIwu95TMG2kSucJ+KfJ5o2EdLmBIX9
So7VeHnXiqE65uDyBMhN7XhKCqANSYBdybuYp2jD/Fi7V1zVf9mSbaEEa9/V99hl
tzd+yGe0c1uII7wVYXMgwR5LwyhQjQ==
=EFB/
-----END PGP SIGNATURE-----

--9rmVoEPHcjZhZxQy--
