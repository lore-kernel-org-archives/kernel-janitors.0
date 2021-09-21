Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E506C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Sep 2021 13:40:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78D0D611BD
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Sep 2021 13:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233189AbhIUNlw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Sep 2021 09:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbhIUNlv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Sep 2021 09:41:51 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975ADC061574
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Sep 2021 06:40:22 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id eg28so51877375edb.1
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Sep 2021 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hy0PolOjfaXYxlg2doenD/4mEsnT0y4Wgn5+QthoNgQ=;
        b=mXOd8Uuve41DKLvJrr6/QoaBIEC98yneQWLoPVx38AYsBq1kgX4II0RB8nur8E3FFd
         02ourtfGk+JaJRPJ4PiZNcJzErw7nj6ut4k0mh75Oe08Wz1jT2Sds4c8ME2Ui6kyA+0r
         T7GKMPTxoYgvgi/7XR1kA+a07Ko6GDhqZgU4cgNhtL6whEr5iKu2GKtqL6nNtcDrTXkJ
         RzO3vYQvY39KnW3a5I6O2e9syhpCvLsETc0FHOcWSxnZQoim2XK4MIlhiGWRNm+ex+Tj
         CmGFSsM5cDH4dZw1CwzPwIRvr6jjA1x4Jc+xtlmK1XmvJA8frCmUT1IJq02Tb8zR6NT9
         mQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hy0PolOjfaXYxlg2doenD/4mEsnT0y4Wgn5+QthoNgQ=;
        b=Z5LiQ+aj+PZ7bpPFgtsuZvF3Okhvedk28HlqgflQMdHbG13znel4QrQfvWYvIFnzAC
         NaPbw8OfWusZKJapaLq75IjGGZ8NgQjBK0kPOrKFFGC7doZ5S7laxFT6OMuKcid8sqJB
         oRmiA1yvnA+GJBZGdCY6y/x/xkI1jHV2ffLKcC3cnBAehBcOd9kdo9mo5mlLe5A+hxZp
         qnjZ+g7V7CJjgiVhRwn7vTMldD6S9au+jHQbFMKKpSpsqmys+OLSgEu/i6ikLLweUX+2
         HoOmW+HnbDx790NbIx6Mu05U5hnaP2vwg0P4WnIFCn1ySHgjsdW038P5WZKpPNLcH17K
         v7zw==
X-Gm-Message-State: AOAM531l7FC0KI8jKmwvbuWGusShuEizZYW7ApHszQAk8wSXhx7ktjni
        QcnxQJK+G0mtDwkN3EOi0PGoSg==
X-Google-Smtp-Source: ABdhPJxzci9Rw5XMfFMzir7le7QhtInOzGHLhYgrNyW2wx7vWHnfoqwW/vAgOw35Y2R00vHPEVnFWg==
X-Received: by 2002:a50:d84c:: with SMTP id v12mr34819451edj.203.1632231544394;
        Tue, 21 Sep 2021 06:39:04 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id i20sm8475321eds.14.2021.09.21.06.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 06:39:03 -0700 (PDT)
Subject: Re: [PATCH] ASoC: qdsp6: q6afe-dai: Fix spelling mistake "Fronend" ->
 "Frontend"
To:     Colin King <colin.king@canonical.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210920184152.18109-1-colin.king@canonical.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ccecfbda-c328-22ad-7a00-0f1980fe7589@linaro.org>
Date:   Tue, 21 Sep 2021 14:39:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920184152.18109-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 20/09/2021 19:41, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the module description. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/qdsp6/q6afe-dai.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
> index ac8f7324e94b..8b664cbf6fa6 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
> @@ -1747,5 +1747,5 @@ static struct platform_driver q6afe_dai_platform_driver = {
>   };
>   module_platform_driver(q6afe_dai_platform_driver);
>   
> -MODULE_DESCRIPTION("Q6 Audio Fronend dai driver");
> +MODULE_DESCRIPTION("Q6 Audio Frontend dai driver");
>   MODULE_LICENSE("GPL v2");
> 
