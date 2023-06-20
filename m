Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E87EEB64D7
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Jun 2023 08:57:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbjFTI5v (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Jun 2023 04:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjFTI5u (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Jun 2023 04:57:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1070CC2;
        Tue, 20 Jun 2023 01:57:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E7FD61085;
        Tue, 20 Jun 2023 08:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F082CC433C8;
        Tue, 20 Jun 2023 08:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687251466;
        bh=0qe/Z9LyLuIqgETnC5j202kEcOTwTRbAceQ/gOZTaj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KfXkHyYRsB97X7DlcdLp5cqmuulW2nfNX0qgaermKjC3C6AtLqQBLifBqC5OGfXtX
         A04R9cAzLJNZPJ6Xwb3WuaV4C6J+21FuiSP9KYmWVVTmSshM/brAqwr2M+TJXCL4/g
         jE2PbUjW/hh7lf99xstkTSaB9kwzOvs1eFZDODA37iGAN0TQ0t9WItyLMBZ6WsgMET
         l2ByxAVA4k5h7YU3N4h1wDfy74HQt/rVttqUIGCoEmyEy8J+PwJk9JKimTECwGAnlM
         aQBHhCCb3Jiy0+ukFECxIKdbysTXCx6MykHud2OpNTUEWq/wXzm9fL0t5StKdH8Svt
         seIpk3bWrUtPg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1qBXBJ-0007Xj-6f; Tue, 20 Jun 2023 10:57:45 +0200
Date:   Tue, 20 Jun 2023 10:57:45 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] gnss: Use devm_regulator_get_enable_optional()
Message-ID: <ZJFqCQ8bbBoX3l1g@hovoldconsulting.com>
References: <62effa7aa1a2023a77709e6416c57d9cb79a5ccc.1686995765.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62effa7aa1a2023a77709e6416c57d9cb79a5ccc.1686995765.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jun 17, 2023 at 11:57:09AM +0200, Christophe JAILLET wrote:
> Use devm_regulator_get_enable_optional() instead of hand writing it. It
> saves some line of code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Note that regulator_disable() is now called after gnss_serial_free() in
> the error handling path of the probe and in the remove function, but it
> looks harmless to me.

Yeah, that bit should be fine.

> ---
>  drivers/gnss/mtk.c | 26 ++++----------------------
>  1 file changed, 4 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gnss/mtk.c b/drivers/gnss/mtk.c
> index c62b1211f4fe..d3d31295d4e0 100644
> --- a/drivers/gnss/mtk.c
> +++ b/drivers/gnss/mtk.c
> @@ -17,7 +17,6 @@
>  #include "serial.h"
>  
>  struct mtk_data {
> -	struct regulator *vbackup;
>  	struct regulator *vcc;
>  };
>  
> @@ -87,30 +86,16 @@ static int mtk_probe(struct serdev_device *serdev)
>  		goto err_free_gserial;
>  	}
>  
> -	data->vbackup = devm_regulator_get_optional(&serdev->dev, "vbackup");
> -	if (IS_ERR(data->vbackup)) {
> -		ret = PTR_ERR(data->vbackup);
> -		if (ret == -ENODEV)
> -			data->vbackup = NULL;
> -		else
> -			goto err_free_gserial;
> -	}
> -
> -	if (data->vbackup) {
> -		ret = regulator_enable(data->vbackup);
> -		if (ret)
> -			goto err_free_gserial;
> -	}
> +	ret = devm_regulator_get_enable_optional(&serdev->dev, "vbackup");
> +	if (ret)
> +		goto err_free_gserial;

But this breaks the driver as the new helper still returns -ENODEV when
the optional is resource is not present.

Wolfram already suggested using this new helper here:

	https://lore.kernel.org/lkml/20230523064310.3005-3-wsa+renesas@sang-engineering.com

and also got the error handling right even if that patch will require a
respin for other reasons.

As I mentioned in my reply to Wolfram, I'm generally sceptical of
helpers like this one, but in this case where there are no dependencies
on other resources I guess it's ok.

Johan
