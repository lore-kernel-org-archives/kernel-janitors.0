Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6ECAC54EAA
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Jan 2023 22:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbjAZW4D (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Jan 2023 17:56:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbjAZW4B (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Jan 2023 17:56:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1C52DE7F
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 14:55:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3708861977
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 22:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBA7C433D2;
        Thu, 26 Jan 2023 22:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674773757;
        bh=lUlV7aiI0si0/W517FBDa/HeRq2i5wQgYiZ8e4/VPhs=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=NJ8I2pTHBLWb9hqw76GjVnV6JAeuMwrghH7OCL69Ywnzcw0hma9owHEn0ajjkcR+2
         LDPToCsgG14hdUcA1a71FHfrreEjFtpjY5lyDWaTsJp2yLsyJDgyMG36v/SwuT+D0a
         hXXGPROBCuaiQoTpNbVqWtw2TE/G3+H39NbPP91qI24Y9LGZrpht/e8kQXcx6jUp/V
         4OM2AJpgoMtuOjANAvLc3QL806WDoHVtRAu3jjbhqGgs+9I62knDXsh2kxSgtFqrH8
         Blumk/pfW4u8siG8Ljt3B/8XnxVu2GBLuAtuShCCoGgRFQxP3RlzKIusfqZ4ngyacJ
         qIKP5PQHppuEg==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Dan Carpenter <error27@gmail.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Trevor Wu <trevor.wu@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <Y9JHSwcfdNcfMjjt@kili>
References: <Y9JHSwcfdNcfMjjt@kili>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: remove some dead code
Message-Id: <167477375499.524795.3525968034845691950.b4-ty@kernel.org>
Date:   Thu, 26 Jan 2023 22:55:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 26 Jan 2023 12:26:35 +0300, Dan Carpenter wrote:
> We know that "irq < 0", so delete the unnecessary check.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188: remove some dead code
      commit: aa326917f58fa577bfba8976da214080bdec2699

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

