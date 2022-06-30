Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26821C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 30 Jun 2022 02:22:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbiF3CW2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 29 Jun 2022 22:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiF3CW1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Jun 2022 22:22:27 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A0436B61
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Jun 2022 19:22:26 -0700 (PDT)
Received: from canpemm500006.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LYMVb0wMhzhYws;
        Thu, 30 Jun 2022 10:20:07 +0800 (CST)
Received: from [10.174.179.200] (10.174.179.200) by
 canpemm500006.china.huawei.com (7.192.105.130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 30 Jun 2022 10:22:24 +0800
Subject: Re: [cocci] scripts/coccinelle/free: add NULL test before dev_{put,
 hold} functions
To:     Markus Elfring <Markus.Elfring@web.de>, <cocci@inria.fr>,
        <kernel-janitors@vger.kernel.org>
CC:     Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Fabian Frederick <fabf@skynet.be>,
        Yajun Deng <yajun.deng@linux.dev>,
        "David S. Miller" <davem@davemloft.net>,
        Phil Edworthy <phil.edworthy@renesas.com>
References: <20220616013253.520310-1-william.xuanziyang@huawei.com>
 <32da2d32-9554-de90-62ca-c4be456ad31a@web.de>
 <6b3eac2c-6e24-46e0-c548-dc87f666709b@huawei.com>
 <0e3d2713-ab8a-2ce5-5423-a72ba36ac1ff@web.de>
From:   "Ziyang Xuan (William)" <william.xuanziyang@huawei.com>
Message-ID: <224eeed0-5429-6dc3-7fe7-e4ff820ccb27@huawei.com>
Date:   Thu, 30 Jun 2022 10:22:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0e3d2713-ab8a-2ce5-5423-a72ba36ac1ff@web.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.179.200]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500006.china.huawei.com (7.192.105.130)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

>>> I find the patch subject improvable.
>>> You would like to detect the remaining usage of redundant null pointer checks
>>> before selected function calls.
>>> Thus it would be nice if the corresponding description can become clearer
>>> another bit, wouldn't it?
>> Sorry, I did not get your mean.
>
> How do you think about a wording like the following?
>
> Commit subject:
> [PATCH] coccinelle: Add detection for redundant null pointer checks before dev_{put,hold} function calls
>
> Commit description:
> The information “Add the case if dev is NULL in dev_{put, hold},
> so the caller doesn't need to care whether dev is NULL or not.”
> was provided by the commit b37a466837393af72fe8bcb8f1436410f3f173f3
> ("netdevice: add the case if dev is NULL").
> Thus extend source code analyses and corresponding transformations
> by the means of the semantic patch language so that null pointer checks
> which became unnecessary at other places because of the mentioned input
> parameter validation.

Patch title looks like better. And I think the main destination of the description is

to tell others what you want to do. If it can, I think it's OK. After all, everyone's style

is different. But I will refer to your suggestions. Thank you!

>
>>> Did you order the case distinctions in the SmPL disjunction according to
>>> the call frequencies of the mentioned function names?
>> No, no any special, just list the related functions.
> Will this view influence the selection which SmPL code variant
> will be preferred finally?
>
>
> Do you get further software development ideas from a data processing approach
> which I published before?
> https://build.opensuse.org/package/show/home:elfring:semantic_patching:Deletion_of_checks_before_specific_function_calls/Deletion_of_checks_before_specific_function_calls_in_Linux_source_files

Sorry, I didn't learn about these. I learn about coccinelle recently by coccinelle scripts in Linux

kernel and coccinelle official website. Now I get more resources. Thank you!


I will give the v2 patch with your suggestions. Thank you!

> Regards,
> Markus
> .
