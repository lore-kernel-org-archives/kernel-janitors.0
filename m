Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4583AC54EE9
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Sep 2022 11:22:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbiIVLWd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Sep 2022 07:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbiIVLWb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Sep 2022 07:22:31 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2AEE05D4
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Sep 2022 04:22:30 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYCSr2YVSzlWTn;
        Thu, 22 Sep 2022 19:18:20 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 19:22:28 +0800
Message-ID: <1a6f854f-cf97-3f69-a897-cf92328de986@huawei.com>
Date:   Thu, 22 Sep 2022 19:22:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [cocci] [v2 1/2] coccinelle: locks: add missing_mutex_init.cocci
 script
To:     Markus Elfring <Markus.Elfring@web.de>,
        Julia Lawall <julia.lawall@inria.fr>
CC:     <cocci@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
        <kernel-janitors@vger.kernel.org>
References: <20220920025820.105924-1-yuancan@huawei.com>
 <0896e030-5060-08e7-d0de-c63d77c9ef27@web.de>
 <alpine.DEB.2.22.394.2209202211430.2740@hadrien>
 <92f6a7e6-cfbb-ee05-bbdd-dfa4c9abad4f@web.de>
From:   Yuan Can <yuancan@huawei.com>
In-Reply-To: <92f6a7e6-cfbb-ee05-bbdd-dfa4c9abad4f@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


在 2022/9/21 4:24, Markus Elfring 写道:
>>>> +@r3@
>>>> +identifier s, fld;
>>>> +position p != {r2.p};
>>> Why do you think that such a SmPL constraint would be required?
>>>
>>>
>>>> +@@
>>>> +
>>>> +struct s {
>>>> +  ...
>>>> +  struct mutex fld@p;
>>>> +  ...
>>>> +};
>>> Why would the source code search repetition matter here?
>> He is searching for a structure that is different from the ones matched previously.
> How many mutexes (or spin locks) should be initialised before further data
> processing can be safely performed with corresponding structures?

In my opinion, every mutexes and spin locks needs to be initialised 
before use.

Best regards,
Yuan Can

