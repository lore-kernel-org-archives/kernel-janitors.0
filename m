Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52ACC71153
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Aug 2023 19:13:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjH2TM5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 29 Aug 2023 15:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234731AbjH2TMZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Aug 2023 15:12:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA4983;
        Tue, 29 Aug 2023 12:12:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9AF0F61CE5;
        Tue, 29 Aug 2023 19:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8AAC433C7;
        Tue, 29 Aug 2023 19:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693336342;
        bh=Y7BWzSc1wFmIX6sTKYMV6PLaewMUa7ZUlRGapp3Ioi8=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=PKN5m15DXO595Bhz9BRIBaawKwSMtOsqBsxocXLUvyxmSyoLkJIt/JcS2QgsERIjf
         YQV5dW+/xVCyUQa13+bazoMI1c9UmFie/IK0zgcFNWVtO3/4vpHYSDCklUPxXIrHKW
         BmS3Pn0d+bTzvIhCBqQcMZ12goCjDJoQCwJViPNCbgHWvXc1n39o7f/c5w1k4CoMAW
         an6W1kIJWZBucjM64zKIo+xPjS1YEdS2r1+Xa6B4zNMwIhlXzOSJYPpLQJ8v5mk/qj
         UCxqw8gfSRiR/SiQn535ayH+hA6EwhCztrgxIVnXgfGg3bGDPm+kFBMYNvIRCfJScs
         EmSE5TD0emOxw==
From:   Mark Brown <broonie@kernel.org>
To:     James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc:     dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com
In-Reply-To: <20230829073635.1877367-1-harshit.m.mogalapalli@oracle.com>
References: <20230829073635.1877367-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH next] ASoC: cs42l43: Fix missing error code in
 cs42l43_codec_probe()
Message-Id: <169333633540.3145573.6288237748073624350.b4-ty@kernel.org>
Date:   Tue, 29 Aug 2023 20:12:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 29 Aug 2023 00:36:35 -0700, Harshit Mogalapalli wrote:
> When clk_get_optional() fails, the error handling code does a 'goto
> err_pm' with ret = 0, which is resturning success on a failure path.
> 
> Fix this by assigning the PTR_ERR(priv->mclk) to ret variable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Fix missing error code in cs42l43_codec_probe()
      commit: 9e07f8bfd959d2d09823430eab35d12182446dcf

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

