Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753D6EB64D7
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Jun 2023 23:10:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjFWXKS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Jun 2023 19:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjFWXKQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Jun 2023 19:10:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D07EA
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Jun 2023 16:10:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4D6461077
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Jun 2023 23:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EF6C433C0;
        Fri, 23 Jun 2023 23:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687561814;
        bh=AhTyVrezEb7xISciSylu0n0Qyim1F111XYrBxnV80IQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=QLXdp79yFL2jHUj+smoXBvOn1yR18rfo/ld1dHN57UKTiMPYrDHJDdXYd0YVm2E+K
         2dXgFn2t/HVRyeH9YbmupgVZ12hBvOE82/4ldtrCzsS5ZfF4iFAxFzuzfdm69csJwo
         IzgGRoF/Jf3XLv2iM/6H6Vne5CRVa1U6v8OTDoEHiIO3iib/sxjXJ405LmbQMhat41
         yJUho2EIjpK1bSho1a0YjWYKKQthH87tpoK8ER9LhjHMf51MMg15L1s1HcmGpQQ5fE
         f/6E9UKs1eZfgToQLrI350rEEkBlm0Noz6QAnPq2NsDzlv0Z/Nu7jctO1VlV+CBXNB
         Im90/cjyeDWww==
From:   Mark Brown <broonie@kernel.org>
To:     Shenghao Ding <13916275206@139.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <729bb6b3-bc1d-4b3d-8b65-077a492c753c@moroto.mountain>
References: <729bb6b3-bc1d-4b3d-8b65-077a492c753c@moroto.mountain>
Subject: Re: [PATCH] ASoC: tas2781: Fix error code in
 tas2781_load_calibration()
Message-Id: <168756181136.1144026.12966447947961318975.b4-ty@kernel.org>
Date:   Sat, 24 Jun 2023 00:10:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 23 Jun 2023 15:09:48 +0300, Dan Carpenter wrote:
> Return -EINVAL instead of success on this error path.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Fix error code in tas2781_load_calibration()
      commit: ed959833db7bdb4e57fa8f4076babf3810296f5b

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

