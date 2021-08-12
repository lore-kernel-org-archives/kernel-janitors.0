Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D323C4338F
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Aug 2021 13:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E6B361059
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Aug 2021 13:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237252AbhHLNdc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 12 Aug 2021 09:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234975AbhHLNdb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Aug 2021 09:33:31 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79600C061756
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Aug 2021 06:33:06 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id bd1so2855446oib.3
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Aug 2021 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZxRMsCrThJI9uuSdKdHUyxJFANz6CHyn6poCfErU9Q8=;
        b=dpnTVq1T+/zoFToqPGpFTyudjkaIpavz+343GvHSNJPOXWZASk0W85pJk+fFuhYyj2
         PzDLZ7xWaA5PojnM8fB/nl3aORZgsSjsaBQxVRf+0DpRtbVOI1rucUxhKxn+iIYMtqRj
         sSOdpUjXfKMrOb3cUtuJaMINSXCOi2dTrxRU+LP61pXxtvi4GrlD7+uB52d9hPTXvm9b
         9eLTvzFut3RF1/Hd9SxoTwdnknmZpQQNdkvr4wJ6N8K/ykxn93XilSJ6UIpUCfZTfFNp
         kKd11wHRcinl0VjmL2aKdkYE5FzR5jFSRVK9JnzM3rjE4wgm/ilFuGy7JFFCAxLyQKb9
         Ck8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZxRMsCrThJI9uuSdKdHUyxJFANz6CHyn6poCfErU9Q8=;
        b=S3tZ7DKuwX72bsZmNE6e5tmHuXqh4zzOe5HLN4xiS9llyYG+Y8bd96yozvXcwIF1u6
         KZPJpzVZS/2m/Ut1lS/ZlYQ4PqVXwzFyHttrg7n5oxlj6vtAgA5ZkwBaNrr/TDfFRtCu
         JjWdhKWABYnT3twyK6UKTfi/dl0cR0B7fImY5nsMm5FLOPKfBV9SfLQhRzbmntvSwbem
         GllG2gpbAs3JRlEp1ZL/7e8M6kJXpTgvhC79keuXS7k8ljwHkEws/kTVP4R+lDrkvoir
         zn4/fSCcEhVF+XT0foVoCctjzhapl/7+h8Bo69HUmxME8gy+iIVZr6ZyE8nAHt/fthxq
         lIKg==
X-Gm-Message-State: AOAM531otQWTuN9I2z2riHBYqOrwH1iA10vTvx7mZD0DOfCW8XKSi+zM
        xPscZ7Hehk1UFL19YxU39oP1MBnrKvo=
X-Google-Smtp-Source: ABdhPJyG2+8rbt5+K37T+kaVVmKFfcdxHxREw8jaiCQ9KIfpPHawX9u2z0TFnWRP9edIWUB1dZEg/Q==
X-Received: by 2002:aca:1014:: with SMTP id 20mr10474128oiq.70.1628775184517;
        Thu, 12 Aug 2021 06:33:04 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id 4sm618104otp.23.2021.08.12.06.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 06:33:02 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH] staging: r8188eu: scheduling in atomic in
 rtw_createbss_cmd()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Phillip Potter <phil@philpotter.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Straube <straube.linux@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <20210812065852.GB31863@kili>
From:   Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <27c01d9d-1322-3168-227b-106444634eea@lwfinger.net>
Date:   Thu, 12 Aug 2021 08:33:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812065852.GB31863@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 8/12/21 1:58 AM, Dan Carpenter wrote:
> A couple of the callers are holding spinlocks so this allocation has to
> be atomic.  One spinlock is in rtw_set_802_11_connect() but the simpler
> spinlock to review is when this function is called from
> rtw_surveydone_event_callback().
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index c3a9051ca10c..ff5b4505a713 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -735,7 +735,7 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
>   
>   	rtw_led_control(padapter, LED_CTL_START_TO_LINK);
>   
> -	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
> +	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
>   	if (!pcmd) {
>   		res = _FAIL;
>   		goto exit;
> 
Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry

