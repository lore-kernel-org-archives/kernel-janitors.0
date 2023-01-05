Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05568C54E76
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Jan 2023 11:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbjAELsL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Jan 2023 06:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbjAELrv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Jan 2023 06:47:51 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CADA32EA6
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Jan 2023 03:47:49 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bq39so46905457lfb.0
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Jan 2023 03:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hLR0nZXuNIYoIesX6DVUi4Rib+LKJqv3J/7PyPgB2Q=;
        b=XWDYx2nYaEb6OYdC99geqWz9iDmWpz7ZGzMFd6WVtWtf+hSpQn/tN3R/3VjTEW6H07
         PI4t2h/ULyYTs2HxZI7jkRV9Adv7PI29iXqQByG87fHMifKjDyoj3umjZUqmF8s+t4j1
         KWpRcTQ7JCau+cFOA3mHcJ8V2jq4xcVkBw+/WKyrMiHkvDNDpjIRpJ+hD0vrxJ5k4aE/
         2RMXE0bbp/fzbNLmizyvOcf6kxFHYTk10QBtUoWQyzIXtMn/D2ZFaD671wBNrmQ8MQKk
         7Jqrl7BYTe9wq5vdQ0veP/2Ir5736glglUNNPuT89R8I25V2f+ap1v/xKzi3KmB2FJ1E
         yAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hLR0nZXuNIYoIesX6DVUi4Rib+LKJqv3J/7PyPgB2Q=;
        b=g8Vdk2Aq25QAw699v8gJ0HHTTMe8TMuO9AVmJzBNuhMdZ/IcH/SfQVoNcwEUmJTpeJ
         eAr/xyatudHSQTyMhVYHnffgoq88H79S/RDw91GbipZbAp7RTnv0TMQsj6IVfbVdF0fk
         EfDh95SVzPPhTjusBRlQUBzFGwM7ZXY1xmtCWe3p73iUfqDPDmFP4Z+fJswXt3tAT0T4
         rxcDqcGONsBNpR+NpGMxopvqqos29pZW1zmv0GrEnVRJYCWRPaplKu/ZNyUtOjC40RQT
         BnXBWc3Gje8bBGePkymYlKSqsy5zvjVoqgGoikNGsRzNOUirkdtfUmSyqTekSPE3TkuS
         TE+A==
X-Gm-Message-State: AFqh2kpJWNSyV/3SIPermSH1P5SQvZbj1tlyE87tqemrCrMo6cX/SJbn
        tqCNkPLOxMXR+inP4/EfT7KGEh9wuRy3ltAH
X-Google-Smtp-Source: AMrXdXtxP8vYSnpm+Vi4aX6E7QPRgl4P6hxDmx/56uXyWHwAQVOfoYgaa4BEfqwQ1jnEudxs5fERkg==
X-Received: by 2002:a05:6512:158d:b0:4b5:90c5:281c with SMTP id bp13-20020a056512158d00b004b590c5281cmr16031177lfb.19.1672919267746;
        Thu, 05 Jan 2023 03:47:47 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id q20-20020a056512211400b004ac6a444b26sm5464430lfr.141.2023.01.05.03.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 03:47:47 -0800 (PST)
Message-ID: <7017c4e0-16c0-225f-028d-2cf2cb34f360@linaro.org>
Date:   Thu, 5 Jan 2023 12:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] soc: qcom: dcc: Signedness bug in
 config_reset_write()
To:     Dan Carpenter <error27@gmail.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alex Elder <elder@linaro.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <Y7asNqoIapctHmbI@kili>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <Y7asNqoIapctHmbI@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The commit message should be written in an imperative manner,
such as "Fix X, make Y do Z"

For the code:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

On 5.01.2023 11:53, Dan Carpenter wrote:
> The "ret" variable needs to be signed for the error handling to work.
> 
> Fixes: 4cbe60cf5ad6 ("soc: qcom: dcc: Add driver support for Data Capture and Compare unit(DCC)")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/soc/qcom/dcc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
> index d4101f79cb5d..1e2cbefc1655 100644
> --- a/drivers/soc/qcom/dcc.c
> +++ b/drivers/soc/qcom/dcc.c
> @@ -808,8 +808,9 @@ static ssize_t config_reset_write(struct file *filp,
>  				  const char __user *user_buf, size_t count,
>  				  loff_t *ppos)
>  {
> -	unsigned int val, ret;
> +	unsigned int val;
>  	struct dcc_drvdata *drvdata = filp->private_data;
> +	int ret;
>  
>  	ret = kstrtouint_from_user(user_buf, count, 0, &val);
>  	if (ret < 0)
