Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C8EC7EE22
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 May 2023 09:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240066AbjEOJ3p (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 May 2023 05:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239726AbjEOJ3T (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 May 2023 05:29:19 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48961BF4
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 02:28:38 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-307c040797bso3584395f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 02:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684142917; x=1686734917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QRBaFlhf9sFFgjiQBXj3BZflOgpJ96Bb6sKHpf2Tstg=;
        b=w51K1VOHufmt/cdo5w3wovdmoamaTl7lMVZxFXyP3ZWusdj94pYEGN60Mn9Ooj4rnE
         5rMJTFoOJbcZ/of+KvbrkjcxABJz2X4nxpdNCceheEmAtlwojp7jcYk3O2kfo2xwLu1g
         p0fUGqFltb7quYlp/4UbBp7s80AmcQXqO2kOS4edtOF/fod9dxWe+M3OhZ0Ko+E/P4Qa
         Wq+LQ/DZq7Fdyn5cAvqbv+oQ5IRg+PuDkiyZsKOtEx9GW1Cc7I1qdZuPfnjVyVwlH+jB
         jwtNmg33+8hGhnefPskKyhY3dXFUduJrjw3IJ6RKNtD/PKLmD9UEDdIcPgQh33GVQnyv
         LjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684142917; x=1686734917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRBaFlhf9sFFgjiQBXj3BZflOgpJ96Bb6sKHpf2Tstg=;
        b=KEr46x6JaJQnDEURP9TVrSTxotmR7zkutT6LmI72LMp9wgmL14P7r78HWGz9Ynbq0x
         O0hytTkzrAt8+cQn76JDtMOmFeXzhHA3lsdmXNc56ffjYD4E7sU0LNMNioboOaJdlO1c
         DyTbQexa6NNHZskgH1Q0goYYCKur6UFagjXzS4mN4xw3NUo3S8HWxtSZH9VCmdKDpRtX
         oaQ9+KuwqvZgIF9TxmABuCbQvILF1bqcZVqeFCaJVCXSjZpBwA+uwvcpBvO+YKNr2jSQ
         Dn6afjSsGXmxk4yBE81nPOL0bQVexJUQ8XaKR7VOhN1FUAGlYEAKePEu4mmispe8fmsX
         rnXw==
X-Gm-Message-State: AC+VfDyJnmMmP80T0wYqvoK4fwJaZIf15ObgojwPQNggHSUbZXS/0tD+
        z3otuH8JxVADeANyKzmrosgmRg==
X-Google-Smtp-Source: ACHHUZ7PbioezIsR65ywi6/2ShhPZZoflieboKI5tlTUmDknlGjBF0hRQiD/bbU3CrRMH0nAD1PH1w==
X-Received: by 2002:a5d:58c1:0:b0:306:20eb:bedd with SMTP id o1-20020a5d58c1000000b0030620ebbeddmr21733882wrf.51.1684142916991;
        Mon, 15 May 2023 02:28:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d4ec2000000b003063a92bbf5sm32022989wrv.70.2023.05.15.02.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 02:28:35 -0700 (PDT)
Date:   Mon, 15 May 2023 12:28:19 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     wuych <yunchuan@nfschina.com>
Cc:     dchickles@marvell.com, sburla@marvell.com, fmanlunas@marvell.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: liquidio: lio_core: Remove unnecessary
 (void*) conversions
Message-ID: <61522ef5-7c7a-4bee-bcf6-6905a3290e76@kili.mountain>
References: <20230515084906.61491-1-yunchuan@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515084906.61491-1-yunchuan@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 15, 2023 at 04:49:06PM +0800, wuych wrote:
> Pointer variables of void * type do not require type cast.
> 
> Signed-off-by: wuych <yunchuan@nfschina.com>
> ---
>  drivers/net/ethernet/cavium/liquidio/lio_core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cavium/liquidio/lio_core.c b/drivers/net/ethernet/cavium/liquidio/lio_core.c
> index 882b2be06ea0..10d9dab26c92 100644
> --- a/drivers/net/ethernet/cavium/liquidio/lio_core.c
> +++ b/drivers/net/ethernet/cavium/liquidio/lio_core.c
> @@ -904,8 +904,7 @@ static
>  int liquidio_schedule_msix_droq_pkt_handler(struct octeon_droq *droq, u64 ret)
>  {
>  	struct octeon_device *oct = droq->oct_dev;
> -	struct octeon_device_priv *oct_priv =
> -	    (struct octeon_device_priv *)oct->priv;
> +	struct octeon_device_priv *oct_priv = oct->priv;
>  

Networking code needs to be in Reverse Christmas Tree order.  Longest
lines first.  This code wasn't really in Reverse Christmas Tree order
to begine with but now it's more obvious.

regards,
dan carpenter

