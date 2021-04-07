Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E96C43460
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 20:27:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95FC561184
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 20:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356244AbhDGU1W (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Apr 2021 16:27:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:57220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356310AbhDGU06 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Apr 2021 16:26:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 507516100A;
        Wed,  7 Apr 2021 20:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617827208;
        bh=4XfeJk66eQSMa2rKurHsDyJBMwgllEefbptPpEFUsjo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sMFtJcImqn5uuRWjzhKCc6apO3r+g24/MtOnMFnfXtzYbbDwMYcQb3SIH4IKAzbBr
         33rVHMig8StPzorXPMGrgMULgHlvv8JVxcO3857237DGDpYWRTgPcul6X7uz6Scphu
         cYK2wPvg/nMnFhNPMUDmyczcwxqhRKpCbh8KHADt/P9vRBnC2aVkWsneydE2rbYUQp
         GnvZw9gPYhp02/tiD5QKmEHfHGcCoKpC81cNUBck8Bgo64BSwTqCBtQulZoaop9nZp
         i5QZOYMqmZHlkbEuxeYTvIWYZ67oEmLLgzAjdEHLil3JiUc2ODWxZH0LJvgDlQnfoY
         3TxuZfLtE7X4A==
From:   Mark Brown <broonie@kernel.org>
To:     Colin King <colin.king@canonical.com>,
        Guru Das Srinagesh <gurus@codeaurora.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH][next] regmap-irq: Fix dereference of a potentially null d->virt_buf
Date:   Wed,  7 Apr 2021 21:26:20 +0100
Message-Id: <161782707594.42848.5982836082039966334.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406164002.430221-1-colin.king@canonical.com>
References: <20210406164002.430221-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 6 Apr 2021 17:40:02 +0100, Colin King wrote:
> The clean up of struct d can potentiallly index into a null array
> d->virt_buf causing errorenous pointer dereferencing issues on
> kfree calls.  Fix this by adding a null check on d->virt_buf before
> attempting to traverse the array to kfree the objects.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap-irq: Fix dereference of a potentially null d->virt_buf
      commit: 14e13b1ce92ea278fc0d7bb95b340b46cff624ab

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
