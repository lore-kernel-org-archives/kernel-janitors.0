Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26F8C4338F
	for <kernel-janitors@archiver.kernel.org>; Sun,  8 Aug 2021 23:56:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B04D360F92
	for <kernel-janitors@archiver.kernel.org>; Sun,  8 Aug 2021 23:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhHHX5G (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 8 Aug 2021 19:57:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:54220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229662AbhHHX5F (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 8 Aug 2021 19:57:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4068C60F42;
        Sun,  8 Aug 2021 23:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628467005;
        bh=BTc4DtYp5H2rXf9tQCGYzW//v9wT9ZrLk0Jk8h7+Sdo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=owPGImm1CC+yBVqAIvTZ58u5gOOBQH9bFiLIpZSOAH87GDkCFyvgz0J3RVrAiDbFS
         V67MgaFc91xx2e+AMcQ/yoUFAU4vPBlyaYIkweD/GF5ZaAFgW72V5sfJM4ac/DsNxP
         48q9jHUlseAVnVwrOJABhIMH3nCAtMsNurljUe2y9LI3/H1cW43Mb4rR0DKVlendl6
         WzxHB1G7ZA4KhnPavn50efw5vGhlj2NNTILIqbbXOFx04YJo/yFHYxKwqDSNFh/ZYF
         B0QEyszhp2JoZg9hjW7Z57fQ51uwL8D3/qYYpxwN/JcvgMyYCb/yfT4DnGFdDvVd6R
         4ysXgLg7ZmUpA==
Subject: Re: [PATCH -next] erofs: make symbol 'erofs_iomap_ops' static
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Gao Xiang <hsiangkao@linux.alibaba.com>
Cc:     Huang Jianan <huangjianan@oppo.com>, Gao Xiang <xiang@kernel.org>,
        linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210808063343.255817-1-weiyongjun1@huawei.com>
 <YQ/ZxZkNCtWGO6X4@B-P7TQMD6M-0146.local>
From:   Chao Yu <chao@kernel.org>
Message-ID: <4ddfb962-97fc-28b0-0006-197574a1ec00@kernel.org>
Date:   Mon, 9 Aug 2021 07:56:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQ/ZxZkNCtWGO6X4@B-P7TQMD6M-0146.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2021/8/8 21:19, Gao Xiang wrote:
> On Sun, Aug 08, 2021 at 06:33:43AM +0000, Wei Yongjun wrote:
>> The sparse tool complains as follows:
>>
>> fs/erofs/data.c:150:24: warning:
>>   symbol 'erofs_iomap_ops' was not declared. Should it be static?
>>
>> This symbol is not used outside of data.c, so marks it static.

Thanks for the patch, I guess it will be better to fix in original patch
if you don't mind.

Thanks,

>>
>> Fixes: 3e9ce908c114 ("erofs: iomap support for non-tailpacking DIO")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Thanks,
> Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
> 
> Thanks,
> Gao Xiang
> 
