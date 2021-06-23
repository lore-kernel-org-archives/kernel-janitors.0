Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08BDC4743C
	for <kernel-janitors@archiver.kernel.org>; Wed, 23 Jun 2021 03:22:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC38B61001
	for <kernel-janitors@archiver.kernel.org>; Wed, 23 Jun 2021 03:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhFWDYw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 23:24:52 -0400
Received: from phobos.denx.de ([85.214.62.61]:41288 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230130AbhFWDYw (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 23:24:52 -0400
Received: from [192.168.1.107] (unknown [81.0.122.178])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hs@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3F9F280C94;
        Wed, 23 Jun 2021 05:22:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1624418554;
        bh=S9lwjloj2NwiOqMfyrUvlH3GueMAUyXvxfqC0HmvcJg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fMd582tScLN8lpASdmD/JIL9HGPfgmCrtuacOTxupYCrhTkLlYOpfT8xz8gXKV/sa
         v8OFo5zY9nOfkjQOY2m7RUc8MGeI6LcFrjv1+ofDR8IgVYuZuHHEgsQg932VCfeSAQ
         RUmiBrqIIGOSLoCoYInZRpEmJ2LKmBwYw1AOQbQ57QnbtBHXV4uJ/okpq0y30pbwOK
         RI/vaTetEahyo8meKiCI35xJCxoKpik5TbMrdM+HbUowHTlYm6dSyOig0yBHEsjq45
         pHHJFrTJHvqA5CpOWCs2p0ZxJP8bh1QS2t2nIKkLAR9BcfnMD65otxUvCglfD0lDAk
         HSXef4xWN+CYg==
Reply-To: hs@denx.de
Subject: Re: [PATCH] mtd: mchp48l640: silence some uninitialized variable
 warnings
To:     Colin Ian King <colin.king@canonical.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        kernel-janitors@vger.kernel.org
References: <YMyir961W28TX5dT@mwanda>
 <67e49b8b-a80c-87a0-c5bb-8d5cf9239328@denx.de>
 <CAOMZO5DLxM5nU4HxLT2DzKvmG1Vv1LNSdUoB3m7iZ1mpgxBFxg@mail.gmail.com>
 <aff4cbba-b8a4-445a-4290-7717355effc8@canonical.com>
From:   Heiko Schocher <hs@denx.de>
Message-ID: <b944467a-2f35-30e8-98a1-458038d3c377@denx.de>
Date:   Wed, 23 Jun 2021 05:22:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <aff4cbba-b8a4-445a-4290-7717355effc8@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Colin, Dan,

On 22.06.21 17:39, Colin Ian King wrote:
> On 22/06/2021 16:31, Fabio Estevam wrote:
>> On Sat, Jun 19, 2021 at 3:23 AM Heiko Schocher <hs@denx.de> wrote:
>>>
>>> Hello Dan,
>>>
>>> On 18.06.21 15:42, Dan Carpenter wrote:
>>>> Smatch complains that zero length read/writes will lead to an
>>>> uninitalized return value.  I don't know if that's possible, but
>>>> it's nicer to return a zero literal anyway so let's do that.
>>>>
>>>> Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>> ---
>>>> People, when we add a new driver can we make sure the first commit uses
>>>> the new prefered subsystem prefix?  For example,
>>>>
>>>> "mtd: mchp48l640: add support for microchip 48l640 EERAM"
>>>>       ^^^^^^^^^^
>>>> Otherwise it's not clear to me what I should use as a patch prefix.
>>>
>>> Ok, sorry...
>>>
>>> Hmm... Colin already sent a fix for this, see:
>>>
>>> https://lists.infradead.org/pipermail/linux-mtd/2021-June/087140.html
>>
>> Yes, both patches work, but I think Dan's solution is a bit clearer, so:
>>
>> Reviewed-by: Fabio Estevam <festevam@gmail.com>
>>
>> Thanks
>>
> Yep, I'm good with that.

+1

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
