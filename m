Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3E5C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Jan 2022 18:02:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356586AbiASSCp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Jan 2022 13:02:45 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:33360 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356575AbiASSCk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jan 2022 13:02:40 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 40E30B81995
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jan 2022 18:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11466C004E1;
        Wed, 19 Jan 2022 18:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642615358;
        bh=ntFkmrYHf7DolESwdFrg5bWQtilBQv+yuy5/Fz0esAE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Num7TfczXyuFgQUEaNnJsxuhSPEJa5PzPlZ5KozMoGrfRWShxkoP7/mYFMiHF95OE
         7+5+NJYqaTSEO2qcVwWnoCbmR9lfq4XyuAgMjh089/69bWLCukl3vxSoxJ2umxSCcl
         CeMeOLNjfSgTa0+lHuC2wo39eaIbiMVRnrp+n0Dk3ofzouenC3Zh5iPDLAGMv5Uh0f
         EIaPwQeOepjIJArXqYokLFfuJsTzq+wvMMl/+rZkPsLF+tohMh8mvDS7/Fir8UDLkB
         WYkdzPwCb+75pOQdsP/qlB8lB7jod41ydD5NOUoYgQE8QBuaWz8oDBPbPq/zWyCO84
         tRPVbP0FWry3A==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        kernel-janitors@vger.kernel.org
In-Reply-To: <20220119123101.GA9509@kili>
References: <20220119123101.GA9509@kili>
Subject: Re: [PATCH] ASoC: max9759: fix underflow in speaker_gain_control_put()
Message-Id: <164261535576.2816847.8184092572557171826.b4-ty@kernel.org>
Date:   Wed, 19 Jan 2022 18:02:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 19 Jan 2022 15:31:01 +0300, Dan Carpenter wrote:
> Check for negative values of "priv->gain" to prevent an out of bounds
> access.  The concern is that these might come from the user via:
>   -> snd_ctl_elem_write_user()
>     -> snd_ctl_elem_write()
>       -> kctl->put()
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: max9759: fix underflow in speaker_gain_control_put()
      commit: 4c907bcd9dcd233da6707059d777ab389dcbd964

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
