Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE62C6FA82
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Sep 2022 11:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiIVL3P (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Sep 2022 07:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbiIVL3G (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Sep 2022 07:29:06 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDA3DF3A5
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Sep 2022 04:29:05 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYCcR29BGzlX1j;
        Thu, 22 Sep 2022 19:24:55 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 19:29:03 +0800
Message-ID: <37ccf7b7-22c7-dd45-ce4f-f855d95244f4@huawei.com>
Date:   Thu, 22 Sep 2022 19:29:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [cocci] [PATCH v2 1/2] coccinelle: locks: add
 missing_mutex_init.cocci script
To:     Julia Lawall <julia.lawall@inria.fr>,
        Markus Elfring <Markus.Elfring@web.de>
CC:     <cocci@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
        <kernel-janitors@vger.kernel.org>
References: <20220920025820.105924-1-yuancan@huawei.com>
 <0896e030-5060-08e7-d0de-c63d77c9ef27@web.de>
 <alpine.DEB.2.22.394.2209202211430.2740@hadrien>
From:   Yuan Can <yuancan@huawei.com>
In-Reply-To: <alpine.DEB.2.22.394.2209202211430.2740@hadrien>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


在 2022/9/21 4:13, Julia Lawall 写道:
>>> +mutex_init(\(&mm->fld\|&(mm->fld)\))
>>
>> An extra SmPL disjunction is probably unnecessary because of an isomorphism.
>> https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/3f7496ff9c2c5d4fadae1e585aa458e1a0037972/standard.iso#L382
>> https://github.com/coccinelle/coccinelle/blob/19ee1697bf152d37a78a20cefe148775bf4b0e0d/standard.iso#L382
> This is correct.  It would be better to only have the version with the
> parentheses, because Coccinelle will consider the case without parentheses
> anyway.
I see, I will former one in the next version.
>
>>
>> +mutex_init(&(mm->fld))
>>
>>
>>
>> …
>>
>>> +@r3@
>>> +identifier s, fld;
>>> +position p != {r2.p};
>>
>> Why do you think that such a SmPL constraint would be required?
>>
>>
>>> +@@
>>> +
>>> +struct s {
>>> +  ...
>>> +  struct mutex fld@p;
>>> +  ...
>>> +};
>>
>> Why would the source code search repetition matter here?
> He is searching for a structure that is different from the ones matched
> previously.
>
>>
>> …
>>
>>> +@r5 depends on r4@
>>> +identifier r3.s;
>>> +struct s *mm;
>>> +position p;
>>> +@@
>>> +* mm@p = \(kmalloc\|kzalloc\|devm_kmalloc\|devm_kzalloc\)(...)
>>
>> I would expect that the usage of the asterisk in the first column should belong
>> to the operation mode “context”.
> This is correct.  Either the context mode should be fully supported or the
> asterisk should be removed.

Ok, I do not mean to support context mode, the asterisk will be remove 
in the next version.

Thanks for your reply.

Best regards,

Yuan Can
