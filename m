Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C61EC433ED
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 May 2021 13:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0B2C61438
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 May 2021 13:24:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbhEMNZL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 13 May 2021 09:25:11 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2307 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbhEMNYE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 May 2021 09:24:04 -0400
Received: from dggeml702-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fgsfz12jwz19P14;
        Thu, 13 May 2021 21:18:35 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggeml702-chm.china.huawei.com (10.3.17.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 13 May 2021 21:22:51 +0800
Received: from [10.67.108.157] (10.67.108.157) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 13 May 2021 21:22:51 +0800
Subject: Re: [PATCH -next] drivers/base/node.c: make CACHE_ATTR define static
 DEVICE_ATTR_RO
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Wang Weiyang <wangweiyang2@huawei.com>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20210513110716.25791-1-gongruiqi1@huawei.com>
 <YJ0M5HcXIQQFOTEq@kroah.com>
From:   Gong Ruiqi <gongruiqi1@huawei.com>
Message-ID: <017d9fae-328f-e93f-095e-bdfa0cc2f2ff@huawei.com>
Date:   Thu, 13 May 2021 21:22:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YJ0M5HcXIQQFOTEq@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.108.157]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 2021/05/13 19:26, Greg Kroah-Hartman wrote:
> On Thu, May 13, 2021 at 07:07:16PM +0800, Ruiqi Gong wrote:
>> The Sparse tool reports as follows:
>>
>> drivers/base/node.c:239:1: warning:
>>   symbol 'dev_attr_line_size' was not declared. Should it be static?
>> drivers/base/node.c:240:1: warning:
>>   symbol 'dev_attr_indexing' was not declared. Should it be static?
>>
>> These symbols (and several others) are defined by DEVICE_ATTR_RO(name) in
>> CACHE_ATTR(name, fmt), and all of them are not used outside of node.c. So let's
>> mark DEVICE_ATTR_RO(name) static to solve these complains from Sparse.
> 
> Why not fix them all at once?  Why only one here?

Sorry for not making it clear enough. Actually the patch does fix them 
all. Those symbols reported by Sparse are generated when two of the 
following macros are expanded:

     CACHE_ATTR(size, "%llu")
     CACHE_ATTR(line_size, "%u")
     CACHE_ATTR(indexing, "%u")
     CACHE_ATTR(write_policy, "%u")

So one fix of the CACHE_ATTR's definition fixs them all.

> 
> thanks,
> 
> greg k-h
> .
> 

.
