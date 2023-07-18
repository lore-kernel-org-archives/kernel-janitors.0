Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6638AEB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 18:46:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjGRSqq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 14:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGRSqp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 14:46:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF915B6
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 11:46:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7CAF7616B0
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 18:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF2DC433C8;
        Tue, 18 Jul 2023 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689706003;
        bh=o8g9igO7U5+ASKWMumYFxd8ogyiTtgaFXyMt2CAqFb0=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=pZtdSroc5i0nbRxE7ZPhKmZcU1akOWuR6t0vjk98XJkiCKMCh2T8//nZnCKOndriU
         M2XnsHmgFgDNpXrWRsMt0ySNv0xwGiU9N41naHi9132KdboMEtUG5IZMUhQN80ROkC
         H0Z1Ru6/pC7nrapZOr7rwXBG2o/KCG7mDIRTAjcO6y4vHwdyWHMUOYq0TlS+0gdjVP
         ZFNWk36pYQyiMtua3dR5Xhr+WNLzMa77R0mnhHLbYCqT1rEyX0U+rrS9pjY7reKbIg
         6f1D01ug266xEyRVD680nobrjkNDIgXJH5aZbWr+QT61nftgHk0OmyVHKJSYUsBTHw
         Asn/G7jnDZpEw==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Syed Saba Kareem <Syed.SabaKareem@amd.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Yang Li <yang.lee@linux.alibaba.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
In-Reply-To: <b0c5b0ca-68da-47e6-a8b0-e0714f0de119@moroto.mountain>
References: <b0c5b0ca-68da-47e6-a8b0-e0714f0de119@moroto.mountain>
Subject: Re: [PATCH] ASoC: amd: acp: delete unnecessary NULL check
Message-Id: <168970600162.93966.9028166669589055047.b4-ty@kernel.org>
Date:   Tue, 18 Jul 2023 19:46:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 18 Jul 2023 10:04:18 +0300, Dan Carpenter wrote:
> The list iterator can't be NULL.  Delete the check and pull the code
> in one tab.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: delete unnecessary NULL check
      commit: c1325a2d5182f263f2edbc6e0c1e581e4c5d5a95

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

