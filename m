Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E163BC433DB
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 18:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A60564FDE
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 18:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhCKS5u (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Mar 2021 13:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhCKSzd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Mar 2021 13:55:33 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5501C061574
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 10:55:32 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id a7so23033133iok.12
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 10:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=stRVno9z/DCS0wZx7I98P8EWMS6yZuT8s6v7jBQ49hM=;
        b=BMoGUsO4GNIbTwMGxgFtKIi3ncJzrgl+1h85yF0gmLnayDHFLpLPkhRm6g3mxSD7xL
         +E6IVqxRiF49V91lnMdlLbzeDKbqvcmBoEz3F9tFSCrzgK0f7cd2Y6G/AU3DZqFcJ67M
         Q+73CxlhW5rv7fcbNMQhEHe2fvGcle/qvBlzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=stRVno9z/DCS0wZx7I98P8EWMS6yZuT8s6v7jBQ49hM=;
        b=Yj2qSRP43J2V/TMR9cRcC1adapZdNhtf5hCy7gchPXnGxDSPhruWUh2ZAD3DXg33ua
         BDaKXWO3sGJFO7jtl1sla3MR8X78bAjADaSrHpg8oaaIxf4Sv3Eg5Ypq5vvjZ6Pv4FFH
         rt2WICjtUKJBStT9mL4WX+9Ygy3yMwCRCuUl5PFp0dlNGD03X8qLIyzO22JZ0bmxPb4e
         XTr4+ze0Hs3ak9AvG05+uC6IEgOH6bfe2IkNpPYAt5wRUgyz2+HZG7U5GtGZZOS7DnoD
         BNXZD2JzIuVvm6sbXHd/staoF5oCZKBR70kMQ+RRl+/DMvch7d9yJXQKhVcdS+OFHQ6S
         g8CA==
X-Gm-Message-State: AOAM531Uto7NAMExv2JLqs41xA8c1EG4duOEe++D/wCvsUZrg92zpGEX
        AxURX5n7pqKTK4Hhphcjg+P5IA==
X-Google-Smtp-Source: ABdhPJw4udqsFDFZUWvVbNULF5TWf0ztq74YOCcgDSPWaVveOnaqhlFTiqS51B7eMoc+nsI6kywBog==
X-Received: by 2002:a6b:1415:: with SMTP id 21mr7585518iou.147.1615488932245;
        Thu, 11 Mar 2021 10:55:32 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id v4sm1691239ilo.26.2021.03.11.10.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 10:55:31 -0800 (PST)
Subject: Re: [PATCH][next] usbip: Fix incorrect double assignment to
 udc->ud.tcp_rx
To:     Colin King <colin.king@canonical.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210311104445.7811-1-colin.king@canonical.com>
 <8862cf33-dc2b-1d62-d7ef-56f34c5b358d@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <89eb8a32-8d43-cf0c-d460-9c25655141b4@linuxfoundation.org>
Date:   Thu, 11 Mar 2021 11:55:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8862cf33-dc2b-1d62-d7ef-56f34c5b358d@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/11/21 7:16 AM, Shuah Khan wrote:
> On 3/11/21 3:44 AM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently udc->ud.tcp_rx is being assigned twice, the second assignment
>> is incorrect, it should be to udc->ud.tcp_tx instead of rx. Fix this.
>>
>> Addresses-Coverity: ("Unused value")
>> Fixes: 46613c9dfa96 ("usbip: fix vudc usbip_sockfd_store races leading 
>> to gpf")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   drivers/usb/usbip/vudc_sysfs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/usbip/vudc_sysfs.c 
>> b/drivers/usb/usbip/vudc_sysfs.c
>> index a3ec39fc6177..7383a543c6d1 100644
>> --- a/drivers/usb/usbip/vudc_sysfs.c
>> +++ b/drivers/usb/usbip/vudc_sysfs.c
>> @@ -174,7 +174,7 @@ static ssize_t usbip_sockfd_store(struct device *dev,
>>           udc->ud.tcp_socket = socket;
>>           udc->ud.tcp_rx = tcp_rx;
>> -        udc->ud.tcp_rx = tcp_tx;
>> +        udc->ud.tcp_tx = tcp_tx;
>>           udc->ud.status = SDEV_ST_USED;
>>           spin_unlock_irq(&udc->ud.lock);
>>
> 
> Thank you for finding and fixing this. This is my bad.
> 
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> 

Applies to stables as well since the 46613c9dfa96 is marked for
stables.

thanks,
-- Shuah

