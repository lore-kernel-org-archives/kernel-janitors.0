Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E449C7EE2D
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 May 2023 08:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbjEWIfa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 May 2023 04:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236171AbjEWIeC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 May 2023 04:34:02 -0400
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7FFE53
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 01:32:30 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f00d41df22so5552403e87.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 01:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684830688; x=1687422688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqoLnPSfzNBEJLzNJAPohzVk9qbOTTKvfqApSvbpZ+c=;
        b=ELy+Lp+OvEhcap5C0YrUMC1dMKfxBvdVuOJFeYxBcIYZBR+8ScE4WnTd21oY5McKlP
         1QdyGlR4Hxw+sdMXaL4IcbKIgS4RT4yWZDHkhxKLrSwVjkx9kSsitjC/e1g3MgjqJgd0
         Kn+Lrn77TkmOlvWiIZ2wpKIazbIxqCdFc8n0SUKOvA+SdNkbzSfJqrEtKXtj1rMyB+eG
         asr48JKDGCvPPZOnXUE/hiP8EregYHs+mfhz0qNEfV63YLpFvg6QI6rvK8OGXdfsVTqy
         sum6j6GzqE8JeRiM/NBQeJDIaWRUmN771jtV+YCD/V0nX9PNtxZXvojMeVVd9xl7We8i
         beKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684830688; x=1687422688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqoLnPSfzNBEJLzNJAPohzVk9qbOTTKvfqApSvbpZ+c=;
        b=LD31RV9WBm95FjhkJKNpdt41hZgU9ZkLJ92V71gkTj1bShyMxFI0P59d4gqhAaHGJk
         /kN78NhI50eLFYobfZV3Nw5c2BkFLsWMLSlV14LXhBtfoLVvBcnjirxmjwE7MRhHXFVa
         22638v8a59BDZWr0XvUKregj4wsgf1N7MIbwBhCdzDOQccraLXWq1Kyv952/GGWLhY9F
         9bJwZI+NwGn3wy0+TVKRYf9sI1y+svfuzgRKx2EzJpq94Or9ZzYd1ccA35CAyBeetFTP
         KK3+A0GJFFtL4a18MTzzt7T7ik/AL85Mqwz2rtdlfKfQot69NOvSizaBqLtBgYGRofzj
         0KzQ==
X-Gm-Message-State: AC+VfDz0mKXvXJS4IBMFQpYRVvFX/YHuC39MqO8dM6+r9B9WMbFweLCd
        TeguAGe64aMavX0nB82hGnMQCQ==
X-Google-Smtp-Source: ACHHUZ7JyrwZTrtDlI3Rdt3V59245cL6RCr1E3O4A6gzrvtZmmfKgGhM1zhi1+TwYl6PjHb0U6btSA==
X-Received: by 2002:a05:6512:24e:b0:4eb:e8e:4139 with SMTP id b14-20020a056512024e00b004eb0e8e4139mr4888297lfo.2.1684830688603;
        Tue, 23 May 2023 01:31:28 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id h26-20020a19701a000000b004ece331c830sm1259533lfc.206.2023.05.23.01.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 01:31:28 -0700 (PDT)
Message-ID: <2f03fa9a-1b4b-d208-f399-a31ab8c5b4cc@linaro.org>
Date:   Tue, 23 May 2023 10:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] interconnect: qcom: rpm: allocate enough data in probe()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <a0f6184c-c2b5-4e8d-9b8a-867ae83f3094@kili.mountain>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <a0f6184c-c2b5-4e8d-9b8a-867ae83f3094@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 23.05.2023 10:11, Dan Carpenter wrote:
> This was allocating "sizeof(qp->intf_clks)" which is the size of a
> pointer instead of "sizeof(*qp->intf_clks)" which is the size of the
> struct (8 bytes vs 16 bytes on a 64bit system).
> 
> Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Whoops. Guess I was just really really lucky that nothing blew up for me.

Thanks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> ---
>  drivers/interconnect/qcom/icc-rpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
> index f4627c4a1bdd..7a21a03a0382 100644
> --- a/drivers/interconnect/qcom/icc-rpm.c
> +++ b/drivers/interconnect/qcom/icc-rpm.c
> @@ -436,7 +436,7 @@ int qnoc_probe(struct platform_device *pdev)
>  	if (!qp)
>  		return -ENOMEM;
>  
> -	qp->intf_clks = devm_kzalloc(dev, sizeof(qp->intf_clks), GFP_KERNEL);
> +	qp->intf_clks = devm_kzalloc(dev, sizeof(*qp->intf_clks), GFP_KERNEL);
>  	if (!qp->intf_clks)
>  		return -ENOMEM;
>  
