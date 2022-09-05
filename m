Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A153EECAAD5
	for <kernel-janitors@archiver.kernel.org>; Mon,  5 Sep 2022 09:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236379AbiIEJwQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 5 Sep 2022 05:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235591AbiIEJwO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 5 Sep 2022 05:52:14 -0400
X-Greylist: delayed 442 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Sep 2022 02:52:13 PDT
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7E940BCD
        for <kernel-janitors@vger.kernel.org>; Mon,  5 Sep 2022 02:52:13 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
        t=1662371079; bh=UuiZBQrk3PkxgO4/DkhLIrDD9ZaCQxTMdt1KEb2j7EM=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=Bk/TT7cPidOmX6ahdFI2MrqSMRZS+vn/0NY6KUScFZzqAHQfvZvMnMp0l8sNXaJAu
         Qg/VOM876LH+AftUOPKpvCCFzGDOO2JIPsYLrp/dfuUz4DLtFp0cryr1bPvrDfgdM0
         yBSN4qQ/USJ7dzvMDKP0Bw1NwkxvFQvnjfTtzwLs=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM/APPLE MACHINE SOUND
 DRIVERS
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20220905093546.19735-1-lukas.bulwahn@gmail.com>
Date:   Mon, 5 Sep 2022 11:44:38 +0200
Cc:     Mark Brown <broonie@kernel.org>, asahi@lists.linux.dev,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4DB82E66-0BB9-4B43-917B-55E115994876@cutebit.org>
References: <20220905093546.19735-1-lukas.bulwahn@gmail.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


> On 5. 9. 2022, at 11:35, Lukas Bulwahn <lukas.bulwahn@gmail.com> =
wrote:
>=20
> Commit 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver") =
adds
> a new sound driver at the location "sound/soc/apple/", but it adds a =
file
> entry referring to the non-existing location "drivers/sound/apple/*".
>=20
> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains =
about a
> broken reference.
>=20
> Repair this file reference in ARM/APPLE MACHINE SOUND DRIVERS.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Martin, please ack.
> Mark, please pick this patch on top of the commit above.

Hi Lukas, fixed here already:
=
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?=
id=3D55e2bd9c41e800638676dce3f19dcfd16b309a08

Best, Martin

