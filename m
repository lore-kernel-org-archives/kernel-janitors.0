Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5292C433DB
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 14:17:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E71D64FB3
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 14:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbhCKOQ6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Mar 2021 09:16:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233563AbhCKOQg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Mar 2021 09:16:36 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DF2C061760
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 06:16:35 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id a7so22010939iok.12
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 06:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ei63gaWMLxEmNqdA5R8TWOwXizZ14K3nYqemAOmaLh0=;
        b=BM20wCWVV1daEhIL7RR4tpSwAlnVVR0qilSyirp5e9d5AeGSONNUbOezG5g0sIl8N0
         iKzmbfU7PYqFcVzmCPhyt34d/rn718kYBejBQEiEw+7Bhg4o/0zoWKFgeKs/T5SCDhz/
         Y+CA+JkDYVgEckMgjA7ipLpf7vPQfokqtnX3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ei63gaWMLxEmNqdA5R8TWOwXizZ14K3nYqemAOmaLh0=;
        b=iCto9xXv7V8MNhGZZGqaWkv4egvDczYFvssU9mHq+tCW7SbcRp/UmN0hZQ2ax3rhlD
         UglXA7qAQiyGXCJazHN1w46SFBAWPw2JfUxEHVuxW/EjQiXmy74ODnFK7vbE9EdJP42Z
         AvvFdBalqTG/cG41aXClQWmbtL0kOegKK54sraXfgHTmF3aT4B3iV6cMGPtAbFPeB3cD
         oHMc4/F3RZQtImOb8k+1YnFWnL7A42iqNJSUtlu0ZWHqWHyz0dAcbxKzEUSnkSXmGpAm
         SwKwWVkmc46NySssouBeN+QSeKQvSGURJzNhkSD+PwZ5IT3AYY0+JY2OduTeq9/g3kT2
         eBSA==
X-Gm-Message-State: AOAM531KwJA8yxrDPcHBm/waFcyschmD4N26QHNB54LzL2gsqhX2lvaP
        Dt43phb7jPzZqXmEYZUQhoNb0qwMZqU55g==
X-Google-Smtp-Source: ABdhPJznZ+AHNcMJKPGfmI7E72r9ApIrvzDEbLZiFeHTaRZVBzc1h30T1+1JSTqagBoZh3uacL86SA==
X-Received: by 2002:a02:cc1b:: with SMTP id n27mr3811358jap.106.1615472195170;
        Thu, 11 Mar 2021 06:16:35 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id x6sm1429790ioh.19.2021.03.11.06.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 06:16:34 -0800 (PST)
Subject: Re: [PATCH][next] usbip: Fix incorrect double assignment to
 udc->ud.tcp_rx
To:     Colin King <colin.king@canonical.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210311104445.7811-1-colin.king@canonical.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <8862cf33-dc2b-1d62-d7ef-56f34c5b358d@linuxfoundation.org>
Date:   Thu, 11 Mar 2021 07:16:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311104445.7811-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/11/21 3:44 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently udc->ud.tcp_rx is being assigned twice, the second assignment
> is incorrect, it should be to udc->ud.tcp_tx instead of rx. Fix this.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 46613c9dfa96 ("usbip: fix vudc usbip_sockfd_store races leading to gpf")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/usb/usbip/vudc_sysfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
> index a3ec39fc6177..7383a543c6d1 100644
> --- a/drivers/usb/usbip/vudc_sysfs.c
> +++ b/drivers/usb/usbip/vudc_sysfs.c
> @@ -174,7 +174,7 @@ static ssize_t usbip_sockfd_store(struct device *dev,
>   
>   		udc->ud.tcp_socket = socket;
>   		udc->ud.tcp_rx = tcp_rx;
> -		udc->ud.tcp_rx = tcp_tx;
> +		udc->ud.tcp_tx = tcp_tx;
>   		udc->ud.status = SDEV_ST_USED;
>   
>   		spin_unlock_irq(&udc->ud.lock);
> 

Thank you for finding and fixing this. This is my bad.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


