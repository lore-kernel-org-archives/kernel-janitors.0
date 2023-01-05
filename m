Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A2FC3DA7A
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Jan 2023 13:53:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbjAENxM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Jan 2023 08:53:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbjAENwi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Jan 2023 08:52:38 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FECD4BD6E
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Jan 2023 05:49:44 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id g2so17823336ila.4
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Jan 2023 05:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+EfeHl/1IP+/07uVo+FHPk5/ivN0KbKakriNv0+4520=;
        b=Scqia4TJZnPMkNtHlIxXKtrvV2pTkX4dtZU5j1YO32Afq2FImMOQr1YDeT33Q044Hn
         Rj+rUZMYactEz/ol9Pd2SzaYfMZUWjxR6HK6fbf2L7LJIrxdZ8e5AYxTbq2FG2QtD7gB
         Zb20cRO/p6Tq7PxbcZBXFd6bmUx8BvNmFyVbgkQafC5i9gB/QY9MtEHv9GQ+wj1Llbr8
         o250+sAHctdBjpv+9U3VJcfuED8UHWJQSJkjOyl2+yiZLdUw2aXjyu9/QWTWzkaH5aFO
         bU3zjM+CsJQBacFlqOH0gTM9/l3CRFsF+nlaRkf6lcRZEcfDtINUz+MXicfhFp8dipJ/
         OvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EfeHl/1IP+/07uVo+FHPk5/ivN0KbKakriNv0+4520=;
        b=uM7DCvP8TrWai3Lzkz/3EufEWUKLjqjxpmoZ4WT+QWPcvWtDsQ6RqrUStI93alSFIE
         c4auTXPNi4fhUW9L5shdO67Rfm69zn3m4PwE2GCm+tLZcnFRGQLLBPw/AHCI9ybl1bmh
         7WsjmeeF4P9ac4HBuO7Uo34OUFnmqLjdEk/by7oq3VwtFHT37FTv6LpcNrUpEwLzKGpN
         TSABtfBKP/o6acClsi/8xG5FQ4Kx51a5nkgSFIY9QQl5brNr72QdJNp7isKKu6lO2xB7
         JjZawjKfcKlaxlMV2x7jwCuW+mYAu6Qxhf2d2Ll7Qlqi4q+PZ+xw2jjtpUqpAFyal43y
         yxsA==
X-Gm-Message-State: AFqh2krm9Vys+332BWqZpwwh72HdMMzHE15WHyvHo+d4ycgXwJCF/gxw
        bdVPNTUkYYaEBrQfJT3nUXiNKg==
X-Google-Smtp-Source: AMrXdXsC/WGH3nsIZ+TZSjxmRvA1203bSoNwX7Pc2WkYE+Bmrki+6Qsf4Uual2d6s1+XRLim/sHbqg==
X-Received: by 2002:a05:6e02:f51:b0:30d:6d3f:59e1 with SMTP id y17-20020a056e020f5100b0030d6d3f59e1mr4692702ilj.31.1672926583566;
        Thu, 05 Jan 2023 05:49:43 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id v14-20020a92cd4e000000b0030258f9670bsm11499428ilq.13.2023.01.05.05.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 05:49:43 -0800 (PST)
Message-ID: <70de4cd6-1bbf-24bb-a5c2-209cc4f8f555@linaro.org>
Date:   Thu, 5 Jan 2023 07:49:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] soc: qcom: dcc: Signedness bug in
 config_reset_write()
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <Y7asNqoIapctHmbI@kili>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <Y7asNqoIapctHmbI@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 1/5/23 4:53 AM, Dan Carpenter wrote:
> The "ret" variable needs to be signed for the error handling to work.

The fix looks good.  I'm sorry I missed this one in review.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Fixes: 4cbe60cf5ad6 ("soc: qcom: dcc: Add driver support for Data Capture and Compare unit(DCC)")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>   drivers/soc/qcom/dcc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
> index d4101f79cb5d..1e2cbefc1655 100644
> --- a/drivers/soc/qcom/dcc.c
> +++ b/drivers/soc/qcom/dcc.c
> @@ -808,8 +808,9 @@ static ssize_t config_reset_write(struct file *filp,
>   				  const char __user *user_buf, size_t count,
>   				  loff_t *ppos)
>   {
> -	unsigned int val, ret;
> +	unsigned int val;
>   	struct dcc_drvdata *drvdata = filp->private_data;
> +	int ret;
>   
>   	ret = kstrtouint_from_user(user_buf, count, 0, &val);
>   	if (ret < 0)

