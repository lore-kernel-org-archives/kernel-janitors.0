Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A5FC433B4
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 16:24:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 448D6611BF
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 16:24:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbhDIQYZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Apr 2021 12:24:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:60222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234174AbhDIQX4 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 12:23:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D84E76105A;
        Fri,  9 Apr 2021 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617985423;
        bh=4THxi9Gmmsw/c0HXapMxqrYnTfey6Tgb5ZUkkxV6TDM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TLUeCRyZdfzv647wURLa1tjFWOIZKWjyYxO1B6yDLsuVKxrAcMP/XgZU4hQp7P6RH
         yXLRVEMHYl3gSGLzyUcsC/ep5Z6JLPIPXI6X+kSPUnqPpmSm6HJ3eWdS0Bhx/AWfIE
         AQraxEMtT7t7EQdq2PTdWyyXBHq+gWT47HPMdC93OnLNP6z5qEKPvx2bYHzf5rDuL4
         FONIhcBtpwA1s+gCD/DXm6i1NzJNfWX7x3Qq4CQpblR1wDJArknmPKGJIyzRlR6b+2
         0IVzV/rAogHr/j4UsBBjkBjJYXWELo/UT7d8LA035lhkKdLiv3MLbIIpIgElMVEsfa
         uiuJRwkw05e1Q==
From:   Mark Brown <broonie@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Ye Bin <yebin10@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>
Cc:     Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] ASoC: wcd934x: constify static struct snd_soc_dai_ops
Date:   Fri,  9 Apr 2021 17:22:48 +0100
Message-Id: <161798344183.47643.7944011356113525244.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062648.803227-1-yebin10@huawei.com>
References: <20210408062648.803227-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 8 Apr 2021 14:26:48 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wcd934x: constify static struct snd_soc_dai_ops
      commit: e994cf82689465ddae2dfa9c9bc69616a0003649

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
