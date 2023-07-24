Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D49AC001DE
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Jul 2023 12:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjGXMWH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Jul 2023 08:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbjGXMWF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jul 2023 08:22:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE8010C7;
        Mon, 24 Jul 2023 05:21:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4759961120;
        Mon, 24 Jul 2023 12:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996F8C433C7;
        Mon, 24 Jul 2023 12:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690201317;
        bh=ac2cehcYaz7p24SO0wvuBKIoF6snFqVajsH8Vw7Qszo=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=L6M/czAEACAXTvM+bAmNAyPEMCjRGybl1kPEfHIroj/SbTKp3trCbl8igsYjqeZCI
         Kmqo2VyKr1XU4Y2vGU3BwM1cnXxSYuCZiaWX0+RETB6PMY0gmFO9Fjl2gj0FI42pFl
         HJQHU0r7pREym9p7CspirEG6wdajYO+ceWvq8yV7ACtgiYOCjhmDOrm2FI/bf/sdVH
         NB2LdehL+DJBWPuSEZew3V8qlk5K5niB6heIi7++T3d1WilEcuHFwvFZcuqVxIEndC
         A1yNo1Ye7ncaA/37kOdU56IhsNdhZ7r833HVZSTwjmCRAM0KrexJHYTeSTbvQ6H4o9
         Qk3JBnRdAqJdg==
From:   Mark Brown <broonie@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <5600df5003d23da10efcfafbda97ca55776d0d29.1689960321.git.christophe.jaillet@wanadoo.fr>
References: <5600df5003d23da10efcfafbda97ca55776d0d29.1689960321.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] regmap: Fix the type used for a bitmap pointer
Message-Id: <169020131633.72795.67466075622586290.b4-ty@kernel.org>
Date:   Mon, 24 Jul 2023 13:21:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 21 Jul 2023 19:25:43 +0200, Christophe JAILLET wrote:
> Bitmaps should be defined as 'unsigned long', not 'long'.
> Fix the type of 'cache_present' is the 'struct regcache_rbtree_node'.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: Fix the type used for a bitmap pointer
      commit: ffb57ee9c0e2a9aae89016ee7b793a666c6aa4a5

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

