Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A275C433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 10:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A7DC61981
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 10:45:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbhEJKqD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 May 2021 06:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbhEJKoo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 06:44:44 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237B3C06134C
        for <kernel-janitors@vger.kernel.org>; Mon, 10 May 2021 03:33:55 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id n2so16110133wrm.0
        for <kernel-janitors@vger.kernel.org>; Mon, 10 May 2021 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j9ho1FshsaBSAwzsRsNW4z/HT3Epd7NSpGM7BhSuMLI=;
        b=Cgd2xNWIsVDX4Xl20RjyyQ4FGNgdzGAty8TF4bAjIR0WhTqWum0+aJAgcxHj/EQ8Ed
         kDakR2SDvRtBWuRixHYp/j0hzYlo6YAVJZq3Z2kDwbpdEqvJycsoZLAYZhrww98iCXV/
         n4Yf0tuTto88YwF1sF3qOkEu+oN7mnkb+gV7kZqQfc+skszrqg6qeYhyV1Oa+HmEuH4a
         wsmW7GZg5wSzl12Pl3A3ClNCy6BB2XmYTvIPLmLPnR6khRt1HB51EpoHwVN7j7MCD6lE
         tLNrUiGKTV1wBU1CupexdnUzO3u0g59DHsXwdTswYMzb/nhiXR3LVDGCsRgIIcvP9/Qz
         8udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j9ho1FshsaBSAwzsRsNW4z/HT3Epd7NSpGM7BhSuMLI=;
        b=Z2lHvZZudxEGR3JVntTeqniGBuFwCf7pIpbLOb/zgX0mMpKpGmxaPwYMNb4VXtJGv/
         Nqz4IFzywjdggXUnfrLxj9YUxMdRij9bO4oeBPI6yNgZBv1kYSLpH5l4dkmEQrsIz2+/
         +hec9imC9XWDLNAjM4ahLOqIpsiPdIY9fv59PZRIM0WGgUVtOm4/SEy4sWgrCQ4qRm5Z
         9L8ViwinSMfdwiT84L+n67VCJpROLnpE1rZf/w6TqYh1k6nVzkHFYmyw+DuQfu+nZU1L
         KwKI8z/6Lu1iPakdvxJJsOijak2dqc+dVPXz10r42tuTostr7lFwAswLgT0TQPs0o0C4
         ALzA==
X-Gm-Message-State: AOAM530YXkMPk/7WZNpTRfBXsKgOWuQB1icPkhRbE/MmTwh1oCbpoz1a
        NoJ4XEwPyajz3ktQ6wrrm4/OlaOPiLJnLUi0
X-Google-Smtp-Source: ABdhPJy1SqFJjzZtiLqFnniXN1gwxbdOhOTKoi7KDq80pgXVVv02TOIdIAi3Odqa4ZJaLPJtSKzYcw==
X-Received: by 2002:a05:6000:1b06:: with SMTP id f6mr29460986wrz.339.1620642833642;
        Mon, 10 May 2021 03:33:53 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id g6sm25938797wrr.63.2021.05.10.03.33.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 May 2021 03:33:53 -0700 (PDT)
Subject: Re: [PATCH -next] ASoC: codecs: lpass-tx-macro: add missing
 MODULE_DEVICE_TABLE
To:     Bixuan Cui <cuibixuan@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Ye Bin <yebin10@huawei.com>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210508031512.53783-1-cuibixuan@huawei.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a4bbe07e-eed6-4667-3efc-c9307782c05b@linaro.org>
Date:   Mon, 10 May 2021 11:33:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210508031512.53783-1-cuibixuan@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 08/05/2021 04:15, Bixuan Cui wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   sound/soc/codecs/lpass-tx-macro.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index acd2fbc0ca7c..27a0d5defd27 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -1846,6 +1846,7 @@ static const struct of_device_id tx_macro_dt_match[] = {
>   	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(of, tx_macro_dt_match);
>   static struct platform_driver tx_macro_driver = {
>   	.driver = {
>   		.name = "tx_macro",
> 
