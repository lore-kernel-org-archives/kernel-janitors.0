Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A55C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  1 Dec 2021 18:32:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352459AbhLASfc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 1 Dec 2021 13:35:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352470AbhLASf0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Dec 2021 13:35:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7977C061574
        for <kernel-janitors@vger.kernel.org>; Wed,  1 Dec 2021 10:32:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8FBF5B820FF
        for <kernel-janitors@vger.kernel.org>; Wed,  1 Dec 2021 18:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEE9C53FCD;
        Wed,  1 Dec 2021 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638383523;
        bh=dsGSvVwsFDlsp1QgsF8UIKkiq2nz3XnghIlxao0zEmI=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=lr9RZlOWtzaOZ9pJ+CYQabzYms2JfTPwdZmqzs9GxOMmGj1Tto1bDdtPrBpP5IZLV
         prRPAJxqExT6wM9/mQ4U2wMv9TMFKMG2HXCqHQe4G1Bj726wXg0ea6CeaIvTKiUmUO
         Hqyy2Rh94N3O8leUPVWkmQ489qYWl8FicfqC91NsFGj49oZrM/kqlLWgc/PlHpIbIH
         +x6rs2E8es+sO3lk21RReT8dLa8vwZjbGlV6ER/nhT+c99WuifXxYSviZadWj+1w0/
         7Fj5zobMTF0f4QOYhhDfU0VAIj0nhf/IzirV43gltTqny86gPVcGwLmbKD0U/hSK0w
         ksuPhbmLOgyuQ==
From:   Mark Brown <broonie@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc:     Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211130125633.GA24941@kili>
References: <20211130125633.GA24941@kili>
Subject: Re: [PATCH] ASoC: amd: fix uninitialized variable in snd_acp6x_probe()
Message-Id: <163838352162.2179725.6088119262152318727.b4-ty@kernel.org>
Date:   Wed, 01 Dec 2021 18:32:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 30 Nov 2021 15:56:33 +0300, Dan Carpenter wrote:
> The "index" is potentially used without being initialized on the error
> path.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: amd: fix uninitialized variable in snd_acp6x_probe()
      commit: d5c137f41352e8dd864522c417b45d8d1aebca68

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
