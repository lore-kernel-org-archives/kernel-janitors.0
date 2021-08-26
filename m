Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C00C4320A
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Aug 2021 21:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FFC061038
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Aug 2021 21:13:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243650AbhHZVOl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Aug 2021 17:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243642AbhHZVOj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Aug 2021 17:14:39 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFC6C061757
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Aug 2021 14:13:52 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id v2so4691327ilg.12
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Aug 2021 14:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YnNHkI0gHMxJbA+95byWCLpuUzCuKxcTdcXyfiGVjUM=;
        b=e0vW1Xx1Is2NIpawZnNrC08LPD6fxUsKtJcyEjVpb2WVMF/GNz2YgUvjaW641LK2Jd
         3KSdxWgmNGuAR2NxBh/xbs+c3JVxHRK91pLvahGhQQjEx9sDeKs4+4UuZ4nABz2Z+RTQ
         5j1fqYj0DBJz9zI+xOZHBX5k2uh4UgYWSke/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YnNHkI0gHMxJbA+95byWCLpuUzCuKxcTdcXyfiGVjUM=;
        b=Ezd3sCkVutAbTqIbKvmzPTp7Ocwomc0u2KB9qub4oxr23Fwtmqrppqkp2Uy6b7GE7K
         0FUmd2N56UA5DoFbTCXIt1AmtAeSfrd69Z+dNR313wFOeEwSOY2RzQ2MplfrvHJ/naB3
         5R4gFUr360B9fn38DmqaAYuHscr6M5UfUhed1YW70cuoIRvlhEht2pIphe7wjh6AtFlG
         k7pod7WhxDctNOda+t5FxMCiPYX3ckMLe0GfgUJgrFCgqT4SPH6wTbz5oy9aKBeV4ZEA
         LNDW9CdSaBLuNNPDDToO+u4A+B9HoHP7YsAhKFTF1TfaDUyjTEjko4qmUVDTSPqZXzJd
         qVkA==
X-Gm-Message-State: AOAM5338g5zoHvSh8Ci2cLUPTGett/Kq8xJN/oLlrcCIMvjgZ+Byp8jH
        lGnIHb/vKCJF0BH1dUNnAfmyhvK1QZj5cdM7
X-Google-Smtp-Source: ABdhPJz5oXSrZWxoTTWZQvMf5h7OZQw2WyM2uqVRfptjmUsM1ETSh/FCcRmm+2MkK8kmJvjwtQ1w0A==
X-Received: by 2002:a92:c60b:: with SMTP id p11mr4013224ilm.65.1630012431656;
        Thu, 26 Aug 2021 14:13:51 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id y11sm2133002iol.49.2021.08.26.14.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 14:13:51 -0700 (PDT)
Subject: Re: [PATCH] selftests: safesetid: Fix spelling mistake "cant" ->
 "can't"
To:     Colin King <colin.king@canonical.com>,
        Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210826121445.13062-1-colin.king@canonical.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a7e0507d-7e16-6e40-41eb-66141c1359ca@linuxfoundation.org>
Date:   Thu, 26 Aug 2021 15:13:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210826121445.13062-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 8/26/21 6:14 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in an error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   tools/testing/selftests/safesetid/safesetid-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/safesetid/safesetid-test.c b/tools/testing/selftests/safesetid/safesetid-test.c
> index 0c4d50644c13..4b809c93ba36 100644
> --- a/tools/testing/selftests/safesetid/safesetid-test.c
> +++ b/tools/testing/selftests/safesetid/safesetid-test.c
> @@ -152,7 +152,7 @@ static void write_policies(void)
>   
>   	fd = open(add_whitelist_policy_file, O_WRONLY);
>   	if (fd < 0)
> -		die("cant open add_whitelist_policy file\n");
> +		die("can't open add_whitelist_policy file\n");
>   	written = write(fd, policy_str, strlen(policy_str));
>   	if (written != strlen(policy_str)) {
>   		if (written >= 0) {
> 

Thanks. Queuing this up for Linux 5.15-rc1.

thanks,
-- Shuah
