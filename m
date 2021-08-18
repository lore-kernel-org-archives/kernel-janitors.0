Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B255C4338F
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 Aug 2021 07:00:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2671A61056
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 Aug 2021 07:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238343AbhHRHAi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 18 Aug 2021 03:00:38 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47120 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237636AbhHRHAh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Aug 2021 03:00:37 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0950C1C0B77; Wed, 18 Aug 2021 09:00:02 +0200 (CEST)
Date:   Wed, 18 Aug 2021 09:00:01 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: trigger: remove reference to obsolete
 CONFIG_IDE_GD_ATA
Message-ID: <20210818070001.GD22282@amd>
References: <20210804123426.16947-1-lukas.bulwahn@gmail.com>
 <20210804123426.16947-2-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Content-Disposition: inline
In-Reply-To: <20210804123426.16947-2-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-08-04 14:34:25, Lukas Bulwahn wrote:
> Commit b7fb14d3ac63 ("ide: remove the legacy ide driver") removes the
> definition of the config IDE_GD_ATA.
>=20
> So, remove the obsolete reference in ./drivers/leds/trigger/Kconfig.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks, applied.
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEcr/EACgkQMOfwapXb+vLMBQCfdCzU/lz/6A94DTCvwmlxTCuq
DBMAnjyLKaVaJOMw0tLpHn5I835/BdZH
=NVt6
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
