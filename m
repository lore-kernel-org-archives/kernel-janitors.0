Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918D5C7EE23
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 May 2023 15:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234329AbjEVPCX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 May 2023 11:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234305AbjEVPCR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 May 2023 11:02:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B0F10D7;
        Mon, 22 May 2023 08:01:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6BEB0622B1;
        Mon, 22 May 2023 15:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132C8C433D2;
        Mon, 22 May 2023 15:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684767702;
        bh=qg01C3nZbKa097m6OuKXmVNIyMDy2jv56++B3U1PsZo=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=JQxmxXueCwdzpVkYRQqzluHGJ9yFKS2lK2v2REPyOkeBkAl6gy01Gl6ToKpjL8mi8
         NZTTn278QkXqLg0b1/lpkM9pBgYOmes6bD37WKNi658sU2d0xfj6mTUveDZV/rP8N1
         F5HjmPztGy+cAfyHB/QovZx/r3iGp0wUn0xx7FzOC9NJBF97RGJ7pmty1/0h/xctbR
         F4AT8WD2OQryZt9mJbGwcpDU8NNwIxiAlqOPRTWeZtjh7xEuCiq8jD6cOsd68nQTvV
         7VHrF1A57CEoG7/ntD/R3k0abpZ221tpaYgaFYX+Kprdf2qDP7fqfFJAXmTvhxm0uI
         L9uC3N2+kds4w==
From:   Mark Brown <broonie@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        alsa-devel@alsa-project.org
In-Reply-To: <ab0fe7e7ecf965df84b9516ba65428af9b3805c1.1684594081.git.christophe.jaillet@wanadoo.fr>
References: <ab0fe7e7ecf965df84b9516ba65428af9b3805c1.1684594081.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: adau1761: Use the devm_clk_get_optional() helper
Message-Id: <168476770080.849172.9653594558542908799.b4-ty@kernel.org>
Date:   Mon, 22 May 2023 16:01:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 20 May 2023 16:48:19 +0200, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> This saves some LoC and improves the semantic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: adau1761: Use the devm_clk_get_optional() helper
      commit: ef44ba21995e80e19e7056593067cb4bfaad0bde

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

