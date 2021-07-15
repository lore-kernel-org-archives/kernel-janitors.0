Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F35C636CE
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Jul 2021 19:58:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FBE7613E4
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Jul 2021 19:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243959AbhGOUA5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Jul 2021 16:00:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:46458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245422AbhGOT6E (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Jul 2021 15:58:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF22D613C9;
        Thu, 15 Jul 2021 19:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626378893;
        bh=cqaP2qSL289NbVmzp2jQGNpJC6oOR6ORaU2+jb0bmTg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mIUjIXhdRDbiTxDSNrTBHTDwvicprpO59NDPscKol2GkYZ8YlmnEdD87UF4yZ6zOm
         1w/yCmrxa6JRg3eKT1nMrq+hxQRe8r4B4N/A88uFej2/OL7KhPvtqeYHv3vYaqmFZP
         zZfJHlhQMcXnaiEf+OBvQeYXD4DhmEbtN6WAUV6CNbVzjAmgWadBcSgqtgICIElhyb
         +6/ZWycEtHkBD9pDppr85uuUZiWfM7OAOynXnQxmZaBmcKlfMQvL4DCSPWfTYXFHX1
         eGhG4ciXt4oVoCW5M8QzCqRzfha4n5zPR3tm1MZzIjW4ody1FoqRYU14A4WN/quWSg
         h+UJ1wLQ9zmhQ==
From:   Mark Brown <broonie@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        Colin King <colin.king@canonical.com>
Cc:     Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: clean up for-loop indentation in switch statement
Date:   Thu, 15 Jul 2021 20:54:02 +0100
Message-Id: <162637837991.27358.2893417037818285699.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709152424.460446-1-colin.king@canonical.com>
References: <20210709152424.460446-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 9 Jul 2021 16:24:24 +0100, Colin King wrote:
> The for-loop is not indented enough and needs one more level
> of indentation. Add in the indentation across the block of code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-rx-macro: clean up for-loop indentation in switch statement
      commit: 622d9ac3d969d0f62bbe68f4844bb5b8adea5a40

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
