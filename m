Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FC2C54EE9
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Sep 2022 17:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbiIVRyM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Sep 2022 13:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbiIVRyL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Sep 2022 13:54:11 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADAA103FF5;
        Thu, 22 Sep 2022 10:54:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6F6C0CE22FD;
        Thu, 22 Sep 2022 17:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A277DC433D7;
        Thu, 22 Sep 2022 17:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663869246;
        bh=ZqiYpReBdwU8JPuxbNH/ozBm6dAJTMrDI+mSmHWB0sk=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=tFarzA1JUquj4bSR5a7OyLP39GBKVJLLDGNrnQ8mz1mJyXXdBkxAq4f09qaujVZxN
         4aZpzRWiEaJmds7W+SvulRIYgIMg2P4xaPUVFXJAbLaRjbwFt3FvllUqFmkMzF5tQl
         Nvc1LBzUJJd2giShORWbfjblYdswzMdPi6639B+J4oravQYN8oApHzxwjJ5C4dZ4Up
         07YoBe4H617nzguHQT4Z4Hl0MfmdlhRJ9hAxxBzcMmoyovqmPPcf0RDm1c3BCcsS8M
         X/JoL5fop9m6Z7qGL5cHL4UfM5bvM4HcBppxG01q0vmMMOTvrW/DPOcnT+592jHrHc
         H4BwRPfEGALZQ==
From:   Mark Brown <broonie@kernel.org>
To:     Colin Ian King <colin.i.king@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20220922080445.818020-1-colin.i.king@gmail.com>
References: <20220922080445.818020-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] regmap: mmio: replace return 0 with break in switch statement
Message-Id: <166386924264.727940.17683368538547591702.b4-ty@kernel.org>
Date:   Thu, 22 Sep 2022 18:54:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 22 Sep 2022 09:04:45 +0100, Colin Ian King wrote:
> Variable min_stride is assigned a value that is never read, fix this by
> replacing the return 0 with a break statement. This also makes the case
> statement consistent with the other cases in the switch statement.
> 
> 

Applied to

   broonie/regmap.git for-next

Thanks!

[1/1] regmap: mmio: replace return 0 with break in switch statement
      commit: 01ed230761e51f0403b3f3845c11cb67014487e2

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
