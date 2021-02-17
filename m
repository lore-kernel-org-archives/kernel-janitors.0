Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C82C433DB
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Feb 2021 14:16:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2120764DBD
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Feb 2021 14:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233314AbhBQOPk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 Feb 2021 09:15:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbhBQOPf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Feb 2021 09:15:35 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2AFC061574
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Feb 2021 06:14:55 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id u14so17576607wri.3
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Feb 2021 06:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UDFCRTsuiZ3IiAm76Fu7UKNR+ruV15r3mLWBUKSRUYk=;
        b=FMzIj+DJ25ZBr9XVddM/3sw4Ehs2ShlUSy4+IsWMKw5/EiywQmPWCY+BijAzt40ZEf
         Mtyzv7WTU5/nktwY9Li/Lc9lCgMCkXMjgfWGtKroR5kUH8iVwslpgv/lVOUl7bwQw8Sj
         HjbciOmOvBoNm9YhGrNvkeSMLLl+0gKuN7RzSB0/6qXuykp+ZY9vZjJTI5S5kGgtBIYy
         NgoPxH4wFk7lo+xQoYpv80b1F4KqgwDFrMEcxqJbDcEwnSyF3JNhtEsMFX6kBP8e8g2r
         OBi8707/VxQnfjF4L3NU9A1iMG3vJGXS2V5ICBiRn2xFO1CYcyx7Oh2BMmTxioXRD3eK
         BiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UDFCRTsuiZ3IiAm76Fu7UKNR+ruV15r3mLWBUKSRUYk=;
        b=iNj3ya1aIz1+TryS/enX9VDkwq3pXnP09iW4O+YsezCwHaw4xFMrKyh5nWja8LyzbE
         cKCy+luZb3+0/xHmZKby5BH5k4y8hYanB0+3k7voECxGTXk5KB1wzKfrFjNfkpZWgHiS
         ShKYDhnY8ey3mTGkLClxqzYJk1OMCYpvIeHA6M+a2kkUtDgOAFTpf+g5zNe42UvaHvIa
         EIAq13MOURgcLQaFF9yBxRRxU1vhp04KNsoH0g6nfX8XlYXaG3gHTOQQOGrdK9KlTvav
         4xCcUJDougNpmDTXnXpexG8oFEQ6C6yrRPFHmajnm7W9nut71gHzgDDoX3407dvxGTd9
         YAwA==
X-Gm-Message-State: AOAM531pfWA7+iTjptk01bnBsW9d8k05F7uLX/tuNpD9RghV4av44q6g
        kUtUoLJms5P4mVRQoONey9+xtA==
X-Google-Smtp-Source: ABdhPJwNxrY3w7dpix3j+g9HhjNKICiJJZam+Eh0j5KukroXDcYynUnVCkkLPfAbhQS67/4wu1zBxg==
X-Received: by 2002:a5d:4850:: with SMTP id n16mr29797243wrs.296.1613571292946;
        Wed, 17 Feb 2021 06:14:52 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id m17sm3083820wmq.5.2021.02.17.06.14.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 06:14:52 -0800 (PST)
Subject: Re: [PATCH][next] ASoC: codecs: lpass-rx-macro: remove redundant
 initialization of variable hph_pwr_mode
To:     Colin King <colin.king@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210215200501.90697-1-colin.king@canonical.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4e261a11-4577-4568-8ab3-f2ef1a9a8474@linaro.org>
Date:   Wed, 17 Feb 2021 14:14:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210215200501.90697-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 15/02/2021 20:05, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable hph_pwr_mode is being initialized with a value that is
> never read and it is being updated later with a new value.  The
> initialization is redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
Thanks for the patch!

LGTM,


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   sound/soc/codecs/lpass-rx-macro.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 8c04b3b2c907..76909c50d7b9 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -2038,7 +2038,7 @@ static int rx_macro_load_compander_coeff(struct snd_soc_component *component,
>   {
>   	u16 comp_coeff_lsb_reg, comp_coeff_msb_reg;
>   	int i;
> -	int hph_pwr_mode = HPH_LOHIFI;
> +	int hph_pwr_mode;
>   
>   	if (!rx->comp_enabled[comp])
>   		return 0;
> 
