Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83C9C636D6
	for <kernel-janitors@archiver.kernel.org>; Mon,  6 Feb 2023 14:02:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjBFOCL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 6 Feb 2023 09:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbjBFOBn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Feb 2023 09:01:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77565298ED
        for <kernel-janitors@vger.kernel.org>; Mon,  6 Feb 2023 06:00:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A01DBB81184
        for <kernel-janitors@vger.kernel.org>; Mon,  6 Feb 2023 14:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D38DC433D2;
        Mon,  6 Feb 2023 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675692045;
        bh=WHmuZ4HOQhS+Ld/3mBNiQinI0Q/poYTTVhw9vo4zWAo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gR7dHSykZ5YFuPkcFzcN3fEKmpKVUR5vCog6Nymhup0iMTfawYgAEY6asKI6c1+0S
         uaYLLsN50+QwTyoT6AJ9apGVdH4dveKzBEsfLXslqNPs3mOE4lK+oyGam9U9DHbk3c
         6VjBA7MYuWJ4AG4Gg9Y60J8/DxEb1v+mwIhxe9CBdzprzoZQuT7Ax+pdqB73IYOaKF
         rW9f11x/5G92S59NKFqaBL5pHukb/AC8RnLffeIiQHw9nAwyhDq2xsi9gWK+h3B257
         7Hd8/dEiCD9/4IsbS1ud2rUYdK9i0jaTqHkMOoDmtltNwXflXu4G6EwpzZ34yCXf5P
         0lgJqQ8o6gscw==
Date:   Mon, 6 Feb 2023 14:00:39 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        Bruce zhao <zhaolei@awinic.com>, Nick Li <liweilei@awinic.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: aw88395: Uninitialized variable bug in
 aw_dev_parse_dev_type_v1()
Message-ID: <Y+EIB2UrQ3+5Ax72@sirena.org.uk>
References: <Y+EHjQ0+QCAXxmlh@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/4JoUgpNFgE7fxsI"
Content-Disposition: inline
In-Reply-To: <Y+EHjQ0+QCAXxmlh@kili>
X-Cookie: Hope is a waking dream.
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--/4JoUgpNFgE7fxsI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 06, 2023 at 04:58:37PM +0300, Dan Carpenter wrote:
> The "cur_scene_id" variable is never initialized.  It needs to be set
> to zero for the code to work.

Someone already sent a fix for this.

--/4JoUgpNFgE7fxsI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPhCAYACgkQJNaLcl1U
h9Cijgf/YHHuQ9XpwusAnVzXrs2tRILYwpZOHfRv+NDdSvXG2FH5HuYOtRyH6lbg
e/ulk+Co/6L51zkVFBnkeyyHFmLxl3LG49h+dnCaFcf8WqwjllacASz98ZAe3D1w
si5IH1h8l+tX6WhCXDI0paTH3PlqOpNsz9ikLAlLiiHiFOHgiIxgfKuCpRMjMY5X
YRzTJ78U0tGC1V0ZOIQyR3nygywlu/TNn2uyPq/+cfjLC4Kgz0tRIraSFrWPp/iS
ID13trYgCM4WmKxTANyPSaeFmJZ4l2WsPklLn3MtIYfdcH02AC8F6qa9bkh0z64E
NENYjZ+uVbOIrn6alMRkjO7/wYgKHA==
=Limx
-----END PGP SIGNATURE-----

--/4JoUgpNFgE7fxsI--
