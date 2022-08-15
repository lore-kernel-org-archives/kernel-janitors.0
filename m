Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87042C28B2B
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Aug 2022 16:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbiHOQ0J (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Aug 2022 12:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232040AbiHOQZe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Aug 2022 12:25:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69138275C1
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Aug 2022 09:23:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C819AB80FEC
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Aug 2022 16:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94311C4347C;
        Mon, 15 Aug 2022 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660580602;
        bh=M48z2KqCHhL953p7b1Jg0Gu4m0TjqNK8KDEbgoo0JM8=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=FXq9TSSYTg7OpDTuH1ZAddk6xdRmPg/M2VqfFMK5gt0bsnL3QVez4AZAZNCyRXiSM
         NOdlOYS6T4qufeYEdhi6y6C35ew+IOkuT7DiaI67iPHNhfMirG0P8wDi1oVqnuAOFV
         CsQvZfeZUnvTwJpHn/dL5hdv8Cjg4vu71h10IfzLbpkY9+xnEf5Rr+W9s42HjW5GHy
         7s4SRipdH7iORl66cbaUSBwqsF2tLqkleK7ni6c5B8P566CA/jpVdFPt6opUcew30n
         +bwWyp+5vHJCHeyIU07yzpU1fPtox03xyA7pCjbz12wlSgs3ar+Rhjprtuy2TXiLK8
         Iop3mp0X+d6/A==
From:   Mark Brown <broonie@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Argus Lin <argus.lin@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Liang He <windhl@126.com>,
        kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org
In-Reply-To: <YvThhr86N3qQM2EO@kili>
References: <YvThhr86N3qQM2EO@kili>
Subject: Re: [PATCH] ASoC: mt6359: fix tests for platform_get_irq() failure
Message-Id: <166058060031.769843.15519074468480649760.b4-ty@kernel.org>
Date:   Mon, 15 Aug 2022 17:23:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 11 Aug 2022 14:01:26 +0300, Dan Carpenter wrote:
> The platform_get_irq() returns negative error codes.  It can't actually
> return zero, but if it did that should be treated as success.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt6359: fix tests for platform_get_irq() failure
      commit: 51eea3a6fb4d39c2cc71824e6eee5949d7ae4d1c

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
