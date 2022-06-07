Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE1AC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Jun 2022 10:46:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241562AbiFGKqp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Jun 2022 06:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241679AbiFGKqI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jun 2022 06:46:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A480ED8F8
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Jun 2022 03:46:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 86CA86153F
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Jun 2022 10:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18212C34119;
        Tue,  7 Jun 2022 10:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654598764;
        bh=slxqdGbN2Xkk/KNCkqG0OOK4Kra7MbWR8P3wapvWLsQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=nKgBO2yxpRTjF0AMMyAvBBPbJPWxIIf/1HNeIl5qjRMTEwgcBjTAEnIzSu1/ANq+l
         G3BFyiLFhfeJaJRY4WRcP3EuQ+GqQOgKw5kwlGz4UuoAGg/sESnti/PQIi2OiZomiq
         obXm8Ho36QZBsOK49idNxRtZwIAnPBiUhpFfVTnutOYnVTdw5BUzNu+lR/XSjG4xzG
         lglnbT/nV9a+AhyPKLgcVHC37XbFY6uAVyDL5MGq60h0ncKeD2yK90qOy/sjzhjeEU
         elhPVuj4acsWTnESDbev9dwTRdYmcm9YFrFV1GdH367y6pFxLovDAW3CI6nK4+cEMJ
         SZ+z1iK4T0iWg==
From:   Mark Brown <broonie@kernel.org>
To:     dan.carpenter@oracle.com, pierre-louis.bossart@linux.intel.com,
        peter.ujfalusi@linux.intel.com
Cc:     ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
        rander.wang@intel.com, daniel.baluta@nxp.com,
        Liam Girdwood <lgirdwood@gmail.com>,
        kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        kai.vehmanen@linux.intel.com, harshit.m.mogalapalli@oracle.com,
        sound-open-firmware@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
In-Reply-To: <Yph+Cd+JrfOH0i7z@kili>
References: <Yph+Cd+JrfOH0i7z@kili>
Subject: Re: [PATCH 1/2] ASoC: SOF: ipc-msg-injector: Propagate write errors correctly
Message-Id: <165459876081.301808.13605726339122766955.b4-ty@kernel.org>
Date:   Tue, 07 Jun 2022 11:46:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2 Jun 2022 12:08:25 +0300, Dan Carpenter wrote:
> This code is supposed to propagate errors from simple_write_to_buffer()
> or return -EFAULT if "size != count".  However "size" needs to be signed
> for the code to work correctly and the case where "size == 0" is not
> handled correctly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ipc-msg-injector: Propagate write errors correctly
      commit: d9a251a029f23e79c1ac394bc551ed5d536bc740
[2/2] ASoC: SOF: ipc-msg-injector: Fix reversed if statement
      commit: bedc357217e6e09623f6209c891fa8d57a737ac1

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
