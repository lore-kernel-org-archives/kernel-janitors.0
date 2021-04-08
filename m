Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6062DC433ED
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Apr 2021 16:55:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F8A761154
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Apr 2021 16:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbhDHQzw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Apr 2021 12:55:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:41804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232400AbhDHQzv (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Apr 2021 12:55:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DED42610A2;
        Thu,  8 Apr 2021 16:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617900939;
        bh=bADBejaDDFUvPit3yESreAk5CCNK7QnwI7lBb+jFjuo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V3PoMP8PWrYTANRipi8JY/moMuFySOsdM6qc0jJ40mGGWWL3w5S51fbPA9wWjEi2Z
         X/zD/laG2yXM3sy0IoPjtcy5ODU5UC73huouPRC3swZGw0skdiQ0raPkrESrmXhIgX
         m4dgbfa+EWmSm+UaXdszeMoHJEvwoCxKTcGibgJ0Lu72kGXVobcPX36v3K0Xzm+Bi6
         HlvqCSkia0jzef0oX2up6l0rvIX9iCD9QbDmEBGjkwCkWykmG4OngatgN9lpEYOn14
         oDdPh3suF7DtROY15rxmFznBTIZKd9sCaG6hSON8oyktgiQ1P1bYLEIkJmBvDSAREt
         V3hE7q7fMOPvA==
From:   Mark Brown <broonie@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Ye Bin <yebin10@huawei.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Takashi Iwai <tiwai@suse.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, Hulk Robot <hulkci@huawei.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] ASoC: tas2770: Constify static struct snd_soc_dai_ops
Date:   Thu,  8 Apr 2021 17:54:41 +0100
Message-Id: <161790012551.16915.15616439731032639355.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062646.803053-1-yebin10@huawei.com>
References: <20210408062646.803053-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 8 Apr 2021 14:26:46 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2770: Constify static struct snd_soc_dai_ops
      commit: f2ec1ebb257155fb534cad390575d696dfd567fb

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
