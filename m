Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351B6C43334
	for <kernel-janitors@archiver.kernel.org>; Wed, 29 Jun 2022 12:32:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiF2Mci (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 29 Jun 2022 08:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233249AbiF2Mcf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Jun 2022 08:32:35 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B38E73
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Jun 2022 05:32:34 -0700 (PDT)
Received: from canpemm500006.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LY16v2ZnTz9sv4;
        Wed, 29 Jun 2022 20:31:51 +0800 (CST)
Received: from [10.174.179.200] (10.174.179.200) by
 canpemm500006.china.huawei.com (7.192.105.130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 29 Jun 2022 20:32:31 +0800
Subject: Re: [cocci] [PATCH] scripts/coccinelle/free: add NULL test before
 dev_{put, hold} functions
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
From:   "Ziyang Xuan (William)" <william.xuanziyang@huawei.com>
Message-ID: <6b3eac2c-6e24-46e0-c548-dc87f666709b@huawei.com>
Date:   Wed, 29 Jun 2022 20:32:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <32da2d32-9554-de90-62ca-c4be456ad31a@web.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.179.200]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500006.china.huawei.com (7.192.105.130)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> I find the patch subject improvable.
> You would like to detect the remaining usage of redundant null pointer checks
> before selected function calls.
> Thus it would be nice if the corresponding description can become clearer
> another bit, wouldn't it?

Sorry, I did not get your mean. Did you mean I should point out the selected function?

And the following is one warning, what would be like as your suggestion?

./drivers/infiniband/core/lag.c:98:2-10: WARNING: NULL check before dev_{put, hold} functions is not needed.

>
>
>> Since commit b37a46683739 ("netdevice: add the case if dev is NULL"),
>> NULL check before dev_{put, hold} functions is not needed.
>>
>> Signed-off-by: Ziyang Xuan <william.xuanziyang@huawei.com>
>> ---
>>  scripts/coccinelle/free/ifnulldev_put.cocci | 54 +++++++++++++++++++++
>
> How do you think about to achieve further collateral evolution?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b37a466837393af72fe8bcb8f1436410f3f173f3
>
> Will it become feasible to combine any more source code analysis approaches?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/free/ifnullfree.cocci?id=8c23f235a6a8ae43abea215812eb9d8cf4dd165e#n2
>
>
>> +// Comments: -
>
> Can such a line be omitted?
>
It's ok.
>
>> +@r2 depends on patch@
>> +expression E;
>> +@@
>> +- if (E != NULL)
>> +(
>> +  __dev_put(E);
>> +|
>> +  dev_put(E);
>> +|
>> +  dev_put_track(E, ...);
>> +|
>> +  __dev_hold(E);
>> +|
>> +  dev_hold(E);
>> +|
>> +  dev_hold_track(E, ...);
>> +)
>
> Did you order the case distinctions in the SmPL disjunction according to
> the call frequencies of the mentioned function names?

No, no any special, just list the related functions.

>
> Otherwise, I imagine that another software design option can be considered for
> the application of nested disjunctions by the means of the semantic patch language.
>
> Code variant:
>
> @r2 depends on patch@
> expression E;
> @@
> -if (E != NULL)
> (
> (__dev_put
> |dev_put
> |__dev_hold
> |dev_hold
> )(E)
> |
> (dev_put_track
> |dev_hold_track
> )(E, ...)
> )
> ;
It's ok.
>
> Regards,
> Markus
>
> .
