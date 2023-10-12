Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0F0C41513
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Oct 2023 09:47:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235625AbjJLJrK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 12 Oct 2023 05:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235532AbjJLJrJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Oct 2023 05:47:09 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF599D
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Oct 2023 02:47:07 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4065dea9a33so8091125e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Oct 2023 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697104025; x=1697708825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UeXq+sUDC3iybMZQ272ShVYmOdXvv1Ct1/FwJd1aa9o=;
        b=edqsYuxkZLbFD+hkob0yMwXHAQH1QcpASHOLBr+z2wvwZpSr/uIKyiAH2FR9RFo5jw
         LuhECETq7JNP1R338vO0M8pnP0gpBZwaOJZcfUc2fH6O4tvv+ModYFsYY86SIT5LThTU
         ld46b+Uer2B60gzK3gFVdusCbV/l6a1ObMnvNoKzub2Yyhd4MRj+4EPZAP/7nklMVNAV
         BAUtAiYWgfAVr/pSEd8sxqqdGdF2ZiGMsCE5fUtsl+3eDBF7+FeAEhUnntCKQgKmlIne
         74zESbY0VmiDMlzRd8av4gBHin5ZBiLvVA4EmRVE4tzcrTwl1P5k5ummMcdTJ2UJbfU9
         K9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697104025; x=1697708825;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UeXq+sUDC3iybMZQ272ShVYmOdXvv1Ct1/FwJd1aa9o=;
        b=Bww2EixP2BRdygpkjTNTQ6tLNVNT2x1bVkAEvNvkHKn9Xq09KWet41ttzx8XiyW3T8
         Fh92yTHhhPxxPdMe1Rz28EJyBZiErLp7KUoc8OPLdXjimQ1r+RzCnsj0jQNgia7S1ppr
         uQnxGv1OcZI5VzZADE0/UMzNCdIUzJh55XEDi6RKwsd4mrjmMvsrBx8emUvkr2DaHyBx
         M582AmXIBCHtSSZCwlNBiBIMzEgD3qXX4vq74h+vESzePVnCvJigWVXcDsGwmUfYES+n
         gukbiyt4ohQgWzpozpCiXTq/KRg9XHFOyNe0uelikidyp5GI3cGALmGTgKG/MrinhBnR
         FJqw==
X-Gm-Message-State: AOJu0YwWdDpHRvrIGzDDejvNnOQ13EJCPWR9fSK6RLW+TePwSYlgAwYw
        l0LUPnW80LPTbKveXe3L1zZjFg==
X-Google-Smtp-Source: AGHT+IF6r7I9r42k4ezEvRypqI+xNwUcQQhDvwzlcBBRZUMp2y+pZPHzECAyVxIq0q1oNpYu8Z0E/g==
X-Received: by 2002:adf:c805:0:b0:329:6bfa:dc8c with SMTP id d5-20020adfc805000000b003296bfadc8cmr13510782wrh.46.1697104025557;
        Thu, 12 Oct 2023 02:47:05 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id e14-20020adffd0e000000b00315af025098sm18065099wrr.46.2023.10.12.02.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 02:47:05 -0700 (PDT)
Message-ID: <4fb9f4e8-2b6d-46ae-bf7a-cc21a3ea2366@linaro.org>
Date:   Thu, 12 Oct 2023 10:47:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: clean up a check
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Robert Foss <rfoss@kernel.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <f11b1d6b-5800-4d75-9732-506be3f8458d@moroto.mountain>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f11b1d6b-5800-4d75-9732-506be3f8458d@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 12/10/2023 10:42, Dan Carpenter wrote:
> Imagine that "->vfe_num" is zero, then the subtraction will underflow to
> UINT_MAX.  Plus it's just cleaner to use >= instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-ispif.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index be9d2f0a10c1..ddfe94377ee5 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -270,7 +270,7 @@ static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
>   	unsigned long time;
>   	u32 val;
>   
> -	if (vfe_id > camss->res->vfe_num - 1) {
> +	if (vfe_id >= camss->res->vfe_num) {
>   		dev_err(camss->dev,
>   			"Error: asked reset for invalid VFE%d\n", vfe_id);
>   		return -ENOENT;

 From my @linaro.org address

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
