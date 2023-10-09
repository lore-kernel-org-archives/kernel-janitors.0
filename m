Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F12CCD611D
	for <kernel-janitors@archiver.kernel.org>; Mon,  9 Oct 2023 18:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378056AbjJISgb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 9 Oct 2023 14:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378055AbjJISg1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 Oct 2023 14:36:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580C0CF
        for <kernel-janitors@vger.kernel.org>; Mon,  9 Oct 2023 11:36:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2B6C433C9;
        Mon,  9 Oct 2023 18:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696876586;
        bh=+QPgU7tZbSjlQmBiszLV/gnTedCkn+UeSkKgZ9idR64=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=HLmYl8yZrRs0G/Gqaiaz/D17bfLM+vyMebeuSGyKhdBjifE8CfnY8RG60C/OoC0cL
         HkwecJvwi1H6ATEJpvHoLR7oDXFfAusKzgDvdFIVGF6+spiH6zA2BVgl4WYrt5JTw/
         KGj2KuMWyMa1y+XeJSX+lfiDwT8zWHF3dQkZU1/1io0Y+DwkDCKCbVZQhmle38Lyy2
         qbbaWvaPQ9Gh6uDE2DkgCI1hRT2EioNC5rkOiSgzC3wcGriwknptLpnlNvb36tIyBy
         er9tmGpSet75PSLVl1X4b8Mkx9etSi16npbEb7JD2PYHXTAxRpJeQBsXU07qv8z4o9
         XJWc1Kh6NQ9ug==
From:   Mark Brown <broonie@kernel.org>
To:     Daniel Mack <daniel@zonque.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <84ac2313-1420-471a-b2cb-3269a2e12a7c@moroto.mountain>
References: <84ac2313-1420-471a-b2cb-3269a2e12a7c@moroto.mountain>
Subject: Re: [PATCH] ASoC: pxa: fix a memory leak in probe()
Message-Id: <169687658335.138823.2904268371010439072.b4-ty@kernel.org>
Date:   Mon, 09 Oct 2023 19:36:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 05 Oct 2023 17:00:24 +0300, Dan Carpenter wrote:
> Free the "priv" pointer before returning the error code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pxa: fix a memory leak in probe()
      commit: aa6464edbd51af4a2f8db43df866a7642b244b5f

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

