Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439B3C433B4
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Apr 2021 09:39:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0620561154
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Apr 2021 09:39:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhDHJj3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Apr 2021 05:39:29 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15181 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbhDHJj3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Apr 2021 05:39:29 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGGNt258JzpWFW;
        Thu,  8 Apr 2021 17:36:30 +0800 (CST)
Received: from [10.174.179.96] (10.174.179.96) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 17:39:06 +0800
Subject: Re: [PATCH -next] usbip: vudc: fix missing unlock on error in
 usbip_sockfd_store()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Ye Bin <yebin10@huawei.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, <linux-usb@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
References: <20210408085033.909377-1-yebin10@huawei.com>
 <bf976317-2bf5-d019-bf7b-4a4ead0b1c94@huawei.com>
 <YG7KhTDZyR8U0yNY@kroah.com>
From:   YueHaibing <yuehaibing@huawei.com>
Message-ID: <d555fd00-9c4f-1ddb-4fb7-b4d015b6fe3a@huawei.com>
Date:   Thu, 8 Apr 2021 17:39:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YG7KhTDZyR8U0yNY@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.96]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2021/4/8 17:19, Greg Kroah-Hartman wrote:
> On Thu, Apr 08, 2021 at 04:57:11PM +0800, YueHaibing wrote:
>>
>> 这种bugfix最好加下Fixes tag
> 
> I am sorry but I can not parse that :(

Sorry, I just suggest to add this Fixes tag

Fixes: bd8b82042269 ("usbip: vudc synchronize sysfs code paths")

> .
> 
