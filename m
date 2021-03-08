Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEED1C433DB
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 Mar 2021 16:10:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84FA865229
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 Mar 2021 16:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhCHQJg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 8 Mar 2021 11:09:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:41912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230111AbhCHQJc (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 Mar 2021 11:09:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFFE465210;
        Mon,  8 Mar 2021 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615219772;
        bh=k3GA1CL+qZuU8ub0oPFI+MA3exml0cTuKZCxQnKSyqE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=YMQL1d/UlRXO73hTX3sbZm5r0q0+9363/lqaPN9VG/IRr5NJOzsWtXRqVFelZgQdZ
         uBGiMbB6aQVfDWtCMMvktuEo6NZKEaJuNRWw4+SsKgxWvbLEbJaTUjgJeASIz4ZRCn
         fuK8xnBvBcg9T+khs87X63QV7LFMN0orm0bta1Hu5QTiDbLUttexKvvY204P+tVvqR
         CtYf4e5nRDtOu/25IjY4+z2tXJOHhcyoR1I1fPYe+i9ALyJS5ztcm7vpv0rNnTtwUC
         p7Jq65iInpoUTbEC60V+CXQr3o3DAofJUheq8wovRtw1eDd4ZD1GQ9K1gfK0g0ilh5
         C3kft/lY1kyUQ==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        ChiYuan Huang <cy_huang@richtek.com>,
        'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Hulk Robot <hulkci@huawei.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <20210305034930.3236099-1-weiyongjun1@huawei.com>
References: <20210305034930.3236099-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] regulator: rt4831: Fix return value check in rt4831_regulator_probe()
Message-Id: <161521970194.10009.1692126803551238706.b4-ty@kernel.org>
Date:   Mon, 08 Mar 2021 16:08:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 5 Mar 2021 03:49:30 +0000, 'Wei Yongjun wrote:
> In case of error, the function dev_get_regmap() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: rt4831: Fix return value check in rt4831_regulator_probe()
      commit: 2a105d168e74eedbccd9b040c3ee8b8b00604a33

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
