Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAC9C7EE23
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 May 2023 15:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234369AbjEVPCy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 May 2023 11:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234424AbjEVPCo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 May 2023 11:02:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF59E18F;
        Mon, 22 May 2023 08:02:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B8047623C2;
        Mon, 22 May 2023 15:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD9DC433EF;
        Mon, 22 May 2023 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684767712;
        bh=ZzCrfWXY7FxJ0s2FjGH0TL7QTy+9v4JSvkeEVCTndqw=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=tfgobSaIOSHpTwW0PLhFpvBjgFoEtYOui1gIFUGOc/WebAOEty04B4Tdk4Iuphk4K
         /5n/jOVqHJnqaSgXAqUZrZBdzj+ElKXzzMUuSSZIMdo4Ib3YdvDYA4lNlhzQ0p1Bbe
         O3yO8fN8gg4QSCPNtOnoFe7WfzRVpJR2HPNVR4cycPhhgk63UOMmv4Piv3I+ASwP4e
         GAcRV/BQUzsKDJuOWn4sUH8l+LnO7JhxPPxmrDPJdOaE1a4UaibOOUaxFNCCGjm0pX
         8zYLZUMen7s6P8T3Y1zxXIP+0IVBwRXVHmXnNoNzqHdOze/wnMBSXL2rG8fs/Fn0zA
         AlreJyxRfioVA==
From:   Mark Brown <broonie@kernel.org>
To:     Oder Chiou <oder_chiou@realtek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        alsa-devel@alsa-project.org
In-Reply-To: <f538c24ad7b1926478347a03b5b7f0432e195e3b.1684594691.git.christophe.jaillet@wanadoo.fr>
References: <f538c24ad7b1926478347a03b5b7f0432e195e3b.1684594691.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: rt5682s: Use the devm_clk_get_optional() helper
Message-Id: <168476771031.849172.218735201462158916.b4-ty@kernel.org>
Date:   Mon, 22 May 2023 16:01:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 20 May 2023 16:58:24 +0200, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> This saves some LoC and improves the semantic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682s: Use the devm_clk_get_optional() helper
      commit: 17cf9faeba463d24e7c497ff8137a8c8414644dc

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

