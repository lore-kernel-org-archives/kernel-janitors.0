Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7278BC433F5
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Mar 2022 12:40:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbiCGMlW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Mar 2022 07:41:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241381AbiCGMlU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Mar 2022 07:41:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3384A90F
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Mar 2022 04:40:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C3983B811E3
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Mar 2022 12:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A12C340F3;
        Mon,  7 Mar 2022 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646656819;
        bh=7b1ai/DLaoMwWypU8/jHGkgvIV0Cz5+Yuo+N0X/U11Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SlNQh+jBd/QVag3+y5/nDYbxuAOc8AgW3WHCDAo0wlwLeJjdMJfFv6h4bixOEF+sV
         Y4QfKCvJwIjxcLMRu4DU7GasEtSXuriu8RrK5rRl6jzm/MScW5NXjW4zgUx7ClJ4s/
         Q72SXBIK2rqI0b7DmzAHEYr3RjW4UEF6P4zierWHBZzlX38vgO1IB9rL47xpfymf0g
         OzzD0px6U01YA89igIipbc9YbSme3QQwa3Ky5vzhHVQLxTOXvTDZLt1enNDfohOlWX
         Ih1XlU6hDv4fwSJUSaHRRB3zr4ubHqJJBp1rita+5qjbdAxDf1hvW79nx/5oR+7UFs
         PMF6ZrN2ex58Q==
Date:   Mon, 7 Mar 2022 12:40:10 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Meng Tang <tangmeng@uniontech.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: amd: vg: fix signedness bug in
 acp5x_audio_probe()
Message-ID: <YiX9Kp9AFYNiqJcL@sirena.org.uk>
References: <20220304131256.GA28739@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Czo/FV3lhKwL15bG"
Content-Disposition: inline
In-Reply-To: <20220304131256.GA28739@kili>
X-Cookie: Whatever became of eternal truth?
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--Czo/FV3lhKwL15bG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 04, 2022 at 04:12:56PM +0300, Dan Carpenter wrote:
> The "adata->i2s_irq" variable is unsigned so the error handling
> will not work.

This series has a 1/4 and a 1/3 but no 3/4.

--Czo/FV3lhKwL15bG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIl/SkACgkQJNaLcl1U
h9Dk8Qf/b60qYtpv/9beRu/xqunawztZFok9vyGOKB0Yr4shMKqB6xPbozNFZ32p
/uFfcCSuL+7eExwYpzWeCOMzt215eTGTdKu0is9CHRyjOGI1YX1DEbaT5Ph3418l
c6VbA0aeSSxCA/mIYSSZjP3KH6f6t+O8qbEKczr8gkCzTRny6oXc7IkO21AICYex
FPFEDbvlY2JfT7VJjL7dDRZQZW3a03ciP6Cr1frN5Swniqn7kZ8sMO90xtlIcMJz
keodhwXvmXXuxpD9OR4MBQNKXc7uGQEr+BaJnvsR3yiUVp3Nu5v+N6pnWISCX0zu
8UjMu8p5q1DkydOKoSdByy8wADqDYA==
=zG8U
-----END PGP SIGNATURE-----

--Czo/FV3lhKwL15bG--
