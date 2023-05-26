Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A29C77B7A
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 08:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236792AbjEZIA0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 04:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjEZIAZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 04:00:25 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA72125
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 01:00:22 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f6094cb2d2so4723155e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685088021; x=1687680021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d718yMB4xrTXCokPERZD0i0TdWYAZqU1eyBOi2yuTyU=;
        b=OrxfSrenEJzkhMtZ+DBsKsJLVZ0/77yIbLhdg5TzjtuFC6DIAy8OSs/DWjYvMn0rGm
         c0zHw1JETE5r9EFI5j1yVesHWlgiSi7xmxIk5T5+rCZaYYqzZi1QZgmDWQsNDHuGfEMx
         4Ja8Sz6fbXScf3UIj8OkUKw7rQaBMkw3vf2+ZDl8pHmmSCqb9DRzFLMFKgRV0A+N3YS2
         BWxY5HFPP910jArwF/481XRBkEFpq1nKwdYQht0SCmrsjnvKRGFysPqnLkj6mNYf3Suy
         PzMbZbam8NDZ5rRFxx6VWjV9snGxHE/sKLWpgRL/aymU6FbcqdL+E7pI2j9RDktwLoAI
         aJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685088021; x=1687680021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d718yMB4xrTXCokPERZD0i0TdWYAZqU1eyBOi2yuTyU=;
        b=gd2KKlLDa7pa3PYXArs5ta5EKwZMg5KCHR68QAtyCSbhGTwKZES+t0fgHl2iaMhhau
         SigJNxZ0KYV7H+dEicXbZM2F/Ks47/qUAmkL1dtecQCG5fhDO39aa2ox6SU98WFOClo1
         hXNHHjwDkglQDvKzTkM7B0liySc2rxzQDY5zHxxmMyhYbur5RJ0BcIpgFallWdmCJ5DP
         9eNh+w0jx9oO1OuiEQ4qOVhkdMtcyrttLd2EObe0xoEuE8sMtq4fNU42AI79Odu1ZY9G
         beQuHQB9h0Mz0Tkxh8jGY8sqKqJ5CCPOxKL8hEjcnBpL3knVQeq2GTLkntL7sU2mKsPc
         dTdQ==
X-Gm-Message-State: AC+VfDziTjDyj1xPuUAsi1SIHkGMbv5YO7XNhbogtlqjseNYQAR6OQPx
        EqBmYlQFDTA3P8DIRHq8PTavKGEglR06f0vP8dc=
X-Google-Smtp-Source: ACHHUZ6ldoVRN76ue/78HgIhZLD+VNdhL0NVvT0+9X+ADcTeeB5IBJzfGsytqfpu1I9rEAbfiGJ9uQ==
X-Received: by 2002:a7b:c40f:0:b0:3f6:cf3:dba8 with SMTP id k15-20020a7bc40f000000b003f60cf3dba8mr830738wmi.34.1685088021341;
        Fri, 26 May 2023 01:00:21 -0700 (PDT)
Received: from [192.168.1.70] (29.31.102.84.rev.sfr.net. [84.102.31.29])
        by smtp.gmail.com with ESMTPSA id p19-20020a1c7413000000b003f60e143d38sm4352370wmc.11.2023.05.26.01.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 01:00:20 -0700 (PDT)
Message-ID: <5d9f2dee-7c56-0220-48fb-c9fbdec1af29@baylibre.com>
Date:   Fri, 26 May 2023 10:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [bug report] mfd: tps6594: Add driver for TI TPS6594 PMIC
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, kernel-janitors@vger.kernel.org
References: <afd9a078-1002-4a26-a9b2-d92406912af5@kili.mountain>
 <44024069-723a-9726-7cdb-6c10a3ce2c7f@baylibre.com>
 <cf3ada2f-0c44-4389-9758-b72af9d138db@kili.mountain>
From:   Julien Panis <jpanis@baylibre.com>
In-Reply-To: <cf3ada2f-0c44-4389-9758-b72af9d138db@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


>> Special handling for 'count == 1' (or 'count < 2') makes sense indeed.
>>
>> I'm not sure that I fully understand, though. Will Smatch stop complaining
>> for both things that you mentioned above with a patch for handling 'count < 2' ?
>> Or will we consider either that warnings are handled, even if they are still there.
> No, don't do anything to silence the warning.  Always fix the checker
> instead of working around it.
>
> Handling the "map->format.reg_bytes + map->format.pad_bytes + val_len"
> is kind of complicated but still easier than handling the:
>
> 	if (val_len % map->format.val_bytes)
>
> condition in regmap_raw_write() just because it's closer together.  It's
> quite a bit of code to write to silence this false positive but it's
> something which could be done.
>

Who must fix 'smart' ? Me ?

I run 'smart' on my side and did not see the warnings you mentioned.
Here are the commands I run:
- [path to]/smatch/smatch_scripts/build_kernel_data.sh
- [path to]/smatch/smatch_scripts/test_kernel.sh.sh
   -> no warning for tps6594 mfd drivers in 'smatch_warns.txt'
[path to]/smatch/smatch_scripts/kchecker tps6594-i2c.c
   -> no warning
[path to]/smatch/smatch_scripts/kchecker regmap.c
   -> no warning related to tps6594 mfd driver
   -> 2 errors for "uninitialized symbol 'ret'" in _regmap_raw_write/read()

Maybe I did not use the tool properly (?)

Julien
