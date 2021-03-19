Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29047C433DB
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Mar 2021 16:37:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F303D61980
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Mar 2021 16:37:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhCSQh0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Mar 2021 12:37:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:56060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230015AbhCSQhP (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Mar 2021 12:37:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9982E61983;
        Fri, 19 Mar 2021 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616171835;
        bh=3A9Mrcmk8A9XWLKK6rVjytA8qsYQ+enej5Jso7g9Hts=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZhQdjEhGW9FyAGjhPqJlZE4KnnlnbSCKMshI+n+FsL0WeYbrpISB+Ybg+SPlDRGqB
         kTVYIPkSi94gZxnzvpYpnrxTScSosNOGGtGsQMAQjXJMnU091num9sM4AuI+VokGlY
         wEiZ1slF8353nO7PYQjaFSlhuIUDUfqvjmTYT1Jt1bbY+ZtdC4ntfGIy4BTWyJY/2p
         6vpIwcGA9cIDk+zp96nRghYn9jMTnIpWjmT1Ic2zyk7Q36wQABn0TqnQd3yL4aNgsw
         +ZB/o/SYB9h2bRehf2soOFbI2lS55rsg3HujUtoOF4ICyfZs40RuYdSDGiuD3XZLZk
         zc8OPfuQhALoA==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Jack Yu <jack.yu@realtek.com>,
        'w00385741 <weiyongjun1@huawei.com>,
        Takashi Iwai <tiwai@suse.com>
Cc:     Mark Brown <broonie@kernel.org>, Hulk Robot <hulkci@huawei.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] ASoC: rt1019: make symbol 'rt1019_i2c_driver' static
Date:   Fri, 19 Mar 2021 16:37:05 +0000
Message-Id: <161617160659.9613.1258918288150245651.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210319094102.4185096-1-weiyongjun1@huawei.com>
References: <20210319094102.4185096-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 19 Mar 2021 09:41:02 +0000, 'w00385741 wrote:
> The sparse tool complains as follows:
> 
> sound/soc/codecs/rt1019.c:927:19: warning:
>  symbol 'rt1019_i2c_driver' was not declared. Should it be static?
> 
> This symbol is not used outside of rt1019.c, so this
> commit marks it static.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1019: make symbol 'rt1019_i2c_driver' static
      commit: e6d8af6687fa7730885d5c8d8f62e75e8dff29f0

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
