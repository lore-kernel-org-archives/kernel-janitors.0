Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC21C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 15:39:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6741661289
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 15:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbhFVPl3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 11:41:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57919 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbhFVPl3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 11:41:29 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lviUa-00032Y-4w; Tue, 22 Jun 2021 15:39:12 +0000
Subject: Re: [PATCH] mtd: mchp48l640: silence some uninitialized variable
 warnings
To:     Fabio Estevam <festevam@gmail.com>, Heiko Schocher <hs@denx.de>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        kernel-janitors@vger.kernel.org
References: <YMyir961W28TX5dT@mwanda>
 <67e49b8b-a80c-87a0-c5bb-8d5cf9239328@denx.de>
 <CAOMZO5DLxM5nU4HxLT2DzKvmG1Vv1LNSdUoB3m7iZ1mpgxBFxg@mail.gmail.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <aff4cbba-b8a4-445a-4290-7717355effc8@canonical.com>
Date:   Tue, 22 Jun 2021 16:39:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5DLxM5nU4HxLT2DzKvmG1Vv1LNSdUoB3m7iZ1mpgxBFxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 22/06/2021 16:31, Fabio Estevam wrote:
> On Sat, Jun 19, 2021 at 3:23 AM Heiko Schocher <hs@denx.de> wrote:
>>
>> Hello Dan,
>>
>> On 18.06.21 15:42, Dan Carpenter wrote:
>>> Smatch complains that zero length read/writes will lead to an
>>> uninitalized return value.  I don't know if that's possible, but
>>> it's nicer to return a zero literal anyway so let's do that.
>>>
>>> Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>> People, when we add a new driver can we make sure the first commit uses
>>> the new prefered subsystem prefix?  For example,
>>>
>>> "mtd: mchp48l640: add support for microchip 48l640 EERAM"
>>>       ^^^^^^^^^^
>>> Otherwise it's not clear to me what I should use as a patch prefix.
>>
>> Ok, sorry...
>>
>> Hmm... Colin already sent a fix for this, see:
>>
>> https://lists.infradead.org/pipermail/linux-mtd/2021-June/087140.html
> 
> Yes, both patches work, but I think Dan's solution is a bit clearer, so:
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> 
> Thanks
> 
Yep, I'm good with that.

