Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4440CC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Dec 2021 19:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241761AbhLUTMu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Dec 2021 14:12:50 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:38794 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237372AbhLUTMo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Dec 2021 14:12:44 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D632361797
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Dec 2021 19:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D9FC36AEA;
        Tue, 21 Dec 2021 19:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640113963;
        bh=zgeZRVRuafwQrEQMbJc8CNZl8kFQYTvPQfyRtjn3/VM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=YxKHvZ4ib1x6Od9tHuokB1h1qHxqybGhoN7wyIAgjd0TcnUx8xrR180OnZGIqNbEG
         uK+Eyyhyt58sG8LmjJCUqzSFxRImuHJAm/0mrAvSLMSgiXJbOn20qOmKKU/Txs7LAc
         77n+KrSKhsBmM0qegALj+df95fCBoYZTSAh3qj6e3krHmW9V6itRJwfO/pTO++I/4M
         iogMmDPv71uSgy21Ci89XQtVGMaxWikwskmkUg5Pr4UZuXTftki+arO2kEFaJmXyRN
         Wifkrc08Ns4AtDn6NTnFtpzaoAlSDo8x48yBl+biBThOlMfa2LvdE0Dvbu3phCXuRG
         WPcRs34/YYGJA==
From:   Mark Brown <broonie@kernel.org>
To:     Miaoqian Lin <linmq006@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        alsa-devel@alsa-project.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20211217150007.GB16611@kili>
References: <20211217150007.GB16611@kili>
Subject: Re: [PATCH] ASoC: qdsp6: fix a use after free bug in open()
Message-Id: <164011396113.93163.3445360337147394616.b4-ty@kernel.org>
Date:   Tue, 21 Dec 2021 19:12:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 17 Dec 2021 18:00:07 +0300, Dan Carpenter wrote:
> This code frees "graph" and then dereferences to save the error code.
> Save the error code first and then use gotos to unwind the allocation.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qdsp6: fix a use after free bug in open()
      commit: ac1e6bc146d45e15f0a5c0908338f918f6261388

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
