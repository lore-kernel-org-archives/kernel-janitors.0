Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657E7EE01FC
	for <kernel-janitors@archiver.kernel.org>; Wed, 13 Sep 2023 17:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjIMRqo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 13 Sep 2023 13:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbjIMRqo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Sep 2023 13:46:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255F519AC
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Sep 2023 10:46:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E45C433C7;
        Wed, 13 Sep 2023 17:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694627199;
        bh=6RQLwm9+y0/pjTEP8oYtSeOWaSaM8z+j+IMHHzvs4IQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=MXKAplrAetGPjfxNmSciWt8ol/UlnaVaGb1xTkcfa9zoMQgsP8xhzUPxy1vJDhPhj
         1llVebSBlwhirtTcAxlyolhl1zlsMvIP23EG5pSTPe+rwIo5BOuImY1QzjbVkE1F4p
         WqaScJkoBxa4fLJvvWFnnLl8NLtGBiLbKTHhCwpfFeYDEU49qENOUyHnGtlyKIcw7g
         4vGmHZlSfN7V/YDFOFawm5fXzHSTK+sO9nzWm0CSYbcmGKy77MT/IoYt2lRzp/zfDz
         9OunRFzWvMlUOTsfhx8bq33/QYxS3+u7xiPE1Mwyxb7BEZ8BKPf9hNuueWopBvQcwS
         SaiDOyEvz4a8Q==
From:   Mark Brown <broonie@kernel.org>
To:     Weidong Wang <wangweidong.a@awinic.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Nick Li <liweilei@awinic.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        Ben Yi <yijiangtao@awinic.com>, Tom Rix <trix@redhat.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
In-Reply-To: <81476e78-05c2-4656-b754-f314c7ccdb81@moroto.mountain>
References: <81476e78-05c2-4656-b754-f314c7ccdb81@moroto.mountain>
Subject: Re: [PATCH] ASoC: codecs: aw88395: Fix some error codes
Message-Id: <169462719734.54382.4099179509276849892.b4-ty@kernel.org>
Date:   Wed, 13 Sep 2023 18:46:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 13 Sep 2023 11:18:22 +0300, Dan Carpenter wrote:
> These error paths should return -EINVAL instead of success.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: aw88395: Fix some error codes
      commit: cf0ba445f5e4dd74c1e9d7a83ca721ba69204a11

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

