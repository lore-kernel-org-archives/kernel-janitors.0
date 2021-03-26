Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAC0C433C1
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 08:19:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1BB461A48
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 08:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhCZISx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Mar 2021 04:18:53 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:15317 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbhCZISt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 04:18:49 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F6FDq6hbkz9tm1;
        Fri, 26 Mar 2021 16:16:43 +0800 (CST)
Received: from [10.174.177.149] (10.174.177.149) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 16:18:38 +0800
Subject: Re: [PATCH -next] mm/page_alloc: remove duplicated include from
 page_alloc.c
To:     Matthew Wilcox <willy@infradead.org>
CC:     Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
References: <20210326025542.3565329-1-miaoqinglang@huawei.com>
 <20210326034208.GC1719932@casper.infradead.org>
From:   Qinglang Miao <miaoqinglang@huawei.com>
Message-ID: <d3a42312-397d-e7e7-0aa8-819a7b3731db@huawei.com>
Date:   Fri, 26 Mar 2021 16:18:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210326034208.GC1719932@casper.infradead.org>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.149]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hey, Matthew

Thanks for your advice towards hulk robot. We'd like to improve the 
capbility of hulk robot whole the time.

This patch is just a small cleanup reported by hulk robot, But the robot 
can do more than this. For example, it finds crucial and useful bugs as 
well.

As for 'Untangle the mass of header includes' you mentioned, could you 
please offer more details? Because I didn't find pagemap.h in 
net/ipv4/tcp.c in -next like what you said.


ÔÚ 2021/3/26 11:42, Matthew Wilcox Ð´µÀ:
> On Fri, Mar 26, 2021 at 10:55:42AM +0800, Qinglang Miao wrote:
>> Remove duplicated include.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> 
> can't you make hulk robot do something useful, like untangle the
> mass of header includes?  For example, in -next, net/ipv4/tcp.c
> has a dependency on pagemap.h.  Why?
> .
> 
