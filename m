Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79EBC433DB
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Mar 2021 15:48:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD32F65295
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Mar 2021 15:48:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhCIPsG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 9 Mar 2021 10:48:06 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:13897 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhCIPrv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 Mar 2021 10:47:51 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Dw01S1LbhzkWMV;
        Tue,  9 Mar 2021 23:46:20 +0800 (CST)
Received: from [10.174.178.48] (10.174.178.48) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Tue, 9 Mar 2021
 23:47:39 +0800
Subject: Re: [PATCH -next] usb: cdns3: imx: mark cdns_imx_resume as
 __maybe_unused
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Frank Li <frank.li@nxp.com>
CC:     <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
References: <20210309131457.1884112-1-weiyongjun1@huawei.com>
 <03c23018-f26d-0aa2-e319-efb2683d633d@gmail.com>
From:   "weiyongjun (A)" <weiyongjun1@huawei.com>
Message-ID: <ba1cb867-29b4-33de-8b92-cbaf94bd4f69@huawei.com>
Date:   Tue, 9 Mar 2021 23:47:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <03c23018-f26d-0aa2-e319-efb2683d633d@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.48]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


> Hello!
>
> On 3/9/21 4:14 PM, 'Wei Yongjun wrote:
>
>> From: Wei Yongjun <weiyongjun1@huawei.com>
>>
>> The function cdns_imx_resume() may have no callers depending
>> on configuration, so it must be marked __maybe_unused to avoid
>> harmless warning:
>>
>> drivers/usb/cdns3/cdns3-imx.c:378:12: warning:
>>   'cdns_imx_system_resume' defined but not used [-Wunused-function]
>>    378 | static int cdns_imx_system_resume(struct device *dev)
>>        |            ^~~~~~~~~~~~~~~~~~
>     Looks like that warning was copied from another kernel, where this function
> was named differently?


Sorry, it seems I post the wrong patch. I will send v2. Thanks.


