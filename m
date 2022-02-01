Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF44C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Feb 2022 21:34:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbiBAVec (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Feb 2022 16:34:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiBAVeb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Feb 2022 16:34:31 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22917C061714
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Feb 2022 13:34:31 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id v13so34468978wrv.10
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Feb 2022 13:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=o6dfcfj1fYmfHwrU8oFxWopL9zS55EIBUP6w6pjzDbs=;
        b=CwW5jzz1fyZNLAwZZpXdCjXMLwsyxUsxG705xfxxCOVaMTCgHbGDaY89+355N05Cnk
         JF3iKFkb3iPffAzL2SQ5YhXiCfh2ded06huLPy0JUOp91vdqr+eJs/irW/bAzk2oWI0J
         SPDfu5w7jxCJX8L9WRrJrR230LhLG5xkHCyBLfOUfN87jhxx5jmXxnhQV9okizblbScx
         UNfz34XHCvL/4VeYuLtMBc8FSYtIeyFBLKO16Oe9aShd5Rgo34UdvX9QjdALz2n+t6X2
         hi6aC6Mpc8nI8iVNwpxhBmRONr8/RU6D4NbAq3W6gyy/cRw57wDhuhW72WYU9hO92sMX
         QV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o6dfcfj1fYmfHwrU8oFxWopL9zS55EIBUP6w6pjzDbs=;
        b=XDckzCDondxtVbAqGIcUgJPx466dIhyiiNCSdIF0f+5Ueqq/bNoNKKAEw4wVdDdwhe
         LL+u3tSvovSxZgJFToE7r4qT1gg9fzUc/VZ4Vri2nut+5FrI3Px77YG49kfGpocl1yc5
         Lew88PSQp5KHntuHBcxKN1r/tawsUIc/5D2Vvy4kV93umJWgKTTgfqRzVZyB6EFHnjoD
         IRw/UbpjkYJFQus1cqvIRfXUbbNAPFyr5lSs5qj7G86NNyk9BOLnmpS8y8nsv2IEOm9E
         z+UU10+5+K82xYM1hCzDTL9plxDe0UXQG9vgUf6Tize+giFwLuCJS4Dbs48GtjDskOSa
         O6Gw==
X-Gm-Message-State: AOAM5309wGozsU/XLNANwcJ8lSToIdW1OIklJx6ZucKumwqQuEYmhz9W
        xk2ovJzAVmOW4lLmNZ74RBC+/g==
X-Google-Smtp-Source: ABdhPJxsGcBMu91sw12LbR6jqx45C4mC1Iioj5+479QjW+SHtt0CNdFUUvCPAiUR3rx9E151ybLTAg==
X-Received: by 2002:a5d:4384:: with SMTP id i4mr411097wrq.607.1643751269283;
        Tue, 01 Feb 2022 13:34:29 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s9sm15423410wrr.84.2022.02.01.13.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 13:34:28 -0800 (PST)
Message-ID: <52d89100-c2c7-8689-7545-0e8972a08b6e@linaro.org>
Date:   Tue, 1 Feb 2022 21:34:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] wcn36xx: Uninitialized variable in
 wcn36xx_change_opchannel()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Kalle Valo <kvalo@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20220201125941.GA22458@kili>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220201125941.GA22458@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 01/02/2022 12:59, Dan Carpenter wrote:
> This code needs "channel" to be initialized to NULL for it to work
> correctly.
> 
> Fixes: d6f2746691cb ("wcn36xx: Track the band and channel we are tuned to")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

good catch

Reviewed-by: Bryan O'Donoghue <bryan.odonghue@linaro.org>
