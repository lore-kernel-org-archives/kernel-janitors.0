Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F72C43461
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Apr 2021 19:04:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 482286140D
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Apr 2021 19:04:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245432AbhDUTFH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 21 Apr 2021 15:05:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:35820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245387AbhDUTFC (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Apr 2021 15:05:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E894B61457;
        Wed, 21 Apr 2021 19:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619031868;
        bh=w86Hg/P36kP1rlWu7feNGoS+/J61vahKxacM04YWx/8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OUY9K+eHtnvKEWOMO1jbHumGDFILo8yZJy/mLwzNH+Q/VDW/+oOVEvTAVGlj9WO2/
         QEqHzVgr4epn6q+9T9R7BtCfIFunDuo9M+rDle+4+i0yOgcAjT0plpwMl3/QiQ+EOf
         8S/Ljm3kIeYS1gyOYlUgTjY9CuM5LKjeh9aNfxL2Yh7pZvWBhMJH8zh1vBBqmifHd9
         u3UvDjyj9IZ/PLG8epHyeIFoYlG3x8o3JMgsd7+AwyCSAPlvQPINm1ur741eHtKZnk
         zIpWNiSB5sQE8Prz9AwYs2wN8LnfxEQSaHY3MrmU3hK9uw4c7St4bYPxVLOqFS5HuC
         Ut/ydiKBlGe5w==
From:   Mark Brown <broonie@kernel.org>
To:     lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] regulator: Avoid a double 'of_node_get' in 'regulator_of_get_init_node()'
Date:   Wed, 21 Apr 2021 20:03:32 +0100
Message-Id: <161903035952.13561.4200524604109878768.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <a79f0068812b89ff412d572a1171f22109c24132.1618947049.git.christophe.jaillet@wanadoo.fr>
References: <a79f0068812b89ff412d572a1171f22109c24132.1618947049.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 20 Apr 2021 21:31:51 +0200, Christophe JAILLET wrote:
> 'for_each_available_child_of_node()' already performs an 'of_node_get()'
> on child, so there is no need to perform another one before returning.
> Otherwise, a double 'get' is performed and a resource may never be
> released.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: Avoid a double 'of_node_get' in 'regulator_of_get_init_node()'
      commit: 8a065ce92b218e453742b745162d75a6f86fb768

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
