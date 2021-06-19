Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34608C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Sat, 19 Jun 2021 06:21:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D24C611AC
	for <kernel-janitors@archiver.kernel.org>; Sat, 19 Jun 2021 06:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbhFSGXw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 19 Jun 2021 02:23:52 -0400
Received: from phobos.denx.de ([85.214.62.61]:35962 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229851AbhFSGXw (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 19 Jun 2021 02:23:52 -0400
Received: from [192.168.1.107] (unknown [81.0.122.178])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hs@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9025D80C67;
        Sat, 19 Jun 2021 08:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1624083700;
        bh=ai9TjuENEyYwEAIGJWK06087RIx9go2L05hZxcR8nxw=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gpaHmSUokp4b+Ex0QUE7QHIiwSG84mTzC0a1Luakk+qVL6Zl+Rd5CnIsNUb3D7+99
         sIFpTHi2i7EpE9rUdn8/8f7Vnv4nkZNeD22MMnL/OiF4noHZWc833Zqtvd4SF/kvlB
         lj5NVrjAtvK1JMfgcwPt/YCvFiCCNlKi45Ux7RrCL+Ur6DyzKMhJY2fcSt4VMahsb6
         57XgOlP/9mh3uMkZOBu/FxHozKIcYw32Md0/wo5BNZgMfUzI1z+l4MuZyAOUCIKTN4
         hYTKUtOOSxF3tGiF0AfBPV1uOQzQQ1TIVEsMjSdzfbjs8tiImb0Jm4glFiyKR6AL0/
         P+4NTpYJs78Fw==
Reply-To: hs@denx.de
Subject: Re: [PATCH] mtd: mchp48l640: silence some uninitialized variable
 warnings
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <YMyir961W28TX5dT@mwanda>
From:   Heiko Schocher <hs@denx.de>
Message-ID: <67e49b8b-a80c-87a0-c5bb-8d5cf9239328@denx.de>
Date:   Sat, 19 Jun 2021 08:21:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMyir961W28TX5dT@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Dan,

On 18.06.21 15:42, Dan Carpenter wrote:
> Smatch complains that zero length read/writes will lead to an
> uninitalized return value.  I don't know if that's possible, but
> it's nicer to return a zero literal anyway so let's do that.
> 
> Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> People, when we add a new driver can we make sure the first commit uses
> the new prefered subsystem prefix?  For example,
> 
> "mtd: mchp48l640: add support for microchip 48l640 EERAM"
>       ^^^^^^^^^^
> Otherwise it's not clear to me what I should use as a patch prefix.

Ok, sorry...

Hmm... Colin already sent a fix for this, see:

https://lists.infradead.org/pipermail/linux-mtd/2021-June/087140.html

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
