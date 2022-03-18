Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B37BC433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Mar 2022 17:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239809AbiCRRvd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Mar 2022 13:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239891AbiCRRvY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Mar 2022 13:51:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D6C173F60
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Mar 2022 10:50:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 30E3C619BD
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Mar 2022 17:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC4BC340E8;
        Fri, 18 Mar 2022 17:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647625801;
        bh=50PBucF3zO+C3He1MByP3a6uyE/52lCZgw6JQS8sX4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JO8UvdXrx/8XikzNeZ+pN54l4wv2y7djZxlnhZIpaPqx6kj8TNRbkbyIWWeXJn/i8
         kWce4J3jhFEAW7jql5Kf3LyoBvkhNRlULRG8vqFIakfn+gW8NpeoN7WiREF7YvQgRm
         1Gfte7MltB9uzADqRjERDHkKTzvITfKh/iFV+var+Rq6zad0ciZH97vL9q4JrUWaPX
         PfSuwZD5mHT0YXFbQF5zlWgcozimU6vxtRGQcNhXpUXE8jj7cm75FJ+AwpPCDzAszA
         LKCMMYVBipb3VoVF/uceUBY5xC3ZrVz+hol3CCXHtj90hMnx9T/OW534TDnYJtCrmP
         dX0BdSVovhFRw==
Date:   Fri, 18 Mar 2022 17:49:55 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        =?iso-8859-1?Q?P=E9ter?= Ujfalusi 
        <peter.ujfalusi@linux.intel.com>,
        sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 1/2] ASoC: SOF: Prevent NULL dereference in
 sof_pcm_dai_link_fixup()
Message-ID: <YjTGQ7IAcoGKQDul@sirena.org.uk>
References: <20220318071233.GB29472@kili>
 <cf4c4a84-335d-8799-7a5b-afe298881342@linux.intel.com>
 <1049c2410500a3a9ed97f83b5e41e89a74102c96.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SQ2FmoRmZfuAitaO"
Content-Disposition: inline
In-Reply-To: <1049c2410500a3a9ed97f83b5e41e89a74102c96.camel@linux.intel.com>
X-Cookie: laser, n.:
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--SQ2FmoRmZfuAitaO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 09:14:55AM -0700, Ranjani Sridharan wrote:
> On Fri, 2022-03-18 at 09:42 -0500, Pierre-Louis Bossart wrote:

> > This part will be removed in follow-up patches, likely the reason
> > why=20
> > this problem was missed.

> Both these problems are address in the series I posted yesterday.
> Particularly patches 16 and 18.

OK, I've got that patch series queued already so I'll skip these for
now.

--SQ2FmoRmZfuAitaO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmI0xkIACgkQJNaLcl1U
h9CCewf/WRBGQBF9JWbnRaHy34OpciHnqfuv18kO2kRjPVrteLbR+XxXlsRrtLCL
TXbdI+ICdc0pRtNoLO5dC4RQN2iAPhJ/mxlYa+uzuHBis/qO2Twd1hYNasdDG8VJ
Qx/9TtAkILApwH2YdV5grYvwe1+6EAEIHM8+Cg1lpyf6DZfhUtTiJwfKSso9k6/h
FlgdGYN3SHFva49ydIsCLjaMUa35Tw1egt4zJf7T9xMBYviAj2hTf2b4UShrbWVW
0k96nOTC5w0GNxnb8eA1JMtv2tXb3HjwsiC0R7muMwtn+ezHJfyAHj8cxvLBHPRL
nIN8QH3JeaivDCpaCQSTaR97W44COg==
=+Qia
-----END PGP SIGNATURE-----

--SQ2FmoRmZfuAitaO--
