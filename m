Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B60C25B0D
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Aug 2022 16:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbiHOQZi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Aug 2022 12:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233040AbiHOQZH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Aug 2022 12:25:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A342524F0B
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Aug 2022 09:23:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 43E04B80FEC
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Aug 2022 16:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB92EC433C1;
        Mon, 15 Aug 2022 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660580581;
        bh=e7z1wZFXKyKTx+/Gp205MIBB5Y2JE/nLNvE5mKdLmXo=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=swWLDFdwixRMFnyIcl35ZTLWeedljORzZDGDlFZh3QvDRfNe6/gmdy6t5vNSOUCMs
         cFISGVQPxpedO9pFaxqUTBkVeCBDd9eaI83aFsIZwpehtBo00koo7k2f12NZUZPKvy
         SmcfpEZvylc2uRegQo9l3/Wl6HwIx06MRNmBLp5zar4H1r/mPBQANOCllbgF0Fcjg4
         rT0d8M16VP0HWqCwV24Mced9oCvNfoPV2ciZw7xFBXfBlUr2gZ6FWsB4+60TPboZsH
         wz1ffFFcu69E/UwtwCCJugZM5Nlmb6Q26yx6CJ+t6gFvWkANg89rGPfSdwd30gSBEv
         STpwYIxwladCw==
From:   Mark Brown <broonie@kernel.org>
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org
In-Reply-To: <Yuo7LGPk8KnBW6ac@kili>
References: <Yuo7LGPk8KnBW6ac@kili>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: remove unnecessary NULL check
Message-Id: <166058057968.769843.14245211698253942822.b4-ty@kernel.org>
Date:   Mon, 15 Aug 2022 17:22:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 3 Aug 2022 12:09:00 +0300, Dan Carpenter wrote:
> The "i2s_priv" pointer cannot be NULL.  Some NULL checks were deleted
> in commit d7bffbe9cbd3 ("ASoC: mediatek: mt8186: remove unnecessary
> judgments") but this one was accidentally left behind.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: remove unnecessary NULL check
      commit: b9f0a8ffd6265e7d8c7464a7990330da85ee07ef

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
