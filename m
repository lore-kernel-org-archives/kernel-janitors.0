Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105BFC433FE
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Mar 2022 14:50:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243406AbiCGOvd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Mar 2022 09:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234136AbiCGOva (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Mar 2022 09:51:30 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DFB985BD8
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Mar 2022 06:50:35 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id s20so3895704iol.2
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Mar 2022 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sEpDC/ynny7PhhFyoZeZTcKx4U+48NvRbDORJ2XRjJ4=;
        b=j+0CEXXO8ZnYJf0T5m9RbzeiYWJ3Ww+Ef67WcdAjmY2iJ24OC6+FGwOfXswmbwYB6D
         baRvH7FNd4Wct/dY9mGjydPQmpu27lHGz5HUMEx607OXjZb2TJ35jECQHCmtAggKJ9W5
         lAc/gXxjfzFNJuJXYcnCWSFhcWz3cEbDtK7V5cCh+4RCG2OVAqQv5mNBTgPbFMsuuQnl
         ysZjRStVA2ub6hAZtq+Pr/OtX1NbXpt8zahqtwhEKr7Ylp0F8krF5ajPWoxLOZ+WAD37
         W1gi6SsArNDY5AEZt0HOi3FM8jOrWvSpEFff72P8GO2E1MVUxYDrGoh/OMNZMbgcHFNF
         4SfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sEpDC/ynny7PhhFyoZeZTcKx4U+48NvRbDORJ2XRjJ4=;
        b=NJYKNru9RzORtx6UTpbYK65PHnpt2WBPfOKjI00/TVyFY02odEJ0tQJjyT3xPnm/7c
         eEXtj2ydSRAH6+axpxxZOy/efJ0yVRzY7S+stKnLhpNkysO13zn+WtYzyHPEFllqxE0B
         rU6WP0SMLwxhbx9xbVxNO/6XS6KaKGTfw6my8lYtLWLqJum1lTvhkdFFpn/HdaHH+d8A
         JfAL/S53Qsx5mu2nY0R15hsc9pRGPOSMLoJbFHauUx/99L58eCNQpVJLi6nT77FrlM5h
         9nhX+2Iq2WFuoArCojN6DBhUvyqyO1JzAUTyr4HRrmwMh4uMlY5hBGj88Etnuu/Q3r7Q
         Co9A==
X-Gm-Message-State: AOAM533yIze7k1LnSU42K5JxjqSWTptDzL2pTxFL2mypSCa6QUqgkcnU
        uVvtAatybpK0p2Bwk1FgVMurr+Z8ue6qe3R5
X-Google-Smtp-Source: ABdhPJxGFMWVVa7nlFp599lcFlh436gEkLRUtgcUd75YtRdpvQg1rQQyQaDPNieM4HjQq2XEL6smxA==
X-Received: by 2002:a05:6638:1453:b0:30e:cf95:3c34 with SMTP id l19-20020a056638145300b0030ecf953c34mr11629360jad.221.1646664634661;
        Mon, 07 Mar 2022 06:50:34 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id a8-20020a923308000000b002c268520d16sm10195960ilf.22.2022.03.07.06.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 06:50:33 -0800 (PST)
Message-ID: <62773196-bf38-258c-8537-4baa84959a6c@linaro.org>
Date:   Mon, 7 Mar 2022 08:50:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] bus: mhi: ep: Fix signedness bug in
 mhi_ep_register_controller()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20220307142822.GC19660@kili>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20220307142822.GC19660@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/7/22 8:28 AM, Dan Carpenter wrote:
> The "mhi_cntrl->index" variable is unsigned so the error handling will
> not work.
> 
> Fixes: 10f0ab9c6787 ("bus: mhi: ep: Add support for registering MHI endpoint controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good fix.  Is this code upstream somewhere?

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/bus/mhi/ep/main.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 3e98107f08c4..879071b021d5 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1418,11 +1418,10 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
>   	mhi_ep_mmio_set_env(mhi_cntrl, MHI_EE_AMSS);
>   
>   	/* Set controller index */
> -	mhi_cntrl->index = ida_alloc(&mhi_ep_cntrl_ida, GFP_KERNEL);
> -	if (mhi_cntrl->index < 0) {
> -		ret = mhi_cntrl->index;
> +	ret = ida_alloc(&mhi_ep_cntrl_ida, GFP_KERNEL);
> +	if (ret < 0)
>   		goto err_destroy_wq;
> -	}
> +	mhi_cntrl->index = ret;
>   
>   	irq_set_status_flags(mhi_cntrl->irq, IRQ_NOAUTOEN);
>   	ret = request_irq(mhi_cntrl->irq, mhi_ep_irq, IRQF_TRIGGER_HIGH,

