Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C862C77B7C
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 May 2023 08:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbjEEIzu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 May 2023 04:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjEEIzs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 May 2023 04:55:48 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C5016340
        for <kernel-janitors@vger.kernel.org>; Fri,  5 May 2023 01:55:47 -0700 (PDT)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QCPYH1H1CzTkKq;
        Fri,  5 May 2023 16:51:15 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 16:55:45 +0800
Message-ID: <14c59fcf-1ee2-7c02-b236-b649ce43987d@huawei.com>
Date:   Fri, 5 May 2023 16:55:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [bug report] irqchip/mbigen: move to use bus_get_dev_root()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     <gregkh@linuxfoundation.org>, Ming Lei <ming.lei@canonical.com>,
        <kernel-janitors@vger.kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>
References: <adb006bb-1352-4e9d-a763-66c0ac778201@kili.mountain>
 <5154e620-7638-8bdd-a261-83ee7d5adfe5@huawei.com>
 <08ee85b9-67cd-485a-9f1d-61d92aad6204@kili.mountain>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <08ee85b9-67cd-485a-9f1d-61d92aad6204@kili.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 2023/5/4 22:46, Dan Carpenter wrote:
> On Thu, May 04, 2023 at 07:56:07PM +0800, Kefeng Wang wrote:
>>
>>
>> On 2023/5/4 15:34, Dan Carpenter wrote:
>>> Hello Greg Kroah-Hartman,
>>>
>>> The patch fea087fc291b: "irqchip/mbigen: move to use
>>> bus_get_dev_root()" from Mar 13, 2023, leads to the following Smatch
>>> static checker warning:
>>>
>>> 	drivers/irqchip/irq-mbigen.c:258 mbigen_of_create_domain()
>>> 	error: potentially dereferencing uninitialized 'child'.
>>>
>>> drivers/irqchip/irq-mbigen.c
>>>       235 static int mbigen_of_create_domain(struct platform_device *pdev,
>>>       236                                    struct mbigen_device *mgn_chip)
>>>       237 {
>>>       238         struct device *parent;
>>>       239         struct platform_device *child;
>>>       240         struct irq_domain *domain;
>>>       241         struct device_node *np;
>>>       242         u32 num_pins;
>>>       243
>>>       244         for_each_child_of_node(pdev->dev.of_node, np) {
>>>       245                 if (!of_property_read_bool(np, "interrupt-controller"))
>>>       246                         continue;
>>>       247
>>>       248                 parent = bus_get_dev_root(&platform_bus_type);
>>>       249                 if (parent) {
>>>
>>> Smatch is concerned that "parent" can be NULL.  Probably unlikely in
>>> real life.
>>
>> How about move bus_get_dev_root() out of the loop.
>>
> 
> Sounds good to me, but I don't know this code at all.
Post a patch[1], let's wait for review, and could you help to test it,
man thanks.

[1] 
https://lore.kernel.org/all/20230505090654.12793-1-wangkefeng.wang@huawei.com/
> 
> regards,
> dan carpenter
> 
