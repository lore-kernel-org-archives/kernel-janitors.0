Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B7DEB64DB
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 22:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjFSW3Q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 18:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjFSW3O (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 18:29:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E239E103
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 15:29:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5856C60E84
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 22:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAB6C433C8;
        Mon, 19 Jun 2023 22:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687213751;
        bh=7FENT0fR9g/IHtG2MyCKYjPXZXSY5zPJGkenGVwXz+Y=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=ZqiVl1cRjY0IQLWbUGh5Xv1/mvoE3MtEMY7NPT9hqwUNg9teIML4fUlFY2nEoReTE
         4a6GNmPWf7ZdRZM2qGIqPqyQ3m1Y4VHMCx95bxl7h4cAFL4wtsjrB5cvHfQ13OIFVW
         lCw2tfDiH8O7tGXVNohBs0eM3AE9RKO82Cfyz7i1l6mYU9S4IM+W3mefmBdC30bD2L
         bvJOAbhnFayYUgKlMxkmpeTz/mSwqgB3SP58cUeFzntIQo6Qej+sU+GK7xOOO5GOPf
         K6eKOhq0eOFpHMlOdNdZrsWX1gEC/TbzhpBUH/ymvwcJvUI23REYiUsnwNIfYGzhTS
         qUy/zGSQje0aw==
From:   Mark Brown <broonie@kernel.org>
To:     Yingkun Meng <mengyingkun@loongson.cn>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <fb14815d-2f9a-4b42-b193-cec61e7417ca@moroto.mountain>
References: <fb14815d-2f9a-4b42-b193-cec61e7417ca@moroto.mountain>
Subject: Re: [PATCH] ASoC: loongson: fix error codes in
 loongson_card_parse_acpi()
Message-Id: <168721375010.200161.14528592449735607386.b4-ty@kernel.org>
Date:   Mon, 19 Jun 2023 23:29:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 19 Jun 2023 12:46:21 +0300, Dan Carpenter wrote:
> The acpi_node_get_property_reference() function returns kernel error
> codes and not ACPI error codes.  So, although it does not affect the
> compiled code, using the ACPI_FAILURE() macro is wrong.  Secondly,
> if the is_acpi_device_node() function returns false, then we should
> return -ENOENT instead of returning success.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: loongson: fix error codes in loongson_card_parse_acpi()
      commit: 8fba13f02c85b90deeba65a398f55d4b43a79595

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

