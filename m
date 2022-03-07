Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A004C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Mar 2022 16:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244170AbiCGQ3C (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Mar 2022 11:29:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234065AbiCGQ24 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Mar 2022 11:28:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4550A506E8
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Mar 2022 08:28:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D52E660FF6
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Mar 2022 16:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E948C340E9;
        Mon,  7 Mar 2022 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646670481;
        bh=64oNNmTtWsxUxeaKawvUIWDixHMJvkFSVykLx6hxC70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G82FpeRU/RnFOrLaYMthW0VcknwxZiLtJ3XSuLnjjgndDCMXeViuKQgMuIg0CDOv7
         zeEH8h2TTfcPU7S4iunbQ8mIiE0OFeIte5wI0FuT0qH0LytIzikNVFwSqsvKoA/Ipi
         2r5D9ZkK8X5QTKYYnaJ7wWVkMWrg5lF/Cv9k4ER9wOcfC/2aba+Fkg451vwQ4MWQVx
         Ki+GbWF0cJ3YUGbSeZEsKCJ7Zm7LAhWYhA583FMsZf2ToEmPUo074Zg4X/DAAAJsfY
         23l2Ro+fT+lDsFcVv38XtW00uNRvKlZ0X1NWH7pTKpeU2kOiT3/MBNIM/KOUZoHPR7
         ryiJHFsbUb3Gw==
Date:   Mon, 7 Mar 2022 16:27:55 +0000
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
Message-ID: <YiYyi/3BZekjTcrC@sirena.org.uk>
References: <20220304131256.GA28739@kili>
 <YiX9Kp9AFYNiqJcL@sirena.org.uk>
 <20220307124152.GB3315@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NPfp81odsDC3ClI1"
Content-Disposition: inline
In-Reply-To: <20220307124152.GB3315@kadam>
X-Cookie: Whatever became of eternal truth?
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--NPfp81odsDC3ClI1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 07, 2022 at 03:41:52PM +0300, Dan Carpenter wrote:

> Oops.  Sorry about that.  The 1/3 was intended to be 3/4.  Do you need
> me to resend it?

I think I worked around it but please check what gets applied and resend
anything that got dropped.

--NPfp81odsDC3ClI1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmImMosACgkQJNaLcl1U
h9Bppwf/eC/6CIIkse3i6pE3QPuWCDquC7sogKJQYHGLRbVf4m2/sJRdONv5gDW/
Mjr57Bx8iuZ20tuoNgZ5ek3V1XoF1csY6XTejWiIx+XQ6gu3wRcZMQ3fdHIvIxPg
8hAabf2HO4hbF0CgxdWXZZPpO71CUCGMVr1tdMlsc8Dd8CStF7QOWuUQujkplZ01
dwoqTRaH9jiZr6osDUAq/CGyCtf2JVyRxDlCSIX1n1pkiUCRucYiMtrrSNFGYazw
z9GXJ88nCywGzeMInlxQdm3WaztZwY1B7GXUXR+T0lhCabo/7/j+Cd5b8l5srdLW
JSdBARVJbY7iuqmkTZ8gTufbYnY5Ag==
=Enlb
-----END PGP SIGNATURE-----

--NPfp81odsDC3ClI1--
