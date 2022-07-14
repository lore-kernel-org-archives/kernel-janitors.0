Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A909DC43334
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Jul 2022 14:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239572AbiGNObQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Jul 2022 10:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239080AbiGNObL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Jul 2022 10:31:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C951864E15
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Jul 2022 07:31:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D3ED61CBB
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Jul 2022 14:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DC2C34115;
        Thu, 14 Jul 2022 14:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657809068;
        bh=ZSVTTrbfOqs8s1xfYshXY9NDywr8b9nAJWhikYqRPNI=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Y+iZ+2DYzoJZ5mtIpykj5shVub/8lsAQYXtt3K4EBoJY87XKOtqh9wMtmw4gAgnab
         qxy9jV8hT0GeGeGZ7oDFWHWnpNvY4OnPr1UVwcrWXwyZQIsEMXChK8tzEwm/ra9uaA
         q1+onVKtkPqvLK4/9563LBPNOG5LZrG6cR9YuL5ofuPfa1c5ooaOYEHl7qUfzw0ujB
         qNZ1KYz9zvQGOgrFfnr3AXcHvtuBkHxmOC9NWez1LTpLI1tPJQgDn0itA6RnI0lpLX
         0Zq7PT5cbAC7K34Ijp5PxgHuKPHvi/6Ojsibv9F8LPngikdv1O2sAR/rN1E5HHqVLD
         PUxlFcfMrJTmw==
From:   Mark Brown <broonie@kernel.org>
To:     dan.carpenter@oracle.com, pierre-louis.bossart@linux.intel.com
Cc:     alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
        daniel.baluta@nxp.com, tiwai@suse.com, perex@perex.cz,
        kernel-janitors@vger.kernel.org, peter.ujfalusi@linux.intel.com,
        sound-open-firmware@alsa-project.org, lgirdwood@gmail.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
In-Reply-To: <Ysg1tB2FKLnRMsel@kili>
References: <Ysg1tB2FKLnRMsel@kili>
Subject: Re: [PATCH v2] ASoC: SOF: ipc-msg-injector: fix copy in sof_msg_inject_ipc4_dfs_write()
Message-Id: <165780906607.93789.3415889455075951387.b4-ty@kernel.org>
Date:   Thu, 14 Jul 2022 15:31:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 8 Jul 2022 16:48:36 +0300, Dan Carpenter wrote:
> There are two bugs that have to do with when we copy the payload:
> 
> 	size = simple_write_to_buffer(ipc4_msg->data_ptr,
> 			      priv->max_msg_size, ppos, buffer,
> 			      count);
> 
> The value of "*ppos" was supposed to be zero but it is
> sizeof(ipc4_msg->header_u64) so it will copy the data into the middle of
> the "ipc4_msg->data_ptr" buffer instead of to the start.  The second
> problem is "buffer" should be "buffer + sizeof(ipc4_msg->header_u64)".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc-msg-injector: fix copy in sof_msg_inject_ipc4_dfs_write()
      commit: fa9b878ff86f4adccddf62492a5894fbdb04f97d

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
