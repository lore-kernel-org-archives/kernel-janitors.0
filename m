Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9035C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Nov 2022 21:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiKAVtZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Nov 2022 17:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiKAVtY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Nov 2022 17:49:24 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F8326E3
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Nov 2022 14:49:22 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id q142so7477030iod.5
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Nov 2022 14:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HejXL+J+QIXG9aHFC0KatU8gI5T0S5HF7LycLEhYP4k=;
        b=XLf9q+YrCpSEojPiWImV+o706LQsz4Os76EOGQVTew1FOVpxlUxe35X0D2L7oB1Q/9
         jK/dn/Fu2f7d5Y+UcN2IJg579s78sTn/J8gLb+Zu/5T+GFkonpTle7ch8HvdxsLgn6IG
         AJGAJKmnFena6VCJCjNReK7oyjMu/bZF5gXC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HejXL+J+QIXG9aHFC0KatU8gI5T0S5HF7LycLEhYP4k=;
        b=Q8aG64TsaUQk4J0pRuOKPNaz1lD4STH5enenyhBlVxYE6hOFizqEEeq1Db4TBARJHH
         ptW2AsBCpNO16zD93KMI96h8v/s22UslWXpNvdlEGWwmFFwzrJB7lhxFTi65yB18Lof6
         Lnb8KmbK/DGiCBeEkDeibzjXC/2RmJrDpDVjX6dy/W29noj8lCYNeKttNAb7gr7Zxfck
         kVJpoKb9VMv8zvGpcFpuJyPvn4uYayxVyNqiBQVklvwPnl+dkHWoPpVF9qYXnoRedxAI
         zUYzoRWNQ3o/ptjVEqGV8Pg2LEfgs0XP/JgcdlckkhJnWOilVmo6kV2juzGpC+8vtp1M
         kHdw==
X-Gm-Message-State: ACrzQf2qm1oxqH1RxlCRcurW0RsWMEO5/UWmOiQKIeludGhilaoLJBWM
        zsDKmPLzCu8h7cd8mE5OG1R5IP+Yxe1bBw==
X-Google-Smtp-Source: AMsMyM6/m1cWkL+Pw6gKRxAuWst0ALy4aPYsPZTBDrZ3EqaBRU9Qibe+PqUodJI1JL0JjikvxtZvrQ==
X-Received: by 2002:a02:94cf:0:b0:363:4a26:8cff with SMTP id x73-20020a0294cf000000b003634a268cffmr13638400jah.286.1667339362369;
        Tue, 01 Nov 2022 14:49:22 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id t11-20020a6bc30b000000b006bc53dd917fsm4327045iof.51.2022.11.01.14.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 14:49:21 -0700 (PDT)
Message-ID: <a20c1378-926e-2f69-1473-fb654fd035f7@ieee.org>
Date:   Tue, 1 Nov 2022 16:49:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 11/30] greybus: svc: Use kstrtobool() instead of
 strtobool()
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        greybus-dev@lists.linaro.org
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
 <ebf1e6988a53a455990230a37cf759ee542ea7ec.1667336095.git.christophe.jaillet@wanadoo.fr>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <ebf1e6988a53a455990230a37cf759ee542ea7ec.1667336095.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11/1/22 4:13 PM, Christophe JAILLET wrote:
> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
> 
> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> the other function name.
> 
> While at it, include the corresponding header file (<linux/kstrtox.h>)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks OK to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
> This patch is part of a serie that axes all usages of strtobool().
> Each patch can be applied independently from the other ones.
> 
> The last patch of the serie removes the definition of strtobool().
> 
> You may not be in copy of the cover letter. So, if needed, it is available
> at [1].
> 
> [1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
> ---
>   drivers/greybus/svc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
> index 56d2b44d6fef..16cced80867a 100644
> --- a/drivers/greybus/svc.c
> +++ b/drivers/greybus/svc.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include <linux/debugfs.h>
> +#include <linux/kstrtox.h>
>   #include <linux/workqueue.h>
>   #include <linux/greybus.h>
>   
> @@ -83,7 +84,7 @@ static ssize_t watchdog_store(struct device *dev,
>   	int retval;
>   	bool user_request;
>   
> -	retval = strtobool(buf, &user_request);
> +	retval = kstrtobool(buf, &user_request);
>   	if (retval)
>   		return retval;
>   

