Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55D2C6FA86
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Sep 2022 10:34:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbiI0KeV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Sep 2022 06:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbiI0KeR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Sep 2022 06:34:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421A8EB12F;
        Tue, 27 Sep 2022 03:34:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D55D6B81ACA;
        Tue, 27 Sep 2022 10:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A89C433D6;
        Tue, 27 Sep 2022 10:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664274854;
        bh=lJjHanQhAo4gyBUD5O9aZXDqaj4cVWoKZzJdtxw5DuA=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=CDtX/a6mIQ2vC0NJAzaCEB64k7Ktn/nkcVfB5d+zql6b1tDS+bYsfbMxxZXV9NyiI
         d0uaVEVow6ihw3hFu9M04xwn/rFN5+qs6+fNzlRx56SpSKmOIch0NdtgS87kRlvJeI
         qJKIzpBRzY7Zw9c/3QkBNUtnc1dt+m+1hpzG5/tgEA3rledkpx06XAm4/PiN2+ZaeW
         2MKQgMlbBczKEfUD9/IGt4P/wWD7kzyO8ZUoSbyBFTE8Zy2y1OiHp8hSEVky+ek4Ja
         K7ZNP6/Ux5369gTEX41zR7cqyN/YTRD2QUQst17JwYgFOGZn3+nOt5NYWQHlcEkW9x
         QfaWssp5X1fsw==
From:   Mark Brown <broonie@kernel.org>
To:     Support Opensource <support.opensource@diasemi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>
Cc:     kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org
In-Reply-To: <e4acceab57a0d9e477a8d5890a45c5309e553e7c.1663875789.git.christophe.jaillet@wanadoo.fr>
References: <e4acceab57a0d9e477a8d5890a45c5309e553e7c.1663875789.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: da7219: Fix an error handling path in da7219_register_dai_clks()
Message-Id: <166427485225.60697.13131714629966036302.b4-ty@kernel.org>
Date:   Tue, 27 Sep 2022 11:34:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 22 Sep 2022 21:44:57 +0200, Christophe JAILLET wrote:
> If clk_hw_register() fails, the corresponding clk should not be
> unregistered.
> 
> To handle errors from loops, clean up partial iterations before doing the
> goto.  So add a clk_hw_unregister().
> Then use a while (--i >= 0) loop in the unwind section.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219: Fix an error handling path in da7219_register_dai_clks()
      commit: abb4e4349afe7eecdb0499582f1c777031e3a7c8

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
