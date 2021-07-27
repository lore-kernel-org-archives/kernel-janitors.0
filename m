Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3449C432BE
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Jul 2021 15:47:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD05161B52
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Jul 2021 15:47:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237089AbhG0PrF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Jul 2021 11:47:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:52204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhG0PrE (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Jul 2021 11:47:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1242761B66;
        Tue, 27 Jul 2021 15:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627400824;
        bh=C91IOFLpn/xlTe/YVqK/AkLDbvPKJZILi/jlymQD7Mw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pZ66KAPYPX8myWetK+eJPLri9mdjl2h4JEvsee0o/ZItxGSCv7hxi3BnYY5yp3PcH
         4xQtaubLk9ii3LtvHgD1G7OkSPUMkXQ4O0TTdUnFADFRIIatGtkYr6C/LAVZDb5/6n
         WBYRcd31vG8OhKBvBeCBXOkfhLfEBivie+ubJ/LmE00nyusreAktEH3Z/3Y79W+oIj
         dmdMRsRntLWF8fbrLQu0QhyBe7XJikNiUeSma2MOIR+tSepeifCXiIEy9DWOjX0CsW
         XPNcaywtzmNDnEPqfn0j2fwgDcAjoMxlSiwlKfTvE0/4Biamt38hKsE2/wWAKLztvk
         riAhgcdKvBNdw==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc:     Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: amd: fix an IS_ERR() vs NULL bug in probe
Date:   Tue, 27 Jul 2021 16:46:26 +0100
Message-Id: <162739969149.18968.15163991241105613933.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727081756.GA19121@kili>
References: <20210727081756.GA19121@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 27 Jul 2021 11:17:56 +0300, Dan Carpenter wrote:
> The devm_ioremap() function returns NULL on error, it doesn't return
> error pointers.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: fix an IS_ERR() vs NULL bug in probe
      commit: 37108ef45ae9021d23174ce89e76ad41443090bf

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
