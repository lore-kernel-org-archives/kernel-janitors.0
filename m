Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3954C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Mar 2022 20:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245326AbiCGUkV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Mar 2022 15:40:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245341AbiCGUkQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Mar 2022 15:40:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D7877A8F
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Mar 2022 12:39:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 31B98B81714
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Mar 2022 20:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51622C340E9;
        Mon,  7 Mar 2022 20:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646685558;
        bh=kfRKFupuLhzforhTOfYrOlnEcnMRt1cRf4Jr2UuaEzk=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=k9vaLGfp6eL7dBGmy0wsTzzeZk52nprOXcKgBXka3S6jh7jC51F85NRzpEf9BQhnb
         cjFsfy0Q28gZfGYLPAGeaU+TJQH+d5gJWZB8yE9TyBdKL3NY49ZicG0j1bv7CcI9SF
         wgHoh6i+vWovxkX/g9Iu08Jcmv7bFoWPLBelLLEhYcg9XPV7POwWLdVXx4lgQu0J+E
         PAsEyMc9qxJW7wC4eI/hY6OwbjhQBtxKEUEG+uvUsf7FN2CyvFLDJvMQ8qMxfKtSRA
         we8tX9pvjFApmaSMIouM3toICelnY3tAxQftCR+8ZTc/u0GIopXVvppghy/GCF7SF3
         il6YO4L+FmTHA==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Meng Tang <tangmeng@uniontech.com>
Cc:     kernel-janitors@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
In-Reply-To: <20220304131449.GC28739@kili>
References: <20220304131449.GC28739@kili>
Subject: Re: [PATCH 1/3] ASoC: amd: acp: Fix signedness bug in renoir_audio_probe()
Message-Id: <164668555706.3137316.278603309577942240.b4-ty@kernel.org>
Date:   Mon, 07 Mar 2022 20:39:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 4 Mar 2022 16:14:49 +0300, Dan Carpenter wrote:
> The "adata->i2s_irq" is unsigned so this error handling will not
> work.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: acp: Fix signedness bug in renoir_audio_probe()
      commit: 899a9a7f624b5a9d100c9ac6b3f0960981f0e4c5
[2/4] ASoC: amd: pcm-dma: Fix signedness bug in acp_pdm_audio_probe()
      commit: 00925272f166db31fed73f3c00c151eb5f7ce1d8
[4/4] ASoC: amd: pcm-dma: Fix signedness bug in acp3x_audio_probe()
      commit: 9a33f5632ca573e512c49fa46cc7131cbc83d4c9

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
