Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF6EC05027
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Jan 2023 14:22:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjATOWz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Jan 2023 09:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbjATOWw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Jan 2023 09:22:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D6D518EA
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Jan 2023 06:22:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F3E4261F87
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Jan 2023 14:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4F1C433AA;
        Fri, 20 Jan 2023 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674224485;
        bh=O2DLXPO6MhsyTB89fm7zdE+nWTN52RPQ1lrd1S6Urk4=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=jfjbZD97KEtplE21rjRbIcyoiwp5hrkruQsWya6xv6RQci0elOvNi5Ifmzbr2RVdF
         wURh1Rv2KBUZr2DXAwio5iDiaVARvDfl44X7swPAYttuY1syxPoz4mE5ivXgmXg96P
         0R9qM8eqjtymzsjW4SLibjSbBPk5RWE84xWr9czyfp11C46icQH1WBDzgKsT0zjrLb
         eb9kLXDf1H7z1qxlexKGQ6/7bX7x2Zn5laDebck6bsFRjI5rNv4dvDhh/0/inBxJpt
         W7B4Z2HKXOYDIT6cVRtN+3eSPjUtZ45o2hhL62wSJpDaXQAScJhgGFUufLSC96o7vh
         qHkWYq0vd7b1A==
From:   Mark Brown <broonie@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Dan Carpenter <error27@gmail.com>
Cc:     "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Rander Wang <rander.wang@intel.com>,
        sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org,
        "cip-dev" <cip-dev@lists.cip-project.org>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <Y8laruWOEwOC/dx9@kili>
References: <Y8laruWOEwOC/dx9@kili>
Subject: Re: [PATCH] ASoC: SOF: ipc4-mtrace: prevent underflow in
 sof_ipc4_priority_mask_dfs_write()
Message-Id: <167422448135.1273927.7280697250336650251.b4-ty@kernel.org>
Date:   Fri, 20 Jan 2023 14:21:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-77e06
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 19 Jan 2023 17:58:54 +0300, Dan Carpenter wrote:
> The "id" comes from the user.  Change the type to unsigned to prevent
> an array underflow.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-mtrace: prevent underflow in sof_ipc4_priority_mask_dfs_write()
      commit: ea57680af47587397f5005d7758022441ed66d54

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

