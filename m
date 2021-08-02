Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EFDC4338F
	for <kernel-janitors@archiver.kernel.org>; Mon,  2 Aug 2021 20:44:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36638610FE
	for <kernel-janitors@archiver.kernel.org>; Mon,  2 Aug 2021 20:44:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbhHBUok (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 2 Aug 2021 16:44:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:59178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232216AbhHBUoj (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Aug 2021 16:44:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4540E604D7;
        Mon,  2 Aug 2021 20:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627937069;
        bh=knoH2cdCXTM2mbLN1i5m2fnGMDLvpU6bTazpD8ALCvY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PIKntqSSOeVJCJZrboiUiQMe+ehZnhNMRZqzmWtCaWWzVhF+GPu2djKQnb8h8OL90
         qduhWNjrDtqtKHRW8rez+UXZkmXM9funm0bCK2Mz//V4twUpxWJfoNAmmSii4rAgE5
         vatjacrAaVJzjx+VgTb85DL9Jjac1P0W9phQ/pYlh9YNDLP0zskL6cqyC6ArFC4JQp
         jaj9Y7G8Px9mUUxFl6Ja8kus3pn9H1dcO3v7fz7Glw1EqKj1humN9Fg2wC5c9CwUNJ
         AgVXoAbVSvEZfPfGGtbAO0z7jHfS0eAVROhHERjeNar+nHzh8111rYj9SiGNseM1WM
         a8YUyQaLuX0TQ==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Colin King <colin.king@canonical.com>,
        alsa-devel@alsa-project.org
Cc:     Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tlv320aic32x4: make array clocks static, makes object smaller
Date:   Mon,  2 Aug 2021 21:44:12 +0100
Message-Id: <162793640673.55982.9347751869143903771.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210801064807.138641-1-colin.king@canonical.com>
References: <20210801064807.138641-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 1 Aug 2021 07:48:07 +0100, Colin King wrote:
> Don't populate the array clocks on the stack but instead it
> static. Makes the object code smaller by 316 bytes.
> 
> Before:
>    text    data     bss     dec     hex filename
>   63668   28264       0   91932   1671c ./sound/soc/codecs/tlv320aic32x4.o
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320aic32x4: make array clocks static, makes object smaller
      commit: ea9df9840fd5d766b9e98b0073890de4be68b062

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
