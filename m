Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB550C432BE
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Aug 2021 19:22:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9295760F39
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Aug 2021 19:22:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234780AbhHSTXO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Aug 2021 15:23:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:56932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234706AbhHSTXN (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Aug 2021 15:23:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E119610A0;
        Thu, 19 Aug 2021 19:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629400956;
        bh=hjanTyI3N9VyIXFopjH48AbrKtMvCkP6wd0U5aKuEHM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZPcyTnsUdognRf0uS/SnvDWG8oK3+/BsQay7ExsRyKgzV5TT/XWrL4nga3lwwSKZP
         fiMnksbLLlbXNaNBna5PlAPzMCZT0iNVOIne7Nb69k4QzxgKvIuqmw/BOx+ojq1TKi
         gUZhz0fpal7VU8p2B5TKDgX2P26NZFbVS6gCq3xCx9h9PmY6mf/VrKlv3lm2/3h0Ha
         DiixDjenXQ9I6FxVCQ2bOtHCtdPezRxbP3yXl40ORldbu/lPOpn0UwCQMX0gBmGMxT
         4qbtMBaRsjtAWdvS18q+0lrS7gSObwSiLY6vbQua5Lf+1k+Pt9eVsZFoHTl4dojPa4
         CuppptZDsxWlQ==
From:   Mark Brown <broonie@kernel.org>
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Colin King <colin.king@canonical.com>,
        Takashi Iwai <tiwai@suse.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: uniphier: make arrays mul and div static const, makes object smaller
Date:   Thu, 19 Aug 2021 20:22:08 +0100
Message-Id: <162940023650.48070.9595577624316730352.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818151746.38520-1-colin.king@canonical.com>
References: <20210818151746.38520-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 18 Aug 2021 16:17:46 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the arrays mul and div on the stack but instead make them
> static const. Makes the object code smaller by 4 bytes.
> 
> Before:
>    text    data     bss     dec     hex filename
>   16226    4984      64   21274    531a ./sound/soc/uniphier/aio-cpu.o
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: uniphier: make arrays mul and div static const, makes object smaller
      commit: 5d925d9823aaf18d55fab784bd4ef11f80fe1099

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
