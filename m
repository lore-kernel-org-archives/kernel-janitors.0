Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D01FC433FE
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 May 2022 15:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234936AbiEYPNd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 May 2022 11:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245147AbiEYPNY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 May 2022 11:13:24 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB11B2257
        for <kernel-janitors@vger.kernel.org>; Wed, 25 May 2022 08:13:21 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id j15so1183344ilo.5
        for <kernel-janitors@vger.kernel.org>; Wed, 25 May 2022 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GdVXDiBTvDsGSp4gN7P3+qWOHyyVf7qzlb5UHFgMfDQ=;
        b=b4wHeygbsIeo4NVYzDdomfgzLiq/t/x5cyEzlGM6NAz1ILFgOtx9BtuNP861SjtiDx
         nd/T3BZbDVrpQLQR10r4IgScjxztwfsRk126/1HGktqLvFD4pRgpad52yH1Bwq2aL3Qz
         JAgAnsp2jjHnawnIlW8F51Tj8iRrEZr+f8gnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GdVXDiBTvDsGSp4gN7P3+qWOHyyVf7qzlb5UHFgMfDQ=;
        b=LalsbXttI7/38XQ725xiI5A19H5bU+B0UIU0bDbLiAKZkgaR3Bf0r5pdDxqDJfcvnE
         60s/p8yCHXRUFgRozbdJiOnq+lRcLIWak2asH8s1gEYFcEhgKNtAQ2EgyyrbTRmq7sCc
         9Tt6k53/fpl6HBuG5DmC/rtDAPTM9wFZfs7S0LvChc/fvrzMej4Zq+KFzyg74MoSeWpB
         u6t0INsg6WtDBM35VYdOl330jR/Smx8sxJ4eEgS8kXPBDYaKCr863mGxDUUQuibyudVF
         f1q8lhba2C8kdIQZfDIDOfryDTe21j9A3Xlj7Y5VseVxysT/haj+GwhCy8/ObU6WRLKl
         gogw==
X-Gm-Message-State: AOAM530xQV44KF/Hn3FR04Q4XHMA0cy02O8SKcjDgoIIg7FZPpGVGgMF
        RkNua87ddo/CxivVwuVN41ybhQ==
X-Google-Smtp-Source: ABdhPJw7noa1HtR4Ak6KYzkBU2fFGxwdHHwQ2YkMao3TZhxjvPlXMjXcupLi+OzrR1Dd7utepFGtJg==
X-Received: by 2002:a92:cbd0:0:b0:2d1:48cb:1739 with SMTP id s16-20020a92cbd0000000b002d148cb1739mr16227573ilq.10.1653491601136;
        Wed, 25 May 2022 08:13:21 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id o30-20020a056602125e00b0065dc93eae5dsm5725027iou.7.2022.05.25.08.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 08:13:20 -0700 (PDT)
Subject: Re: [PATCH] usbip: vudc: Don't enable IRQs prematurely
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Igor Kotrasinski <i.kotrasinsk@samsung.com>
Cc:     Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <Yo4hVWcZNYzKEkIQ@kili>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3f9926ac-9586-522e-e70b-d524b7cd19cd@linuxfoundation.org>
Date:   Wed, 25 May 2022 09:13:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <Yo4hVWcZNYzKEkIQ@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/25/22 6:30 AM, Dan Carpenter wrote:
> This code does:
> 
> 	spin_unlock_irq(&udc->ud.lock);
> 	spin_unlock_irqrestore(&udc->lock, flags);
> 
> which does not make sense.  In theory, the first unlock could enable
> IRQs and then the second _irqrestore could disable them again.  There
> would be a brief momemt where IRQs were enabled improperly.
> 
> In real life, however, this function is always called with IRQs enabled
> and the bug does not affect runtime.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> An alternative fix would be to make changes below and also change the
> outside _irqsave/_irqrestore() to just _irq().  However, that's more
> invasive and riskier with no upside.
> 

Thank you for the patch.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, please pick this up.

thanks,
-- Shuah
