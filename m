Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B4DC433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 07:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2916461221
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 07:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236749AbhDLHAe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Apr 2021 03:00:34 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:16897 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhDLHAd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Apr 2021 03:00:33 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FJfhZ5RnHzjYsk;
        Mon, 12 Apr 2021 14:58:22 +0800 (CST)
Received: from [10.174.176.255] (10.174.176.255) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Mon, 12 Apr 2021 15:00:03 +0800
Subject: Re: [PATCH -next v2] usbip: vudc: fix missing unlock on error in
 usbip_sockfd_store()
To:     Greg KH <gregkh@linuxfoundation.org>
References: <20210408112305.1022247-1-yebin10@huawei.com>
 <YHBe9m7wGqlZ2cp+@kroah.com>
CC:     <valentina.manea.m@gmail.com>, <shuah@kernel.org>,
        <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <hulkci@huawei.com>
From:   yebin <yebin10@huawei.com>
Message-ID: <6073EFF3.90506@huawei.com>
Date:   Mon, 12 Apr 2021 15:00:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <YHBe9m7wGqlZ2cp+@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.255]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Sorry. I build kernel  image  with  follow config and  commit  base on 
linux-next:
commit：e99d8a849517
config:  make allmodconfig
I can build kernel image without errors. So, what build error did you 
encounter?

On 2021/4/9 22:04, Greg KH wrote:
> On Thu, Apr 08, 2021 at 07:23:05PM +0800, Ye Bin wrote:
>> Add the missing unlock before return from function usbip_sockfd_store()
>> in the error handling case.
>>
>> Fixes: bd8b82042269 ("usbip: vudc synchronize sysfs code paths")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Ye Bin <yebin10@huawei.com>
>> ---
>>   drivers/usb/usbip/vudc_sysfs.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
>> index f7633ee655a1..d1cf6b51bf85 100644
>> --- a/drivers/usb/usbip/vudc_sysfs.c
>> +++ b/drivers/usb/usbip/vudc_sysfs.c
>> @@ -156,12 +156,14 @@ static ssize_t usbip_sockfd_store(struct device *dev,
>>   		tcp_rx = kthread_create(&v_rx_loop, &udc->ud, "vudc_rx");
>>   		if (IS_ERR(tcp_rx)) {
>>   			sockfd_put(socket);
>> +			mutex_unlock(&udc->ud.sysfs_lock);
>>   			return -EINVAL;
>>   		}
>>   		tcp_tx = kthread_create(&v_tx_loop, &udc->ud, "vudc_tx");
>>   		if (IS_ERR(tcp_tx)) {
>>   			kthread_stop(tcp_rx);
>>   			sockfd_put(socket);
>> +			mutex_unlock(&udc->ud.sysfs_lock);
>>   			return -EINVAL;
>>   		}
>>   
>> -- 
>> 2.25.4
>>
> This breaks the build, are you sure you tested it???
>
> .
>

