Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806DBC7619A
	for <kernel-janitors@archiver.kernel.org>; Wed, 22 Mar 2023 09:16:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbjCVJQW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 22 Mar 2023 05:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbjCVJQL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Mar 2023 05:16:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C921CBCE
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Mar 2023 02:16:09 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1peuZi-0008Tz-Kl; Wed, 22 Mar 2023 10:16:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peuZh-005t2v-GG; Wed, 22 Mar 2023 10:16:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peuZg-0070yg-UF; Wed, 22 Mar 2023 10:16:04 +0100
Date:   Wed, 22 Mar 2023 10:16:04 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Marian Cichy <m.cichy@pengutronix.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm/imx/lcdc: fix a NULL vs IS_ERR() bug in probe
Message-ID: <20230322091604.3zgzogskrtn3evur@pengutronix.de>
References: <d0a1fc55-3ef6-444e-b3ef-fdc937d8d57a@kili.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2c2aouyncpmczm5x"
Content-Disposition: inline
In-Reply-To: <d0a1fc55-3ef6-444e-b3ef-fdc937d8d57a@kili.mountain>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--2c2aouyncpmczm5x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 12:06:55PM +0300, Dan Carpenter wrote:
> The devm_drm_dev_alloc() function returns error pointers.  It never
> returns NULL.  Fix the check.
>=20
> Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks!
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2c2aouyncpmczm5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQax1MACgkQj4D7WH0S
/k5w6AgAt3c7qCqEfoFBiHx1LjSNf/8dLgvIMNKE0iknXsrDb1OLuwsS62vuZCH9
0wCbQKZJnE1ym/maV3RTVu0UQNigJHNfqLjgX9L4O6+4dbttgPQwcS07VbNuirkD
jsmpnQ4zJvOjmVWD3GnAb7IzEuw/uP3fddE/ArRKHHFhCfGrvj9FOKEmxoYdcXvq
NpbrjQKqm96+X1TMqszm9p2XIYBg7IvzSDPMTLzUdyhPqxlD2617brWpmD5/Q+EY
aI27L7HMS6jhizEsGRt218g9hCOq4vXMbRM8OkIlo667vx65u6+V34+2peVpe2O3
WfBweZVxTz1+S20j4eYvKULxcAimow==
=hwTs
-----END PGP SIGNATURE-----

--2c2aouyncpmczm5x--
