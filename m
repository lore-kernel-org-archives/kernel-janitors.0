Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE098C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 13 Jul 2022 14:31:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236225AbiGMObC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 13 Jul 2022 10:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbiGMObB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Jul 2022 10:31:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9D833E3C
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Jul 2022 07:31:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A6CE2B82019
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Jul 2022 14:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45C2C34114;
        Wed, 13 Jul 2022 14:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657722657;
        bh=m65ju1eBUrKQs14mEqgPvnSbDjpwIWUCfEMPByfIU5g=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=qZ4xj6xGMqoovXDCeentESv+5VY55WwldlwuwIy312351Ae85knj5+iPjhTU2Z007
         s9atahdoGkG38VyoD80QGqf+L3wd/K00FEaQhp5wLC9RgqlNV4ovyLMbCBapmv2vBV
         NhVg7uBUdrEOnnwmjBKnBIBpAkBI0sX/Qjd1bBq4YTK9NSe5oN5V3w8avrYFreEZ3L
         f7IC6n8l/64WCJhG4iiY8BhZu/EkTszyyri6YSQBPYfY54wPjXRYhObMCO426Bg/oM
         G7GOwwI2fLEi2H0wyofVdIs+N6gOu7Hm9AcZ0fLfuULeDwOsXxJReaws2EDLVFfkF7
         WRpbjQL3QqHnQ==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>, dan.carpenter@oracle.com
Cc:     Takashi Iwai <tiwai@suse.com>, yang.lee@linux.alibaba.com,
        alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
        kernel-janitors@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Vijendar.Mukunda@amd.com
In-Reply-To: <Ys2IRPHWGIwuVs21@kili>
References: <Ys2IRPHWGIwuVs21@kili>
Subject: Re: [PATCH] ASoC: amd: Fix error pointer dereference
Message-Id: <165772265539.116109.6232452976191452367.b4-ty@kernel.org>
Date:   Wed, 13 Jul 2022 15:30:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 12 Jul 2022 17:42:12 +0300, Dan Carpenter wrote:
> The "gpio_pa" pointer is an error pointer, there is no need to try
> put it.  Calling gpiod_put() on it will lead to an error pointer
> dereference.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: Fix error pointer dereference
      commit: 73acfba792b06156b7c805162fcd89fdb71646f9

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
