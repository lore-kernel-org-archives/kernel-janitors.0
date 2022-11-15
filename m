Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B16C4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 10:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238031AbiKOKzX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 05:55:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236156AbiKOKyi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 05:54:38 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5E426AD3;
        Tue, 15 Nov 2022 02:53:03 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B0293850C5;
        Tue, 15 Nov 2022 11:52:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1668509581;
        bh=Sfq699fVyCuxgQtDnzj42a7oOy6n7K1r2GEoIrxP9rw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VmF3sXovf1DW1vddaddwy9gozL/2h+yUgOj/ocEbNmHuhN940hqdBsPAVC2guizQK
         RsHhYoFvd/lmSuFSp0Wh/BTJXhy4UQKI08lkpLKk2dnbzca02qdA0JbDJkJj8vwpjt
         FtFX0NxJcBuVxf03rovecmskcEFmIRuA28C7/OOZKn0bSTSqtuPGupiXSQeKHfGj4R
         E9waarvZi0dmnISPPJa2eV6n9JqNyZvAClEbq+zL+60ej4/68cia6V7Gb2AObyj8Gw
         vSlPw0onlBin1Y2fYAhWR1BSFtASbUtefpxka9P7rbfZ8/j4Jo8eTlI7Ksle5TiNiN
         PiJd56L6VUFQA==
Message-ID: <0750d2e8-766b-3c5c-5472-4c9d6e9ec3c4@denx.de>
Date:   Tue, 15 Nov 2022 11:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] MAINTAINERS: rectify entry for MICROCHIP USB251XB DRIVER
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Richard Leitner <richard.leitner@skidata.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221115103153.28502-1-lukas.bulwahn@gmail.com>
 <c21e0e3d-5970-d905-3b6f-54a1ddacd052@linaro.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <c21e0e3d-5970-d905-3b6f-54a1ddacd052@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11/15/22 11:35, Krzysztof Kozlowski wrote:
> On 15/11/2022 11:31, Lukas Bulwahn wrote:
>> Commit fff61d4ccf3d ("dt-bindings: usb: usb251xb: Convert to YAML schema")
>> converts usb251xb.txt to usb251xb.yaml, but misses to adjust its reference
>> in MAINTAINERS.
>>
>> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
>> broken reference.
>>
>> Repair this file reference in MICROCHIP USB251XB DRIVER.
>>
> You know this could be just one sentence (instead of three paragraphs)
> with a Fixes tag...

On the other hand, the content is educational, e.g. about the usage of 
get_maintainer.pl script .

Acked-by: Marek Vasut <marex@denx.de>
