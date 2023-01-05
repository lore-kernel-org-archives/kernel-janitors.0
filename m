Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8252EC63705
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Jan 2023 17:22:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbjAERVs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Jan 2023 12:21:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235386AbjAERVN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Jan 2023 12:21:13 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47098564FB
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Jan 2023 09:15:03 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id m7so2345637wrn.10
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Jan 2023 09:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n67EXi2DxaUGQNZldfWmP0oWklEr+2h12NuoITaK4oU=;
        b=cb1noHtTwXSIqdkVBnBjmTZevi5eDykk8T/dYtaP34aWWZL8bTKkTFuyeu/NNILXUL
         Gbw+yQks87nGpVDsvAdwOkXCWIg7XBFQCXPNnmxrplfmDkXQ355dUic3QRI/myCZwsfG
         aVwSS7zWfLGRE0NZPWUJ9loDsT06jbOIOvylwAyey1TtPHyZl9Po/8FSjcp54N5Gbzie
         5UCz+KYr6/xpypjJAvlsPysK5E3cOt9+KSBNx/YM3B8lfwl8CmQaxgj7E/gP241O1CdT
         85S5PjeAMkDCMu2Mo434zJL+SMxZEuEY3oNZ+mtCc85H+7BJncKNAVynEmAdP+pTdpnU
         xqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n67EXi2DxaUGQNZldfWmP0oWklEr+2h12NuoITaK4oU=;
        b=ntMivgbyTG+VFBAh1V8TWWgnBphQx99f+LoViJ6Kek+hHnP2boB/g54rPPQjM76VpO
         rrMOB90YCAzjN73Zn8SLI5medrf0ey9xOS3spW41+nY9iyqWBWXY9RoHFkApoLcr1RD2
         uCLqRkB8d7Cdp5KvC2CRFVQ5bxmjK9UGo9ZkEpcj3RGVoghoy/NHF7jSvC/lf6tGQvrh
         W8ZeTIuHx8/1Ak89D2MWiD3PQKhTcDGcYDvbgq/9zod0RKslcqOL9lr3A0ycK3KAoayA
         wXzj/kXN26AyNEqA2/LR6fQ8MZmzIRsGOIYeZ2mbfv6HBf4Zr1hnBPIGXhfqnmZYIzvW
         oKtg==
X-Gm-Message-State: AFqh2kqMmG7TuwSXfQEwSllNZtmdGuFhbUIIYvO6i5e4oY0TfUbxXUAA
        /fck+zgHPMuSp2IrANO31UPgug==
X-Google-Smtp-Source: AMrXdXuouVOmirnUjwp/feXQB4gD8Wc+b4LA3daJwE59+sjXkRBitK3Z9i5WC/PcnRWTG+dQyEK1gA==
X-Received: by 2002:a5d:5312:0:b0:297:bdaa:c8b8 with SMTP id e18-20020a5d5312000000b00297bdaac8b8mr10222823wrv.23.1672938901848;
        Thu, 05 Jan 2023 09:15:01 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id q15-20020adff78f000000b00291f1a5ced6sm16243607wrp.53.2023.01.05.09.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:15:01 -0800 (PST)
Message-ID: <81d01cab-02ce-00fd-f9fb-225f1547d3fb@linaro.org>
Date:   Thu, 5 Jan 2023 17:14:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2][next] nvmem: layouts: Fix spelling mistake "platforn"
 -> "platform"
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230105095828.2951-1-colin.i.king@gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230105095828.2951-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 05/01/2023 09:58, Colin Ian King wrote:
> There is a spelling mistake in the literal string. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Applied thanks,

--srini
>   drivers/nvmem/layouts/onie-tlv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/layouts/onie-tlv.c b/drivers/nvmem/layouts/onie-tlv.c
> index 074c7c700845..767f39fff717 100644
> --- a/drivers/nvmem/layouts/onie-tlv.c
> +++ b/drivers/nvmem/layouts/onie-tlv.c
> @@ -48,7 +48,7 @@ static const char *onie_tlv_cell_name(u8 type)
>   	case 0x27:
>   		return "label-revision";
>   	case 0x28:
> -		return "platforn-name";
> +		return "platform-name";
>   	case 0x29:
>   		return "onie-version";
>   	case 0x2A:
