Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE6FC433B4
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 May 2021 13:51:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21A44613E6
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 May 2021 13:51:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbhEKNwn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 May 2021 09:52:43 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2445 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbhEKNwn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 May 2021 09:52:43 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FffQv2LYjzCrLC;
        Tue, 11 May 2021 21:48:55 +0800 (CST)
Received: from [10.174.177.91] (10.174.177.91) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 21:51:33 +0800
Subject: Re: [PATCH -next] EDAC: ti: Add missing MODULE_DEVICE_TABLE
To:     Borislav Petkov <bp@alien8.de>
CC:     Tero Kristo <kristo@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>, <linux-edac@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20210508031506.53687-1-cuibixuan@huawei.com>
 <YJprIzhI9UF5wVQp@zn.tnic>
From:   Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <3dbb6474-7e9a-3b84-9fc4-58bf80614e44@huawei.com>
Date:   Tue, 11 May 2021 21:51:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <YJprIzhI9UF5wVQp@zn.tnic>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 2021/5/11 19:31, Borislav Petkov wrote:
> On Sat, May 08, 2021 at 11:15:06AM +0800, Bixuan Cui wrote:
>> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> 
> Avoid having "This patch" or "This commit" in the commit message. It is
> tautologically useless.
> 
> Also, do
> 
> $ git grep 'This patch' Documentation/process
> 
> for more details.
> 
>> correct modalias for automatic loading of this driver when it is built
>> as an external module.
> 
> "external" or simply a module?
I will modify the commit message, thanks.

Bixuan Cui
> 
