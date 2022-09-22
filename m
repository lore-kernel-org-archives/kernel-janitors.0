Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE21C6FA82
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Sep 2022 11:35:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbiIVLfn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Sep 2022 07:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbiIVLfl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Sep 2022 07:35:41 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1838A7C4
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Sep 2022 04:35:39 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYCm03VrlzlXJt;
        Thu, 22 Sep 2022 19:31:28 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 19:35:36 +0800
Message-ID: <0a20c72b-5a8d-08cc-7f34-79e10fd1b9ca@huawei.com>
Date:   Thu, 22 Sep 2022 19:35:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [cocci] [PATCH v2 1/2] coccinelle: locks: add
 missing_mutex_init.cocci script
To:     Markus Elfring <Markus.Elfring@web.de>, <cocci@inria.fr>
CC:     Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        <kernel-janitors@vger.kernel.org>
References: <20220920025820.105924-1-yuancan@huawei.com>
 <0896e030-5060-08e7-d0de-c63d77c9ef27@web.de>
From:   Yuan Can <yuancan@huawei.com>
In-Reply-To: <0896e030-5060-08e7-d0de-c63d77c9ef27@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


在 2022/9/21 3:21, Markus Elfring 写道:
>> Find mutex inside struct which is possibly used without init,
>> provide the name of the struct and of the mutex, the position
>> where the struct is malloced and where the mutex get locked.
>
> I find this commit message variant also improvable.
>
> Will terms like “data structure” and “initialisation” become relevant?
>
>
> I would appreciate answers to my previous questions.
> https://lore.kernel.org/cocci/fb101290-3ec7-9170-9fec-43e1b5f54c52@web.de/
> https://sympa.inria.fr/sympa/arc/cocci/2022-09/msg00022.html
>
>
> I would expect a cover letter for patch series.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.0-rc6#n321
Thanks for the advice, I will send with cover letter in the next version.
>
>
>
> …
>
>> +++ b/scripts/coccinelle/locks/missing_mutex_init.cocci
> …
>
>> +// Comments:
>
> Why do you suggest the addition of an empty comment field?
>
>
>
>> +mutex_init(\(&mm->fld\|&(mm->fld)\))
>
> An extra SmPL disjunction is probably unnecessary because of an isomorphism.
> https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/3f7496ff9c2c5d4fadae1e585aa458e1a0037972/standard.iso#L382
> https://github.com/coccinelle/coccinelle/blob/19ee1697bf152d37a78a20cefe148775bf4b0e0d/standard.iso#L382
>
>
> +mutex_init(&(mm->fld))
Thanks for pointing out this, I will remove the former one in the next 
version.
>
>
>
> …
>
>> +@r3@
>> +identifier s, fld;
>> +position p != {r2.p};
>
> Why do you think that such a SmPL constraint would be required?
>
>
>> +@@
>> +
>> +struct s {
>> +  ...
>> +  struct mutex fld@p;
>> +  ...
>> +};
>
> Why would the source code search repetition matter here?
>
>
>
> …
>
>> +@r5 depends on r4@
>> +identifier r3.s;
>> +struct s *mm;
>> +position p;
>> +@@
>> +* mm@p = \(kmalloc\|kzalloc\|devm_kmalloc\|devm_kzalloc\)(...)
>
> I would expect that the usage of the asterisk in the first column should belong
> to the operation mode “context”.
>
> Will it become relevant to detect any more memory allocation function calls?

I do not mean to support context mode, I will remove it in the next version.

Thanks for you review!

Best regards,

Yuan Can

