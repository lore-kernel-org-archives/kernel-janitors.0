Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8510DC19F2B
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Jul 2022 14:15:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbiG0OPq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Jul 2022 10:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbiG0OPc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Jul 2022 10:15:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615876305
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Jul 2022 07:15:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F23BC617CB
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Jul 2022 14:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BB5C433C1;
        Wed, 27 Jul 2022 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658931324;
        bh=FCJBkIeBqxLGwi8tym4TWgvrzE7oI3PcDO3ND5UwEeI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QPM2aLjDBncSEppE/0QAl9rrLPavmD1MoGRcBVtgKrIP310Hm9wDOANEVcrVHTkiq
         4ztw48Ya0FItoymFC6IfzGGw5dcnPwQMxF47TZxpBmY7FlOqHHQByPhiNIyL3qci4e
         aZmInavip/yrbdKNTaiv2M7hk7lYaPHJA33b2z6cEQpgCS66dUrRSkI2vjtPKkKhPN
         Jq9m6CaYJAHOeMBMNdU81YB+tdvgqCQ7OJxGXxKN9s+K148rgDq2im1KnLlJKupwBd
         7RRwsscrL8WNv/TciMRGijRjxGXwCyMAsz6+tEbH77ZcXHCs5PlhgjT260tNnz1b/P
         PIZv51TZY4W6A==
Date:   Wed, 27 Jul 2022 15:15:18 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: acp: uninitialized variable in
 i2s_irq_handler()
Message-ID: <YuFIdsE4oeGPt643@sirena.org.uk>
References: <YuFANcpt9Z8X9L5n@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UtxYyFEbV5AN1JMG"
Content-Disposition: inline
In-Reply-To: <YuFANcpt9Z8X9L5n@kili>
X-Cookie: No motorized vehicles allowed.
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--UtxYyFEbV5AN1JMG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 27, 2022 at 04:40:05PM +0300, Dan Carpenter wrote:
> The "ext_intr_stat1" is used without being initialized.

Someone submitted a patch for this yesterday.

--UtxYyFEbV5AN1JMG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLhSHUACgkQJNaLcl1U
h9BhqQf/eALiya7frb/KUEyX0e12KJP+RKUobnMOZXQ+5jlhy+r1H7PGqdXWmB6w
YvhXmxTFysVqLNoVojtDunaQT9+i2Wkr2I/nMoXK8eMLD+gSLSUtXP8W2OSuA88X
KYHHzWyi4KquMsRF6uiNB/761+ckh+PyTJAhMaShMxBrXeZIJM3xPhu1SzJ65Ky2
RMQ23PiRgMwXLUcThngqzn5cgnHOlqEF9BiV43vCuLvz7vqiawwYdfs20+lY9uHC
q7k7e1eS2z+65Uzkvc8jHjASDzntP5WF9SU7u3lzaK/7SKiPIQ3dsgrv3NtxGE7V
EkHLH5RAO9EAVWGz0HqshWqCNhXzKw==
=PAnB
-----END PGP SIGNATURE-----

--UtxYyFEbV5AN1JMG--
