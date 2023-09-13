Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E772EE0201
	for <kernel-janitors@archiver.kernel.org>; Wed, 13 Sep 2023 17:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjIMRv2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 13 Sep 2023 13:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbjIMRv0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Sep 2023 13:51:26 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9A319AF
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Sep 2023 10:51:21 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-401da71b7c5so657865e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Sep 2023 10:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694627480; x=1695232280; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FyYx53FxfQAw89va0cpnMmgS15dAzd07q2KbIgbInrY=;
        b=Nls/83M6nVqSO7V/qs+xMAtqcqaWoPVKJ3385RWOkdkpibSXzm2rRBNI4BKI+FfBV1
         gHzSENaPL2eqzQHQPuo5+1FFuqu/B72lcnJpjpSgnTpVZ13bXtp4a/+KYYaiXLJXEatj
         QgDc+JD2PKkgB1RCR9jmF2CWHKFUk162trpQIyFq3diKV0UrOSRYdI4qBFNMpIzx+eF9
         2cmoC586s1wJIuWSeGwJQjai6HyUrppWdv8aBle0N7YmC2TQOoBU2Oq4N/bLLVMjFFR6
         e+GUpaDykwC4Cg7+cBy5kiibrEcTAT89cjua+Z8CzWJopsYqcXN1/x4OMRSkvmc7mBEg
         Zb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694627480; x=1695232280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FyYx53FxfQAw89va0cpnMmgS15dAzd07q2KbIgbInrY=;
        b=rWwvzY6sBfK+obW7HT50QrmZeGhUX6gjivhzFCjnIMGUyDVd8PnO4QWOkBY4k5QVki
         6JomCCJ18p4Gez/kNoCYROukuJHiaUy0i7GRE0U3kG+1cW5rszjhxpVZbCSjz+v32MnI
         Uf5miUzk9j/LaVufY8DvVQHoCaST2EY40utw1gNx7c0I8cxVEZGk+iRFWo7ExyL61ep5
         DdayUVSeQxO0DeYn5yIaJHlVQSpC4IPTv98qlNLf/OGig/u+fXJKSNjPcOcrqugEA4nF
         PWWSGXpwyATLeZl7RRHjyPjbQ/jLz+3p9qVVhHreJ/X7jdOpsUwnbkYc5DlJCEaN499y
         8y7Q==
X-Gm-Message-State: AOJu0Ywjfm+zNyoMikUt9PWe1EhPnnxqwOehx5AocBJHW13zrrdIKxwP
        qdTTP6XlqWQGAexQxWZoWmEVqw==
X-Google-Smtp-Source: AGHT+IELlc+r0cfJgPdnyPQO/pphf431jMg+zw/m3Zlk+KFfPLVGjzhiNVEt/6LVuguJr7V0DLLvQQ==
X-Received: by 2002:a1c:7703:0:b0:3ff:516b:5c65 with SMTP id t3-20020a1c7703000000b003ff516b5c65mr2883462wmi.30.1694627480327;
        Wed, 13 Sep 2023 10:51:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c11ce00b00403038d7652sm2641434wmi.39.2023.09.13.10.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 10:51:20 -0700 (PDT)
Date:   Wed, 13 Sep 2023 20:38:10 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: steelseries: Fix signedness bug in
 steelseries_headset_arctis_1_fetch_battery()
Message-ID: <ca55accf-5a7b-43f5-83e0-59c48d0a9389@kadam.mountain>
References: <5c1cc882-b2b8-45cb-b8f7-4b35d1800e5d@moroto.mountain>
 <e0ad67eea72936e44df399e46bb89b7be914419e.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0ad67eea72936e44df399e46bb89b7be914419e.camel@hadess.net>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 13, 2023 at 04:43:29PM +0200, Bastien Nocera wrote:
> Hey Dan,
> 
> On Thu, 2023-09-07 at 12:55 +0300, Dan Carpenter wrote:
> > The hid_hw_raw_request() function returns negative error codes or the
> > number bytes transferred.  If it returns negative error codes, then
> > the
> > problem is that when we check if "ret <
> > sizeof(arctis_1_battery_request)",
> > negative values are type promoted to high unsigned values and treated
> > as
> > success.  Add an explicit check for negatives to address this issue.
> 
> I would be grateful if you could either add the compiler's error
> message or explain in greater details the integer type promotion (or
> demotion from signed to unsigned in this case) in the commit message.
> 

This is a Smatch warning but you have to have built the cross function
database and I only know one other person who does that for sure...

drivers/hid/hid-steelseries.c:393 steelseries_headset_arctis_1_fetch_battery()
warn: error code type promoted to positive: 'ret'

I can add that and resend.

> > Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1
> > XBox")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> 
> 
> > ---
> >  drivers/hid/hid-steelseries.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
> > steelseries.c
> > index 43d2cf7153d7..485d2287d58a 100644
> > --- a/drivers/hid/hid-steelseries.c
> > +++ b/drivers/hid/hid-steelseries.c
> > @@ -390,7 +390,7 @@ static int
> > steelseries_headset_arctis_1_fetch_battery(struct hid_device *hdev)
> >         ret = hid_hw_raw_request(hdev, arctis_1_battery_request[0],
> >                                  write_buf,
> > sizeof(arctis_1_battery_request),
> >                                  HID_OUTPUT_REPORT,
> > HID_REQ_SET_REPORT);
> > -       if (ret < sizeof(arctis_1_battery_request)) {
> > +       if (ret < 0 || ret < sizeof(arctis_1_battery_request)) {
> 
> I prefer:
> -       if (ret < sizeof(arctis_1_battery_request)) {
> +       if (ret < (int) sizeof(arctis_1_battery_request)) {
> 
> although I'm not sure that's the kernel-style for this sort of checks.
> 

I grepped to see which format is more popular and it's 14 vs 13 in favor
of casting.  I prefer to avoid casts, but I can resend.

regards,
dan carpenter


