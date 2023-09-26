Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF02E7E63F
	for <kernel-janitors@archiver.kernel.org>; Tue, 26 Sep 2023 14:34:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234349AbjIZOe0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 26 Sep 2023 10:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234480AbjIZOeY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Sep 2023 10:34:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD13810E
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Sep 2023 07:34:17 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50317080342so15159292e87.2
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Sep 2023 07:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695738856; x=1696343656; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/riFuqlTy29sJVYgyLAuQOHUjoD2tge6GmUK1p+oNFo=;
        b=H6jiNH6eKW4fNubrtolzQWuFBpZSTlFgowBn7rCGXgskl5pqIc7Z4Nqth5SE/6rSjq
         9jru1QQBkVPHHnYtuBivH5UXvIO5nlLO9FgxYC/aEId/6s89ZkhgXsdwT4KlKOulWfQ8
         qVRrkZwhJqMTr9TUDvqohEy52siP1JMmqoLBgsBrFzbTE7Z92TQDZk1c+AFSIoZ5Q4LT
         Guo69cu2Bp6wY0t84cZ8p57Bn8IYm8FvuaaqEjOQlFm/lAwRyltr4TZPxtR6uEawWu6+
         3CkFbMgf3TUBnDztdxd1qmKdBmueWP3sGLocSmBjPYBXHmdL0IModcrRyc5yqFazjLyf
         GqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695738856; x=1696343656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/riFuqlTy29sJVYgyLAuQOHUjoD2tge6GmUK1p+oNFo=;
        b=S2Ki+s/PgC4SAgTMlNaeyPYdq/EHg/bmC4FPA88lwJ/sRKkaNpF1/mI0bAI8zaJJu4
         VLWZm272qV/Cp5NLmWqREK4GahKp3DkAXrApMQ+cqDUBKOPtWYhu7oYv4kFS3yGFIp4q
         e9xC3xJqMBhIoCOr/dINCSWDFlXfoPoBAUXtMN+mFkFc+7FIb7cT/J0/qqp2cB2KkL74
         by1htG5YDOYz2KFkAf2819H9Ne6KjQrEsK7HAxqJN273JFcXyJp1XPMZp7/InfeS5rmT
         gprvN2I0UPELFyHMlvI+S9AyhTn1LnQYbl53LNWH0H8Lqu1zE6EI7CSOPg3wTRCEuDUT
         BpXg==
X-Gm-Message-State: AOJu0YwnaLw3Nchmpk2ytbkIjwcJn2FqOTOgkZ+mOQ7yrqZj13+9Uwgh
        phoP6epDJ6mfjj5CvYsePbVMGvq9nQYNYBvS15M=
X-Google-Smtp-Source: AGHT+IGK6jhA/UCwpJHkwbyR/2+2F0OVC7pOaBisfmsQWfnk9JuVbAkFtDU5C2SUoJpgwUFe+tFE0Q==
X-Received: by 2002:ac2:5397:0:b0:4fd:faf0:6591 with SMTP id g23-20020ac25397000000b004fdfaf06591mr7584690lfh.10.1695738855814;
        Tue, 26 Sep 2023 07:34:15 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id g4-20020aa7c584000000b0052e2472f884sm6916835edq.21.2023.09.26.07.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:34:15 -0700 (PDT)
Date:   Tue, 26 Sep 2023 17:34:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Rae Moar <rmoar@google.com>
Cc:     Daniel Latypov <dlatypov@google.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <davidgow@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] kunit: Check for kunit_parse_glob_filter() failure
Message-ID: <7bee596c-e0af-40cd-8204-6767266c8a0d@kadam.mountain>
References: <3ff9d019-75b6-45ee-9b03-9d6ec7c5364f@moroto.mountain>
 <CA+GJov4SRGa6scDUmm1Tzu8JX4ZaF8S7YVxwZVvYJMSLXVRwrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+GJov4SRGa6scDUmm1Tzu8JX4ZaF8S7YVxwZVvYJMSLXVRwrw@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 19, 2023 at 02:49:43PM -0400, Rae Moar wrote:
> On Fri, Sep 15, 2023 at 8:58 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Smatch complains that the missing error checks would lead to a crash:
> >
> >     lib/kunit/executor_test.c:40 parse_filter_test()
> >     error: double free of 'filter.test_glob'
> >
> > We may as well do it right...
> >
> > Fixes: a127b154a8f2 ("kunit: tool: allow filtering test cases via glob")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Hello!
> 
> We definitely should add in checks for these errors. I have a couple
> comments below.
> 
> Thanks!
> -Rae
> 
> > ---
> >  lib/kunit/executor_test.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
> > index b4f6f96b2844..176c9c9dfcfc 100644
> > --- a/lib/kunit/executor_test.c
> > +++ b/lib/kunit/executor_test.c
> > @@ -27,13 +27,15 @@ static void parse_filter_test(struct kunit *test)
> >  {
> >         struct kunit_glob_filter filter = {NULL, NULL};
> >
> > -       kunit_parse_glob_filter(&filter, "suite");
> > +       if (!kunit_parse_glob_filter(&filter, "suite"))
> > +               return;
> 
> First, this is returning every time this test is run because the
> kunit_parse_glob_filter returns 0 when there is no error. So this
> should instead be checking for a result of not equal to 0.

Oh...  Duh.  Sorry.  That's embarrassing.

> 
> Secondly, this should fail the test if the parsing returns an error.
> So instead of returning I would recommend using a KUNIT_ASSERT
> statement to check the result of this method is equal to 0.

Will do.  Thanks!

regards,
dan carpenter

