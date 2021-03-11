Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC72C433E0
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 17:23:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5E4964FE2
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 17:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhCKRWb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Mar 2021 12:22:31 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:38401 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhCKRWR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Mar 2021 12:22:17 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lKP0p-00061H-P8; Thu, 11 Mar 2021 17:22:15 +0000
Subject: Re: [PATCH][next] nvmem: core: Fix unintentional sign extension issue
To:     Doug Anderson <dianders@chromium.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <20210311095316.6480-1-colin.king@canonical.com>
 <CAD=FV=V5+GvMpD1FdX0-TJ=BFyyvST+oLR08pO7jL+h38G8PCw@mail.gmail.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <a3ce5632-e06a-827e-7f60-e5a4b01301ad@canonical.com>
Date:   Thu, 11 Mar 2021 17:22:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=V5+GvMpD1FdX0-TJ=BFyyvST+oLR08pO7jL+h38G8PCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11/03/2021 17:12, Doug Anderson wrote:
> Hi,
> 
> On Thu, Mar 11, 2021 at 1:53 AM Colin King <colin.king@canonical.com> wrote:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The shifting of the u8 integer buf[3] by 24 bits to the left will
>> be promoted to a 32 bit signed int and then sign-extended to a
>> u64. In the event that the top bit of buf[3] is set then all
>> then all the upper 32 bits of the u64 end up as also being set
>> because of the sign-extension. Fix this by casting buf[i] to
>> a u64 before the shift.
>>
>> Addresses-Coverity: ("Unintended sign extension")
>> Fixes: 097eb1136ebb ("nvmem: core: Add functions to make number reading easy")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/nvmem/core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Thanks! I had only tested the "u64" version to read smaller data and
> store it in a u64. From my understanding of C rules, without your
> patch it would have been even worse than just a sign extension though,
> right? Shifting "buf[i]" by more than 32 bits would just not have
> worked right.

yep, that's correct, I forgot to mention that issue too :-/

> 
> In any case:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 

