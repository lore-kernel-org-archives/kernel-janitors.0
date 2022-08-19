Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F89FC28D13
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Aug 2022 22:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241500AbiHSWrl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Aug 2022 18:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiHSWrj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Aug 2022 18:47:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7D610DCD4
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Aug 2022 15:47:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD24961826
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Aug 2022 22:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF50C433B5;
        Fri, 19 Aug 2022 22:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660949258;
        bh=abBk2ZVaOUy4xBHNLpaWPwVqobxMotacxQj6vrlXOF8=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=JPnHC67OdTPByjj+kJpmTKYDxy7krVXj0njO1ZZ1T0bQMkPdsapXoSiYxXE5Bb39X
         uC2oJtZASNh3GFde0A4c4KoKBpqOU9okMlEQYPsrs9VHAi865KYK5rlGdpzaoLpxzD
         iAaII8vXu/Y7u3H1GH+S107EJhxgPTxxGabZk2HjhKc1rX6Wt8A6mUSUDJJfhlGzLT
         8OBhz4hMmMB2DIyDfIkIVJCmIpvJJ56aFSaTLHkjXDp0e0cSbjIYw2zk14+GNSykoS
         d1aVqIF+gXA1enKl8KZemZzEgzFPagXRgknZhZ/x85P9vKZ3fwlBwVUQs6QXbhAXMv
         xlLmj9l4vR1Xg==
From:   Mark Brown <broonie@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Cc:     Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
        alsa-devel@alsa-project.org,
        V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
        Takashi Iwai <tiwai@suse.com>,
        Nathan Chancellor <nathan@kernel.org>,
        kernel-janitors@vger.kernel.org,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <Yv8ePUuBfzaRu6xV@kili>
References: <Yv8ePUuBfzaRu6xV@kili>
Subject: Re: [PATCH] ASoC: amd: acp: remove unnecessary NULL checks
Message-Id: <166094925576.19151.18203388990072079046.b4-ty@kernel.org>
Date:   Fri, 19 Aug 2022 23:47:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 19 Aug 2022 08:23:09 +0300, Dan Carpenter wrote:
> The list iterator can never be NULL.  Delete the bogus NULL checks.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: remove unnecessary NULL checks
      commit: a74ec0bf5b67eae87317646571116ce4b4166d95

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
