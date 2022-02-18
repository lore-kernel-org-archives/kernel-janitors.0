Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE43C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Feb 2022 19:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236749AbiBRTU7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Feb 2022 14:20:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236628AbiBRTU6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Feb 2022 14:20:58 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD292838D8
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Feb 2022 11:20:41 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8B2664001E
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Feb 2022 19:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645212039;
        bh=H0Iwmd8wCuU9HHukGVMrKzFKF37GPFWQBtO1dM10cGA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=GiO1U0mty3PDY64JdnDf8SioaDr1ATgkm3xXIeNORQMMPIHzCNjVtxCwhBfej5bwa
         ZL7oNg+uSV65vaxRgnrzHL0L/X7oe5jGpgreK/TrAYKumlr7oA9bMyM7rPmKw4NDYB
         AY3In7w6s0sDSgeiTTOuEQr/HHSPW7N69H4xQMktbsCYjCuh9lXAiIVb3iWG0xafVp
         b8hUL4zQcRkEsy/PdP8zTpUutrqHkIZKj8BlSh0jYhhIzdbtrW1bBxzoTAIIlcArCL
         /BmCppKYluHMcdElk1R4xiWaRGgX5oH2CTuFP1KRbZizJ2jvaTM2rBUtawsPXvJq6A
         J0QH1ilvcv2Jg==
Received: by mail-ej1-f71.google.com with SMTP id k16-20020a17090632d000b006ae1cdb0f07so3477094ejk.16
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Feb 2022 11:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=H0Iwmd8wCuU9HHukGVMrKzFKF37GPFWQBtO1dM10cGA=;
        b=Jv8Ma+CeROi+P8X10sCWbxvf1Nir7YXQ4/aOZmXz21OCNj4nrlaEaHHL1M/oIc9epW
         vpFHnSx1RyKljeHzkldWJYmYMainNhxdir4yKkINm63KWI8/9vTPztDnR9Vma4KpknCJ
         xmwdiMa7KdNiMnmAaih96wdL8ncrfzTt/PeSHYmDSUMiorISy1Ll9lHENQ7jQZTAuM9y
         N5nq8o/dD3tGoj79Dn68iF4JQD8SGCNQvHj59Jkmrq387b3TDlk2qIyprXyDFxP/FsB8
         Sj98MGA5FfUrv6e4JjlW9M2mA46ZzeASK7d+z08IF9liCbt4cv7g6rKlVLd4qZc7BHb6
         +ryg==
X-Gm-Message-State: AOAM530TaEEoL8YXGQPPQpSS4a5Bb6TAHOOdmMVsxGRZdYAU1PBUpanc
        pCNnVp/6gZpePO78MbWolmN28S8uLVS1FLoq/EHjcXVFBVPW57ltxiFR9V8thc+EscW2Vogm4fC
        4vPrBIFwVd+pQDbdY++kmvq4ZHQXRkUz78/uoz/pxD8NlUg==
X-Received: by 2002:a17:906:b1d0:b0:6cd:fa02:b427 with SMTP id bv16-20020a170906b1d000b006cdfa02b427mr7463370ejb.99.1645212039292;
        Fri, 18 Feb 2022 11:20:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+3tAag5IIivzTuXFNNLBWIeNlv9ap8rmkimlg4Z9CIQb87t2RY7mnVEypnk+2Ca7rgN3Q6g==
X-Received: by 2002:a17:906:b1d0:b0:6cd:fa02:b427 with SMTP id bv16-20020a170906b1d000b006cdfa02b427mr7463358ejb.99.1645212039146;
        Fri, 18 Feb 2022 11:20:39 -0800 (PST)
Received: from [192.168.0.116] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id l24sm5147643edv.88.2022.02.18.11.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 11:20:37 -0800 (PST)
Message-ID: <91a26d60-abeb-6188-2ed2-1145e52ca36e@canonical.com>
Date:   Fri, 18 Feb 2022 20:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V2] power: supply: max17042_battery: Use
 devm_work_autocancel()
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Hans de Goede <hdegoede@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Purism Kernel Team <kernel@puri.sm>,
        Sebastian Reichel <sre@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <670ea51361f96035f49852c617325af10ffa07ea.1645205558.git.christophe.jaillet@wanadoo.fr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <670ea51361f96035f49852c617325af10ffa07ea.1645205558.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 18/02/2022 18:37, Christophe JAILLET wrote:
> Use devm_work_autocancel() instead of hand-writing it.
> This saves a few lines of code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> V2: s/devm_delayed_work_autocancel/devm_work_autocancel/
> 
>  drivers/power/supply/max17042_battery.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
