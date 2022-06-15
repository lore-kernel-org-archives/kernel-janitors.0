Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287F9CCA473
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Jun 2022 17:08:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349776AbiFORIq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Jun 2022 13:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349719AbiFORIn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Jun 2022 13:08:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F09B31DFD
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jun 2022 10:08:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 166ADB820C4
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jun 2022 17:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A64CC34115;
        Wed, 15 Jun 2022 17:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655312918;
        bh=Wcvp8mCTF0vA1Izf8dbxoQE7s/QBBKvOMJdR6TDX1nE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Q+AmjVG1yX//0RTOk2NZsCrpHZ342RhxY/RE7Y15d151OqRkHWEDHp3rh8Kx7lfFc
         pmEJtElprkPA40vW4SolGJ37QtUdO9FpyokWuINtpWy8dE20H+ur4lE9FMTVWHRWPC
         g0fsUSq1vZTOhqmzo/r6v664VObEnaewO7YyYY+mZEbdBEa7GG3YjSB6POskxi3mTP
         2u9VzI9e/79Bcm5STijGhaaSPXLpybR5H9hd5vvMHyANUtfVt8LBfQwLakGZlVsNzg
         4qknUsPn+1C/A6ZBll1/2+evkXn+JbNf9FKypbmQv1g3eP6cmgNtGsSvPIHo0zEYYG
         XRqqtZFKIAA1w==
From:   Mark Brown <broonie@kernel.org>
To:     dan.carpenter@oracle.com, tinghan.shen@mediatek.com,
        pierre-louis.bossart@linux.intel.com
Cc:     sound-open-firmware@alsa-project.org, daniel.baluta@nxp.com,
        kernel-janitors@vger.kernel.org,
        linux-mediatek@lists.infradead.org, tiwai@suse.com,
        lgirdwood@gmail.com, perex@perex.cz,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        yc.hung@mediatek.com, matthias.bgg@gmail.com,
        Allen-KH.Cheng@mediatek.com, peter.ujfalusi@linux.intel.com,
        yangyingliang@huawei.com, alsa-devel@alsa-project.org
In-Reply-To: <YqmWIK8sTj578OJP@kili>
References: <YqmWIK8sTj578OJP@kili>
Subject: Re: [PATCH] ASoC: SOF: mediatek: Fix error code in probe
Message-Id: <165531291502.3574042.3082631572005013512.b4-ty@kernel.org>
Date:   Wed, 15 Jun 2022 18:08:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 15 Jun 2022 11:19:44 +0300, Dan Carpenter wrote:
> This should return PTR_ERR() instead of IS_ERR().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: Fix error code in probe
      commit: 62257638170eee07926c9df5a4c9059ec69a3734

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
