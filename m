Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A922C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Jun 2022 11:15:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242354AbiFPLPT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Jun 2022 07:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbiFPLPS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Jun 2022 07:15:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BED5C872
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Jun 2022 04:15:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D9DF6192E
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Jun 2022 11:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B520C3411B;
        Thu, 16 Jun 2022 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655378116;
        bh=0H94X44bwP0GrLlj0Q2AlhCSU6r1nc2a+8rYr2pqroU=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=dA2YYDgMwiohEUvN9W1EnQvdw9/riQtk/gw3lwXDOATbrFKR7Xq/7OnFbDW1h2rL/
         Cu+7P5RT9Lk4EH2DjQU6xV2jJs6ThUmsfz7ckA2RQsJJru+EFY/hhiUt1UGhoEhII2
         uo63+u2u6Pz3Nhye7wdtvANq0etn0Z/uyQ0I2mksKe3xP34hAIjqsr/vo4/pYTH/di
         sQ6X5J/htXbdbAbbJHtjJHkjq5lEojcXTKkDwqtmW3KZpfqCjl/q8CwsPCAeQzBYUk
         V9Chfad4RkQKfUKhzD6QIjZ1Z+V/UeCoHzkHuQbjmLPbvuUWwhw1khczjQZj79w8rv
         /Xvfy8uX6chjA==
From:   Mark Brown <broonie@kernel.org>
To:     pierre-louis.bossart@linux.intel.com,
        ranjani.sridharan@linux.intel.com, dan.carpenter@oracle.com
Cc:     yung-chuan.liao@linux.intel.com, perex@perex.cz,
        alsa-devel@alsa-project.org, tiwai@suse.com,
        kernel-janitors@vger.kernel.org, lgirdwood@gmail.com,
        sound-open-firmware@alsa-project.org,
        peter.ujfalusi@linux.intel.com, rander.wang@linux.intel.com,
        kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com
In-Reply-To: <YqqyDU5BhOzpRjco@kili>
References: <YqqyDU5BhOzpRjco@kili>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Fix error code in sof_ipc4_volume_put()
Message-Id: <165537811396.677284.13292348933501496374.b4-ty@kernel.org>
Date:   Thu, 16 Jun 2022 12:15:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 16 Jun 2022 07:31:09 +0300, Dan Carpenter wrote:
> The sof_ipc4_volume_put() function returns type bool so returning
> -ENOENT means returning true.  Return false instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Fix error code in sof_ipc4_volume_put()
      commit: 7acf970a6fbb3c10bb5979d0dc3ed42b161daf15

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
