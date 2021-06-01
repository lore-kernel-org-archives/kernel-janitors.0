Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9310C4708F
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 17:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B425E613EA
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 17:39:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbhFARkt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 13:40:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:60746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234697AbhFARkg (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 13:40:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2AF361378;
        Tue,  1 Jun 2021 17:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622569134;
        bh=jGFulKz5aiIUyaEwffq5AU8/gNHWfcxCHNazCV/IHJo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=psJlrYnKpNgKJ8SUR1ZFoFLqC1ZviwVUVQ6LdWWqboHYBzNXoTBEEGdUs7f7xVlcp
         UYOAewfuzFyylB9bqXtjJtt3TyuSVZ2A0+mcGSJOfhsGkQWn84aaPsP2oz4h/4o9de
         X9wridsH0+4A4UcvpgLqzBeOMwX4J09RVQJ+Q9dAM0mt6eOHlSTIxDGTCZIl6gfemn
         b4Q6F2MwjQchf1Ejfx0e196M36JkKEB8dxvZwaqcH+JfZlMhRjs5poIkSEz0JFjTzZ
         dVEZ5NFX7sJU3lK+MTTbx8Rr09Xa6zYWPukfOVkBqQIdz3FkFEp2DQaE3QTRjn37yV
         J28oDvKvqYyzA==
From:   Mark Brown <broonie@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        Colin King <colin.king@canonical.com>
Cc:     Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: topology: Fix spelling mistake "vesion" -> "version"
Date:   Tue,  1 Jun 2021 18:38:10 +0100
Message-Id: <162256892745.19919.2249782146567901885.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210601103506.9477-1-colin.king@canonical.com>
References: <20210601103506.9477-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 1 Jun 2021 11:35:06 +0100, Colin King wrote:
> There are spelling mistakes in comments. Fix them.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Fix spelling mistake "vesion" -> "version"
      commit: ce1f25718b2520d0210c24f1e4145d75c5620c9f

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
