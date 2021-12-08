Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253E5C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed,  8 Dec 2021 16:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237274AbhLHQu3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 8 Dec 2021 11:50:29 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:52370 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237265AbhLHQu3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Dec 2021 11:50:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 439CCB821C9
        for <kernel-janitors@vger.kernel.org>; Wed,  8 Dec 2021 16:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42E6C341CA;
        Wed,  8 Dec 2021 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638982015;
        bh=9sl05KB/Wmmgh8hTPjQUEeSxpALKqcfSoRdKFAet8JE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=jviW+zWdyQMn66S2HDRfLnruwnaF/rvB2sTf6cUubb2j/WeBPnBxg+jBODq/Yazcq
         PL37dID/7dbpv8PmDmpvDE/kfVygra/a6mFTfrnE8Cj9nyuRW7Sr/pOxIRqYor1pvw
         Nygz5xsy5FY/XPvRMl9H86HyR6OaRNVf5V3LMl8ht+0FnEcC7yHVvKftoEwssktbJi
         dkczjxvBRmec4SCBi8QKibf5jEiJHBpO2svaiU0ug3PD/9awHakYEtUlrUR1qG144M
         DnT5zuVDPpquo3M4MsRxXel+7oOB6ukjlLO/btpp+HG+pMNvIMDQg87kNkiybQ+fLW
         TnrWzsXEJcAZQ==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        linux-mediatek@lists.infradead.org,
        Trevor Wu <trevor.wu@mediatek.com>,
        Bixuan Cui <cuibixuan@huawei.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20211208151145.GA29257@kili>
References: <20211208151145.GA29257@kili>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: silence uninitialized variable warning
Message-Id: <163898201265.3880815.10727023271133668606.b4-ty@kernel.org>
Date:   Wed, 08 Dec 2021 16:46:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 8 Dec 2021 18:11:45 +0300, Dan Carpenter wrote:
> Smatch complains that we might hit the continue path on every iteration
> through the loop.
> 
>     sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c:831
>       mt8195_mt6359_rt1019_rt5682_card_late_probe()
>     error: uninitialized symbol 'sof_comp'.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: silence uninitialized variable warning
      commit: 9abc21c966619d6ead27fd48481966014fdc680f

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
