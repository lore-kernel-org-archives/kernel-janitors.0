Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BF8C47089
	for <kernel-janitors@archiver.kernel.org>; Mon,  5 Dec 2022 17:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbiLER3G (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 5 Dec 2022 12:29:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbiLER3E (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 5 Dec 2022 12:29:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2AB6432;
        Mon,  5 Dec 2022 09:29:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CF5C4B81190;
        Mon,  5 Dec 2022 17:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC42C433B5;
        Mon,  5 Dec 2022 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670261341;
        bh=YE/c8SUtkWFd5cfG4AxPEAOfpuHxTatAphnKRUo2hoY=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=AYeFAUhqgwKcTKFncGSJXk1ySZ1bUuiP1qIM1BeltXMbpSJl6UM9wPO+XbFKnRLKX
         REZrCrJy/6DKdmPeApH3b0cOmklvir4vJCVLCaZ82JaGs3tAIXCjbvlid9rbVSYa/P
         QYtvJVdD2FJmREHO5QsyBnD9mRyR9TSs2Edc8Vj55LanKNGggrsQSZEna3vsJG9Hbj
         RAWOdLT2pMBqpElHbcQKKJG9oUCXC1bFWpBTwa1PUtLjKYdtv7H1tcblEe4M+nTeD/
         VLvd9+sF4ej2IXh4tWhZCAg5a8qYg4A256kHl9lddsNI9n+pmdUblJuolR16MJp4bm
         rZaaOW0R+foaw==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20221202170644.1814720-1-colin.i.king@gmail.com>
References: <20221202170644.1814720-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: wcd938x: Make read-only array minCode_param static const
Message-Id: <167026133998.536379.6995048485113628098.b4-ty@kernel.org>
Date:   Mon, 05 Dec 2022 17:28:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 2 Dec 2022 17:06:44 +0000, Colin Ian King wrote:
> Don't populate the read-only array minCode_param on the stack but
> instead make it static const. Also makes the object code a little
> smaller.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wcd938x: Make read-only array minCode_param static const
      commit: e110ede8c31da90caae375deeac12e553a0aeaf5

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
