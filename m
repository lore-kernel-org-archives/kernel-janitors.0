Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD26C433E3
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Mar 2021 16:12:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3438A61A12
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Mar 2021 16:12:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232944AbhCXQM1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 Mar 2021 12:12:27 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48748 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbhCXQMK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Mar 2021 12:12:10 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lP676-0006jy-Ok; Wed, 24 Mar 2021 16:12:08 +0000
Subject: Re: [PATCH][next] staging: rtl8188eu: Fix null pointer dereference on
 free_netdev call
To:     Martin Kaiser <martin@kaiser.cx>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210324152135.254152-1-colin.king@canonical.com>
 <20210324161107.m7gbexp4e7e5vf77@viti.kaiser.cx>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <028e75cd-6229-6004-84bb-ca751346420d@canonical.com>
Date:   Wed, 24 Mar 2021 16:12:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324161107.m7gbexp4e7e5vf77@viti.kaiser.cx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 24/03/2021 16:11, Martin Kaiser wrote:
> Hello Colin,
> 
> Thus wrote Colin King (colin.king@canonical.com):
> 
>> From: Colin Ian King <colin.king@canonical.com>
> 
>> An unregister_netdev call checks if pnetdev is null, hence a later
>> call to free_netdev can potentially be passing a null pointer, causing
>> a null pointer dereference. Avoid this by adding a null pointer check
>> on pnetdev before calling free_netdev.
> 
>> Fixes: 1665c8fdffbb ("staging: rtl8188eu: use netdev routines for private data")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/staging/rtl8188eu/os_dep/usb_intf.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
>> diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
>> index 518e9feb3f46..91a3d34a1050 100644
>> --- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
>> +++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
>> @@ -446,7 +446,8 @@ static void rtw_usb_if1_deinit(struct adapter *if1)
>>  	pr_debug("+r871xu_dev_remove, hw_init_completed=%d\n",
>>  		 if1->hw_init_completed);
>>  	rtw_free_drv_sw(if1);
>> -	free_netdev(pnetdev);
>> +	if (pnetdev)
>> +		free_netdev(pnetdev);
>>  }
> 
>>  static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device_id *pdid)
>> -- 
>> 2.30.2
> 
> you're right. I removed the NULL check that was part of rtw_free_netdev.
> Sorry for the mistake and thanks for your fix.

Thank static analysis :-)

> 
> Reviewed-by: Martin Kaiser <martin@kaiser.cx>
> 
> Best regards,
> Martin
> 

