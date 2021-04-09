Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD0CC43461
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 06:52:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5587F61178
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 06:52:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233495AbhDIGwU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Apr 2021 02:52:20 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:16496 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233335AbhDIGwT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 02:52:19 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGpcj16dFzPpGG;
        Fri,  9 Apr 2021 14:48:37 +0800 (CST)
Received: from [10.67.100.236] (10.67.100.236) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Fri, 9 Apr 2021 14:51:21 +0800
Subject: Re: [PATCH -next] ARM: spear: Fix build error with
 CONFIG_ARCH_SPEAR3XX
To:     Viresh Kumar <viresh.kumar@linaro.org>
CC:     Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20210409015515.258653-1-chenlifu@huawei.com>
 <20210409040315.vc55eogaxs4zu4xb@vireshk-i7>
From:   chenlifu <chenlifu@huawei.com>
Message-ID: <f4285a1b-9da5-d86b-95ec-cc8513936cde@huawei.com>
Date:   Fri, 9 Apr 2021 14:51:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210409040315.vc55eogaxs4zu4xb@vireshk-i7>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.100.236]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


ÔÚ 2021/4/9 12:03, Viresh Kumar Ð´µÀ:
> On 09-04-21, 09:55, Chen Lifu wrote:
>> commit 77f983a9df42 ("spi: pl022: Use GPIOs looked up by the core")
>> deleted 'struct pl022_ssp_controller' member 'num_chipselect'.
>> We get build error when CONFIG_ARCH_SPEAR3XX is set:
>> arch/arm/mach-spear/spear3xx.c:42:3: error: 'struct pl022_ssp_controller' has no member named 'num_chipselect'
>>     42 |  .num_chipselect = 2,
>>        |   ^~~~~~~~~~~~~~
>> arch/arm/mach-spear/spear3xx.c:42:20: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>     42 |  .num_chipselect = 2,
>>        |                    ^
>>
>> Fix the issue by deleting the initialization of 'num_chipselect'
>> in spear3xx.c.
>>
>> Fixes: 77f983a9df42 ("spi: pl022: Use GPIOs looked up by the core")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Chen Lifu <chenlifu@huawei.com>
>> ---
>>   arch/arm/mach-spear/spear3xx.c | 10 ----------
>>   1 file changed, 10 deletions(-)
>>
>> diff --git a/arch/arm/mach-spear/spear3xx.c b/arch/arm/mach-spear/spear3xx.c
>> index 8537fcffe5a8..f83321d5e353 100644
>> --- a/arch/arm/mach-spear/spear3xx.c
>> +++ b/arch/arm/mach-spear/spear3xx.c
>> @@ -30,16 +30,6 @@ struct pl022_ssp_controller pl022_plat_data = {
>>   	.dma_filter = pl08x_filter_id,
>>   	.dma_tx_param = "ssp0_tx",
>>   	.dma_rx_param = "ssp0_rx",
>> -	/*
>> -	 * This is number of spi devices that can be connected to spi. There are
>> -	 * two type of chipselects on which slave devices can work. One is chip
>> -	 * select provided by spi masters other is controlled through external
>> -	 * gpio's. We can't use chipselect provided from spi master (because as
>> -	 * soon as FIFO becomes empty, CS is disabled and transfer ends). So
>> -	 * this number now depends on number of gpios available for spi. each
>> -	 * slave on each master requires a separate gpio pin.
>> -	 */
>> -	.num_chipselect = 2,
>>   };
> 
> A patch is already applied by Mark to fix this issue.
> 

Thanks.

---
Chen Lifu
