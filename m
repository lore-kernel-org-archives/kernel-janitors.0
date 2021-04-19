Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BE8C433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Apr 2021 15:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A7D161157
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Apr 2021 15:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240319AbhDSPbp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Apr 2021 11:31:45 -0400
Received: from smtp1-g21.free.fr ([212.27.42.1]:39458 "EHLO smtp1-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239962AbhDSPbo (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Apr 2021 11:31:44 -0400
Received: from Normandy.localdomain (unknown [88.129.173.226])
        (Authenticated sender: pierre.morrow@free.fr)
        by smtp1-g21.free.fr (Postfix) with ESMTPSA id CE72EB00593;
        Mon, 19 Apr 2021 17:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1618846243;
        bh=hTxMh/3AVmviRW4NuaHcdozpATtThaOjYz7vJa/CJ+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JRFgdJE6TDLvKwFh8j8EeE9a5Bb79jewZUMunxZBXfY3+cFwcevXnTsQxCW44krDm
         W2t9rW091wwy3KqlWQW6nf/RREwSJUVr7K7w/9LKwGp86gFkUsnNk7O04Zajlo36tR
         nhX+6kZ9cqwR3qnszxsH5vpEdjBNcbgPt5ttDRwhLyFy0zJDgDC525I64OelqtMB7G
         rUZ+KEJ2Pws0Xl2sml8v8gcG6VVyEgC47JY4VkiyKrXQ1Z0N7/6sdxNFkb2t93lzSH
         3js0kGNHGEl4Kjr4mpq54nuzQ9qxP+1MIwuRexorWpNjUnUk9mSRSGMVV0tq02YDW8
         R63mBLkm3uw9w==
Date:   Mon, 19 Apr 2021 17:30:20 +0200
From:   Pierre Moreau <pierre.morrow@free.fr>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
        nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix an error code in
 nouveau_backlight_init()
Message-ID: <20210419153020.kkwgc7kvg5zkhjmk@Normandy.localdomain>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
        Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
        nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
References: <YHaEdBgqCFQRqg1B@mwanda>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="my3zcp46ylqrwbex"
Content-Disposition: inline
In-Reply-To: <YHaEdBgqCFQRqg1B@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--my3zcp46ylqrwbex
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I can not remember why the original code did return 0 rather than an error,=
 but
-ENOMEM seems indeed way more fitting.

Reviewed-by: Pierre Moreau <pierre.morrow@free.fr>

On 2021-04-14 =E2=80=94 08:58, Dan Carpenter wrote:
> If nouveau_get_backlight_name() fails then this should return -ENOMEM
> but currently it returns success.
>=20
> Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interface=
s")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is from static analysis.  In the original commit db1a0ae21461
> ("drm/nouveau/bl: Assign different names to interfaces") then returning
> zero seemed to be a very deliberate choice.  I do think it was wrong
> though and -ENOMEM is the currect return.
>=20
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/dr=
m/nouveau/nouveau_backlight.c
> index 72f35a2babcb..3786b1c85182 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -274,6 +274,7 @@ nouveau_backlight_init(struct drm_connector *connecto=
r)
> =20
>  	if (!nouveau_get_backlight_name(backlight_name, bl)) {
>  		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight inte=
rface\n");
> +		ret =3D -ENOMEM;
>  		goto fail_alloc;
>  	}
> =20
> --=20
> 2.30.2
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--my3zcp46ylqrwbex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR/JmlivLpJL9Gbvb06GdGs4t/H/gUCYH2iDAAKCRA6GdGs4t/H
/uSvAQDcmak9o1JNcYSU2PrWd6XA6bO+q89J8zAUxMcCwqYXWwD/Uoasi8OTWyJ3
4CeMzekcwYCGulAvpXF0S29V6IDA6wA=
=BaJ7
-----END PGP SIGNATURE-----

--my3zcp46ylqrwbex--
