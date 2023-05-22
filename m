Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B75DC7EE26
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 May 2023 15:02:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234321AbjEVPCe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 May 2023 11:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234303AbjEVPCW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 May 2023 11:02:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F3810EB;
        Mon, 22 May 2023 08:01:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4856623C3;
        Mon, 22 May 2023 15:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FBCC433EF;
        Mon, 22 May 2023 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684767708;
        bh=IqFoE1vzW8OD6q9MnkhBNHhAcZ3K1ijd/6xeXtNZXU8=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=J225SecD6uHN7q5v/a9RgarwV4dcBwa3SSt6XO17uqsDUzgcddJP5PPq2DQrlqDJC
         uwn+5M5RaKQgPHxeOWQL+p2KDiv6lzgtARLguGtj1R3cagaWajC5o/U51WfjJ9ialS
         KJf4IG7HdVqSy8JewgJeORMzkq7fmdiIygyomez21uvX4jkdEGVrYZy9NB0d2OLwpg
         FPZZtSiKmmofQeaA7N606pXkdWzSEapz59c+E5XLCUy4w1WwX+mY7sg6Ikk0vWw3bd
         eYeq5vPd0NZSY3M6l+8gmqmPWdLryrF2p8iMUc4FbjDe4AB42MtoB5/NC7vQBj5KCe
         5uoFWiceMXw8g==
From:   Mark Brown <broonie@kernel.org>
To:     James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com
In-Reply-To: <3219effee5c7f190530bdb1ef8ec35cb142e3611.1684594433.git.christophe.jaillet@wanadoo.fr>
References: <3219effee5c7f190530bdb1ef8ec35cb142e3611.1684594433.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: cs53l30: Use the devm_clk_get_optional() helper
Message-Id: <168476770565.849172.13295031739089654350.b4-ty@kernel.org>
Date:   Mon, 22 May 2023 16:01:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 20 May 2023 16:54:06 +0200, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> This saves some LoC and improves the semantic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs53l30: Use the devm_clk_get_optional() helper
      commit: 0b855cbbd769940fcaf49b2371a05235d8499d5d

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

