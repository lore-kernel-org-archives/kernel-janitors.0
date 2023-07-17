Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2783BEB64DC
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 Jul 2023 18:16:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbjGQSQO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 Jul 2023 14:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjGQSQN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Jul 2023 14:16:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F031990
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 11:15:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0AE48611D8
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 18:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC103C433C9;
        Mon, 17 Jul 2023 18:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689617695;
        bh=OmMKDjWAGS0CdP7PK45ZzftVRbXmwhJuz0GNS0T+drM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=vL3kOgoXcNqDwcsiB4NA1MXYnWRLMa2oZrr86MKOBFytI6r6L73O/YDOyRITDNQ0m
         S0Lii6T7KprSe6hRT/AXA/tyYAw5S8Y6fjtZ1Ikk3kQ2gixv0qIDQUbuBqtNzgJJhy
         fVuMqgNffOTO8XOtPOqEcfDFmmltxBqlByqLr8FuBI+ovuZ/VFnBBO9MXGsfXz2goD
         mbAnj35sgywOib+DkXucQQYVu/2VJZTlfwb7l6/Mx8/VplihpDMxlc2FDP2waWomOl
         UEeZDbjtHJNrYc/L0S51KA6Z3dbKPUtIaxXbLZ1+q70RfaaQ6t7nTfg7bMDAS2Gj2F
         +U/tuEB2sEogQ==
From:   Mark Brown <broonie@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <74148292-ce4d-4e01-a1a7-921e6767da14@moroto.mountain>
References: <74148292-ce4d-4e01-a1a7-921e6767da14@moroto.mountain>
Subject: Re: [PATCH] ASoC: SOF: ipc3-dtrace: uninitialized data in
 dfsentry_trace_filter_write()
Message-Id: <168961769268.448315.12624204835673463699.b4-ty@kernel.org>
Date:   Mon, 17 Jul 2023 19:14:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 07 Jul 2023 14:25:23 +0300, Dan Carpenter wrote:
> This doesn't check how many bytes the simple_write_to_buffer() writes to
> the buffer.  The only thing that we know is that the first byte is
> initialized and the last byte of the buffer is set to NUL.  However
> the middle bytes could be uninitialized.
> 
> There is no need to use simple_write_to_buffer().  This code does not
> support partial writes but instead passes "pos = 0" as the starting
> offset regardless of what the user passed as "*ppos".  Just use the
> copy_from_user() function and initialize the whole buffer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc3-dtrace: uninitialized data in dfsentry_trace_filter_write()
      commit: 469e2f28c2cbee2430058c1c9bb6d1675d7195fb

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

