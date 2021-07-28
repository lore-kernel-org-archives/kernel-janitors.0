Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B273BC4338F
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Jul 2021 23:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 801EE60F9B
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Jul 2021 23:17:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbhG1XRv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 28 Jul 2021 19:17:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42151 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232116AbhG1XRv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 28 Jul 2021 19:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627514268;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yPDkVTZ8b83r4TbJSlWFDW+2FFM5TXW1fN7erbN+dQI=;
        b=OD+3fKIlEDj5K2HHg/7fNAF8hQum9odFT+ufLcdQgUfQqqaU77gKRNar2WUTJwgNSnn20n
        eKCcmhByFdDzPfEtC7CzmSrJaP2291IlLtHgk8G4QaXY6yGs2Gqv3iwuWOK12EcqramYd3
        18dKkU8suierzIlJlKqOJyigkbj0Mjw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-g8N0YRntPdy75u2261pkGg-1; Wed, 28 Jul 2021 19:17:46 -0400
X-MC-Unique: g8N0YRntPdy75u2261pkGg-1
Received: by mail-qt1-f199.google.com with SMTP id k2-20020ac847820000b029024ea3acef5bso1842301qtq.12
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Jul 2021 16:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=yPDkVTZ8b83r4TbJSlWFDW+2FFM5TXW1fN7erbN+dQI=;
        b=SyVaPCLfbxJ5H8o+Z+pesUK1bBkxZl+CrvHzo6mN4n4DmUSjroyd/cuyasQHBn5HGf
         Bp81GVpheg/24YY61czfIatUUYrMseuUanIOfJL1zmz7ITsNJdEkbUfe7K9KUt5d8J4b
         Vm0KgL337hCIqc5afNGZZczjlAEuZLcf3dmoemAwQB+jrN9/hblSDlKlOnmMharB71nq
         P1ZIjzFyvO0w9SmwOpKfU+rjgnyKFpnXbt2EMU02rQgp9sWF53WEkPVWbU8NspJLPYLm
         vsR/1lWU2kVundDepJTgZ8Xft8OxFJALk6EbwobaP4D3i/grYq5Qw604/Fvua1ZN6oLc
         Hu7w==
X-Gm-Message-State: AOAM5336BOUIKKuFDqCzNa1sn/2bCyx5mvSw2wgErl2eyhWjCXp3E1jF
        eHwlW1Y7pFO3VcczB03jLpaRxn/ER9a1dSJQmrCzAl2XcQ2WEBzJaFxWMiGkDRBprIlLWaqbmPH
        4qzxCwN0KGFHyGHkxjCnJq+J293rl
X-Received: by 2002:a37:b0a:: with SMTP id 10mr2186638qkl.291.1627514266123;
        Wed, 28 Jul 2021 16:17:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXAgP9lkJWoLrU3pYzWQ9f0mbAUQ4I6TKaLd4nsL8jBdRO7aVFQFKVPcznO0D3SmBXEvMXYQ==
X-Received: by 2002:a37:b0a:: with SMTP id 10mr2186621qkl.291.1627514265949;
        Wed, 28 Jul 2021 16:17:45 -0700 (PDT)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id q184sm794947qkd.35.2021.07.28.16.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 16:17:45 -0700 (PDT)
Subject: Re: [PATCH] fpga: Fix spelling mistake "eXchnage" -> "exchange" in
 Kconfig
To:     Colin King <colin.king@canonical.com>,
        Moritz Fischer <mdf@kernel.org>, linux-fpga@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210728215150.191914-1-colin.king@canonical.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <5e7b2e4a-aaf6-81f2-2b08-5a9adcbbee57@redhat.com>
Date:   Wed, 28 Jul 2021 16:17:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210728215150.191914-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 7/28/21 2:51 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the Kconfig text. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/fpga/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index 16793bfc2bb4..991b3f361ec9 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -119,7 +119,7 @@ config XILINX_PR_DECOUPLER
>   	depends on HAS_IOMEM
>   	help
>   	  Say Y to enable drivers for Xilinx LogiCORE PR Decoupler
> -	  or Xilinx Dynamic Function eXchnage AIX Shutdown Manager.
> +	  or Xilinx Dynamic Function eXchange AIX Shutdown Manager.
>   	  The PR Decoupler exists in the FPGA fabric to isolate one
>   	  region of the FPGA from the busses while that region is
>   	  being reprogrammed during partial reconfig.

Looks good, thanks

Reviewed-by: Tom Rix <trix@redhat.com>

