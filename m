Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA07C433E6
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CCEF64E56
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355220AbhCDAVS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:21:18 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:58334 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240329AbhCCK1x (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 05:27:53 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lHOij-000445-Ev; Wed, 03 Mar 2021 10:27:09 +0000
Subject: Re: [PATCH][next] mtd: nand: Fix error handling in nand_prog_page_op
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210303094246.5724-1-colin.king@canonical.com>
 <20210303104651.2d49fb2c@xps13>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <e7893539-9510-e149-f02b-f88c33f8175b@canonical.com>
Date:   Wed, 3 Mar 2021 10:27:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303104651.2d49fb2c@xps13>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 03/03/2021 09:46, Miquel Raynal wrote:
> Hi Colin,
> 
> Colin King <colin.king@canonical.com> wrote on Wed,  3 Mar 2021
> 09:42:46 +0000:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The less than zero comparison with status is always false because status
>> is a u8. Fix this by using ret as the return check for the call to
>> chip->legacy.waitfunc() and checking on this and assigning status to ret
>> if it is OK.
>>
>> Addresses-Coverity: ("Unsigned compared against 0")
>> Fixes: 52f67def97f1 ("mtd: nand: fix error handling in nand_prog_page_op() #1")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks for the fix, but this has been handled just an hour ago :)

Ah, missed that. Glad to know it's fixed.

> 
> Cheers,
> Miquèl
> 

