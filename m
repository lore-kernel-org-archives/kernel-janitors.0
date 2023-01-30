Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF49C636D3
	for <kernel-janitors@archiver.kernel.org>; Mon, 30 Jan 2023 21:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjA3VAG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 30 Jan 2023 16:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjA3VAG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 30 Jan 2023 16:00:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA08A45BF4
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Jan 2023 13:00:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 469D3B80E78
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Jan 2023 21:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB98C433EF;
        Mon, 30 Jan 2023 20:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675112400;
        bh=cf47b8CAKK73Es+LoTlxJKk80qn/DQy1RvwAP1SqyUM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=WzI0yrz5MLh+YZP+wofAz67AukTVZU0QtEHdm3HjwLu9Cx6+g6Czt3cMj+vOooU0Z
         Cpk0GEweBMxjMk0N1m9K1Rq2i1jqMDfUE6MoT5G+vhufLGiPHjZ3zZ4T68xHfYVewc
         XnM6v212lKPlOEP8KjKyN5rSiBP/nKBQO8+UdqC8wXOhlIrIvEljMctmFD2GroXXgM
         uywzlLb4K7sO8NuzoRWlIwz+q1ioND79PWyhEro+O6xWVIkm4pQE/O/M+GJexKCQN4
         /oaVYcKpWRqxaz/Ik+Vy65kSsOMMpQFWAg3CU822fw78T2JDjwnPpwu/aI0pPnvAKT
         71Uew8aWOAJ2A==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        KiseokJo <kiseok.jo@irondevice.com>, alsa-devel@alsa-project.org,
        Colin Ian King <colin.i.king@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
In-Reply-To: <20230130092157.36446-1-colin.i.king@gmail.com>
References: <20230130092157.36446-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: SMA1303: Fix spelling mistake "Invald" ->
 "Invalid"
Message-Id: <167511239928.2141894.16999579130173129133.b4-ty@kernel.org>
Date:   Mon, 30 Jan 2023 20:59:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 30 Jan 2023 09:21:57 +0000, Colin Ian King wrote:
> There are spelling mistakes in dev_err messages. Fix them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SMA1303: Fix spelling mistake "Invald" -> "Invalid"
      commit: 5b28c049ff53cf49e3a97d80cebd2e9c2779ea96

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

