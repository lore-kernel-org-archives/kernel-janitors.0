Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2373C433ED
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 16:01:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 991D76124B
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 16:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346710AbhDMQCS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Apr 2021 12:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346652AbhDMQCR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Apr 2021 12:02:17 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37297C06175F
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Apr 2021 09:01:57 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id i4so8705158pjk.1
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Apr 2021 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Q/AnNTNlBCjZqChhNddMYNKRfa5HdDTkyK0WivXdYHc=;
        b=i1NAtzOjQ0lsMAwDmYC9XV3ElHbrEqnkWfccIxI72XX3nbpZDq2wOjmgmdGK0LMRMB
         eUjmzKz4UIy/LISe/9abSPbI1WrZQX8ZMkMO6EJkd/LxG0DYbWgQ35pTeUU9wfM9d2p2
         V/ETWnzwYqcBbgQjNaSf49v9VjkmIHO8SzT4lF1vtLssuquPrvwS2FXZrrVddb4ryQRg
         41Sd+SySTNvxrjfLVXw+fyYKuyv+DXaR4iJz1wGVlQNu4AczCQ9gGyiavETu8+o6PO0Q
         ILARH/49mYF9XDCsa/fFCRTug+A1jlFPQCJ+McDwHng0BGlv4H+Mb0Clh60JAwHKq+gP
         Gakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Q/AnNTNlBCjZqChhNddMYNKRfa5HdDTkyK0WivXdYHc=;
        b=lb0/SXI5Mwa/xnRrKcXP0to5dUC0gUtslc9B8JEIEO7DdmsPmxOtzjZInfg6KvzMki
         FFXeMus0Ec9WJjJSXDjO7V7f84dBfDxVCIgNpayHYy06i2owzO3idXagv/JYRPV5DuX9
         3G5Yvu3R+cI+mL55qhMxXNVvTjSbHv5AaZcEtXhfHv/cnKhx0NUpn0LxavzM4eYLBxFM
         HJJ0Du05IESxnIt1ikCfE8biq8mffLpA2sKhZygl8VrrCPvvQHsyJzRSBG5pN55FTxqN
         FkBzT5ZI09nL3E5qCz6vf7tnPYosvcoEGJdqTK5BieBNr67u9Wg9y28lB8ocNyMloLHq
         pKfg==
X-Gm-Message-State: AOAM532U1r4yTr6di7KRTeAJQN5DSnOmnM1lhdeqo6qum42D2TPP1cJZ
        RvX2u1IV+TmXmYWMKV9xwpujfPg8xQMoAA==
X-Google-Smtp-Source: ABdhPJyVs41VJHay8GUipc1O1fwMSTLtC6VZibMSMx6M8ls0jgOw9Z1wvMoytdd0berH5lKG2eY/XQ==
X-Received: by 2002:a17:90a:c7d5:: with SMTP id gf21mr748510pjb.80.1618329716359;
        Tue, 13 Apr 2021 09:01:56 -0700 (PDT)
Received: from Shannons-MacBook-Pro.local ([50.53.47.17])
        by smtp.gmail.com with ESMTPSA id 63sm7233147pfu.43.2021.04.13.09.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 09:01:55 -0700 (PDT)
Subject: Re: [PATCH net-next] ionic: return -EFAULT if copy_to_user() fails
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     drivers@pensando.io, "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Allen Hubbe <allenbh@pensando.io>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YHV230jUzxBJxlPS@mwanda>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <a1581cc4-fa0c-22eb-0a2c-62f1a1a1e215@pensando.io>
Date:   Tue, 13 Apr 2021 09:01:54 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHV230jUzxBJxlPS@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 4/13/21 3:47 AM, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes that it wasn't
> able to copy.  We want to return -EFAULT to the user.
>
> Fixes: fee6efce565d ("ionic: add hw timestamp support files")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Shannon Nelson <snelson@pensando.io>

> ---
>   drivers/net/ethernet/pensando/ionic/ionic_phc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_phc.c b/drivers/net/ethernet/pensando/ionic/ionic_phc.c
> index 86ae5011ac9b..d7d8d5e81ea0 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_phc.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_phc.c
> @@ -225,7 +225,9 @@ int ionic_lif_hwstamp_get(struct ionic_lif *lif, struct ifreq *ifr)
>   	memcpy(&config, &lif->phc->ts_config, sizeof(config));
>   	mutex_unlock(&lif->phc->config_lock);
>   
> -	return copy_to_user(ifr->ifr_data, &config, sizeof(config));
> +	if (copy_to_user(ifr->ifr_data, &config, sizeof(config)))
> +		return -EFAULT;
> +	return 0;
>   }
>   
>   static u64 ionic_hwstamp_read(struct ionic *ionic,

