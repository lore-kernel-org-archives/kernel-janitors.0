Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F5EC433EF
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Feb 2022 18:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbiBGSf6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Feb 2022 13:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237141AbiBGScf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Feb 2022 13:32:35 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C534C0401DC
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Feb 2022 10:32:34 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id h7so18017296iof.3
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Feb 2022 10:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lHF1VpH0DQWDH5n7whaT5A/13tsAV04BQTsvPAisIH0=;
        b=Dj8tHg/5t1JB+owhj2ZjiEZL01octdxE8ToKWyyO+Mc27jiSIyo4407/YMOcfmzSnt
         p17FI0FIsTEzmPy2Y5xTPdNLD097MXmh1K+EyMfe5VjMNf1/JZ3EH0bidk6DQhir9imY
         vQWBjEHVY4rmWu/aXT0leiUl8vc/d8lFpNc4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lHF1VpH0DQWDH5n7whaT5A/13tsAV04BQTsvPAisIH0=;
        b=injp5XS2avs5dXTwruT//Fs3mtaHIbMJK3NtnVQlTnRsIX5Q4TtxKGsTmOyxxQ44uu
         Rhmks16PhJHUDew4IIDUMw4oOjVDi+kgKLwPLCdJLeUtQk3ZvFkSOA18YigPP+VDoEld
         Ub6ksQpiEoxZYoSiyw88GOok3xC57S9MPxvFVeiclMJqqxDlEREDq1pAHFmS4MgJdVpA
         xR/IJQYfhsprSEYmTBQE0sTvz0K5oEH8UDdne8oF3qdzT5givOSPw1hY7fJ4xjCaDzRA
         PY9ecpGsFJurPQsqOHIy0H3ITxOzkVakLKgXZ0ZjPxC7KKD9ybEP3eGag8HiLUoPruA8
         p6yQ==
X-Gm-Message-State: AOAM531LwYvT05i4fKTy5CjPuYLXmy7T1N/GvlkaBI/7sWZE+qvdd27f
        o7wHx7Yb/s0vrs1UwrUN3QEeCA==
X-Google-Smtp-Source: ABdhPJwAi7OgegFLvzLu3DSbiMS8FE+D6rNCLKTStU8ZEgIomXfkDkIRujGcZ3DVxw92MTT9otWwPQ==
X-Received: by 2002:a5e:c20b:: with SMTP id v11mr398967iop.197.1644258753611;
        Mon, 07 Feb 2022 10:32:33 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id c11sm1632610iln.56.2022.02.07.10.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 10:32:33 -0800 (PST)
Subject: Re: [PATCH][next] kselftest: alsa: fix spelling mistake "desciptor"
 -> "descriptor"
To:     Colin Ian King <colin.i.king@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Shuah Khan <shuah@kernel.org>,
        alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220207092235.240284-1-colin.i.king@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3c47e21f-45de-1bd1-a547-225b3ef0ebc0@linuxfoundation.org>
Date:   Mon, 7 Feb 2022 11:32:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220207092235.240284-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2/7/22 2:22 AM, Colin Ian King wrote:
> There are some spelling mistakes in some ksft messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   tools/testing/selftests/alsa/mixer-test.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 

Looks good to me. If it goes through sounds tree:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


