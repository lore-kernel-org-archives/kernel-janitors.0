Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F829C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 13 Sep 2021 10:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A44961029
	for <kernel-janitors@archiver.kernel.org>; Mon, 13 Sep 2021 10:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239428AbhIMK4Z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 13 Sep 2021 06:56:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:52144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239305AbhIMK4U (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Sep 2021 06:56:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E90861004;
        Mon, 13 Sep 2021 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631530504;
        bh=adzHkMe7QmqPw8mLlHRzTAcZPu5KFFN4TF0NE5fBBzI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j8Ntwz91WlimLio4nImgaFi/iKuvbcXXcsfwl/+3mdXBR6WtISZlRBF9WYxKnj0PI
         iqihBxsZWawgUnhmJp8KLd9knRR7kL3jJy06N8qwYplhfmPn+EbVqdJhCg3E8Ye58L
         aTRTMIXtz6so53Of6/XP/YQdO1lAcn17qHE3GvS7MSzqb9L2wvrMdIZixEcUU+nmdF
         MAM+tKWA644giBPOl2YJa+QTVyndPvljFoHMIlBNeswnlDF76gUz1XoFZGUVIMRSrH
         Yyn8Z6VMncU42MfgtJ0tLf8j51eul68NtespESTVcRVltD3yrBIqHKCqmflY4KxxwK
         K3AWl5v1bW4Gw==
From:   Mark Brown <broonie@kernel.org>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        linux-arm-kernel@lists.infradead.org,
        Colin King <colin.king@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
        linux-mediatek@lists.infradead.org
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Fix unused initialization of pointer etdm_data
Date:   Mon, 13 Sep 2021 11:53:24 +0100
Message-Id: <163152996585.45703.6144242874194833843.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903114928.11743-1-colin.king@canonical.com>
References: <20210903114928.11743-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 3 Sep 2021 12:49:28 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer etdm_data is being inintialized with a value that is never
> read, it is later being re-assigned a new value. Remove the redundant
> initialization.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Fix unused initialization of pointer etdm_data
      commit: d67bbdda25c4156da079312a3594a41770123abd

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
