Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE01DC48BE5
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 21:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D62E761026
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 21:15:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhFVVSF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 17:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhFVVSE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 17:18:04 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA92C06175F
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Jun 2021 14:15:47 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id v12so11096337plo.10
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Jun 2021 14:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=8aXlZr1F1hmRY/0ubzREtKQU8RqK8VWzIaWz5se5XVM=;
        b=ZiS1KsAuKc+8e/DnZgzyiisLvo+nOkSKaI/nerQhWLjZnEehLJdcKAjvsYi/uNiW8C
         Cn8u55GDy8yD56EI6RN5+DzhZ/3+YnrjQbiNhTJWxxOPSjPBXzOgPvS20TVzBwmT70LD
         Km9N5bu0n4bY8X3x7YkXPQMZil+YpRFx97zYVTrRv/508YeE7tgk3JqIpY/aQOhP3OnJ
         X624Ubf3rqwIGSWgINreXEAMvpSS816RolKEFyFV0ockben/NZ/bXH4SQ7+eUPSYI2k6
         /CYs+idMQ3I03SMtRDbwvepPStHUMA7/USLs0KXLLQR4pO/pOkzFka2+7b79KhC7H2Vo
         af6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=8aXlZr1F1hmRY/0ubzREtKQU8RqK8VWzIaWz5se5XVM=;
        b=qqJ1tTOJmDs13U6mfmbY+CXMhfRUgDxuppkN6jHsFkpSJV2WRMMPM4RbO52fgEO4JP
         1+EBQIS2uLyd17G15mA9wVvE6h8qHw8g5YelHI/ETRYZ2S+wwYlMQUv8V01/W7OZb9dd
         GlqmCp4EogJHJj82nyVdAFUJuz7RIS0zUgA6DMNMcn+VwaL4CEh0RC9Fnj1wMKH3OfeH
         66osODd3XBgOW6Mz9KW8iecP+YNTM/MBPpF++W4cp96z7ObBYp8JcDvHY4whqae/MknZ
         hec6Ci2XKvcmxDuCW9dnpqdnVE8KLYuQQmvb7owh7iO6HCDViFMYs+yPwt2xOx7iK1ph
         rD2A==
X-Gm-Message-State: AOAM532UNUJjC9kPCExvpeTp/NAIkf8kDleqW5a4kiChiLX2PhAXtXEI
        U8iWwpxbLXAngZPD6CelGRF558ypN70bdA==
X-Google-Smtp-Source: ABdhPJwHR46NOFLdkzfMM5u23p5KB2roPw+3M9Q2TKlyEO2CxhPxzKp7z20Mbyg+OUYuXY7JdXYasg==
X-Received: by 2002:a17:90b:23c5:: with SMTP id md5mr5797330pjb.93.1624396546723;
        Tue, 22 Jun 2021 14:15:46 -0700 (PDT)
Received: from smtpclient.apple ([2600:380:6c63:dde2:1527:d8a2:8789:f1f0])
        by smtp.gmail.com with ESMTPSA id 73sm227423pfy.83.2021.06.22.14.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 14:15:46 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Jens Axboe <axboe@kernel.dk>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH][next] block/mq-deadline: remove redundant assignment of variable ret
Date:   Tue, 22 Jun 2021 15:15:45 -0600
Message-Id: <F8A7A6B5-37DB-45D8-971F-85D392618512@kernel.dk>
References: <dce79425-05fb-26a3-2f01-f9893de41513@acm.org>
Cc:     Colin King <colin.king@canonical.com>, linux-block@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <dce79425-05fb-26a3-2f01-f9893de41513@acm.org>
To:     Bart Van Assche <bvanassche@acm.org>
X-Mailer: iPhone Mail (18G5042c)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Jun 22, 2021, at 3:14 PM, Bart Van Assche <bvanassche@acm.org> wrote:
>=20
> =EF=BB=BFOn 6/22/21 9:17 AM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>=20
>> Variable ret is being assigned a value at the end of the function
>> and the value is never read. The assignment is redundant and can
>> be removed.
>>=20
>> Addresses-Coverity: ("Unused value")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>> block/mq-deadline-main.c | 1 -
>> 1 file changed, 1 deletion(-)
>>=20
>> diff --git a/block/mq-deadline-main.c b/block/mq-deadline-main.c
>> index 4815e536091f..e3091d922ba2 100644
>> --- a/block/mq-deadline-main.c
>> +++ b/block/mq-deadline-main.c
>> @@ -639,7 +639,6 @@ static int dd_init_sched(struct request_queue *q, str=
uct elevator_type *e)
>>    if (ret)
>>        goto free_stats;
>>=20
>> -    ret =3D 0;
>>    q->elevator =3D eq;
>>    return 0;
>=20
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>

Assuming this is fallout from the recent series, we should add a fixes tag t=
o it.=20

=E2=80=94=20
Jens Axboe=
