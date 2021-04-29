Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64745C433ED
	for <kernel-janitors@archiver.kernel.org>; Thu, 29 Apr 2021 10:19:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2409B61457
	for <kernel-janitors@archiver.kernel.org>; Thu, 29 Apr 2021 10:19:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233272AbhD2KT4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 29 Apr 2021 06:19:56 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45547 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232629AbhD2KT4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 29 Apr 2021 06:19:56 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 80F445C012B;
        Thu, 29 Apr 2021 06:19:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 29 Apr 2021 06:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=nXro11ayf+BNu3eRVPh/mtFJDg0
        SwhTFiUye39eo91Y=; b=EUSxFfFPjI96/WFvaiVqAxuInFzT5/zoH78emHtdSpP
        0/dfx+ai6iY5S7S+jjt8Ss2Ksl1LVGjo/kVQpXhHGSOVEg9HPvug9c1ozTZQ1uFj
        sjR/kzsYnxqNW1cTF3AgJiVR92z5ceaP2vK5DR/7GAoj2uBVaLucvTPL+nKqv8Tx
        oZb25uq4Sbay9ht0dVgvSA7NF2B5b8BO2S/BP/L/2UsF8MfD34Mrvfe/pg1KHq7A
        VxkF49L6zhzPztz8D8V+MR547UMwWq2kMA/OtjaLUDBpXg3HP+P8WhJ/3j7ouxVA
        OFWW9iv5SgkCRtOVAgNZouINPkalIZ22ltMm8kNgRKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nXro11
        ayf+BNu3eRVPh/mtFJDg0SwhTFiUye39eo91Y=; b=ogaAAHr0FodKDEcJfVwtBc
        EtQLu099HMW/hZ14LfP9Ydpwfc4S8o3WGgOIkpGEs1wKpZ6ltXm0SLAJrv7nvOWJ
        jCHm05rHpzeWKakSDtyUiX5fyrBW3ZpZpf9aXPk/gYASDKg9P5ObMDvv7bAuBoE1
        SR2HPP05pC1aU/NKCsFfNjiNRp1+2KBFPSvBBc6NwOdNzXlEYk0bClPR08hrLZob
        59p+FRSpyvA6ctpwq4XsBAmCtsOOIYF+vKwFOyes8rO9ptQJXzcV0fcPuAHDZ8OL
        1qLA8ezt3VIpG5tRgD2HNME/g5TJhln1Gg4Cl4gpdd8B2vCl1dPP+95D3rpev0vA
        ==
X-ME-Sender: <xms:HIiKYF-NOFOTqNjX_J9pGbRjTsU_F3o94h8H371evJ4fXEyRoPHpmA>
    <xme:HIiKYJunoTuWQBILve0QrJArKCIwszom1d8CBPhPXGPH-cBNu1l6h5tITdyiGgGmu
    P-Ts1vIXFIimmAKjQM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HIiKYDD3rYTiWOV3Qc2_pIUGUU8yzv25oK1Jxh13ou797NJLd32mng>
    <xmx:HIiKYJfLSo-ny0-feJ-AYO8w7DES7Gs2rjGdC47DMoFdWMACuww26Q>
    <xmx:HIiKYKMdOhOv3q6ye6Al31qUddRoAoDX8UPQFBjcaOK0V7UxbTrJKg>
    <xmx:HYiKYHq_pShIF14kS5uYAPyvtm1DlXM7rWtcddVoN4bbpkm7wkneLQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Thu, 29 Apr 2021 06:19:08 -0400 (EDT)
Date:   Thu, 29 Apr 2021 12:19:06 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Eric Anholt <eric@anholt.duckdns.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/vc4: fix argument ordering in vc4_crtc_get_margins()
Message-ID: <20210429101906.oyksmyvmhtxy7y55@gilmour>
References: <YH/720FD978TPhHp@mwanda>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pmlppwclgrww3bhq"
Content-Disposition: inline
In-Reply-To: <YH/720FD978TPhHp@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--pmlppwclgrww3bhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 21, 2021 at 01:18:03PM +0300, Dan Carpenter wrote:
> Cppcheck complains that the declaration doesn't match the function
> definition.  Obviously "left" should come before "right".  The caller
> and the function implementation are done this way, it's just the
> declaration which is wrong so this doesn't affect runtime.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
Maxime

--pmlppwclgrww3bhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYIqIGgAKCRDj7w1vZxhR
xd+RAQDgI7bMDtw/4/Jy0xv7SHV5djFACyeFotLWNeyKedIw6AD+JP053Xz/3ar0
I9LeToENzjvNl9JKKKtd+aGVfi/FZQQ=
=8aDt
-----END PGP SIGNATURE-----

--pmlppwclgrww3bhq--
