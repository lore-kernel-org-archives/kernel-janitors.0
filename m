Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94732C433B4
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Apr 2021 08:51:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53E5D613C3
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Apr 2021 08:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244616AbhDFIvw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Apr 2021 04:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240673AbhDFIvv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Apr 2021 04:51:51 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E195BC061756
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Apr 2021 01:51:43 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z1so15564658edb.8
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Apr 2021 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+76LEhmQVtVbwUuq2qvswXIMQNELjwa8jYT8LCkNp0c=;
        b=WvVa+ovd5StppJREwAr3JiPc2mlSsQbd5suTkS1Au/QZZj3L38tBsrNfhD138VVWk9
         jC2x2lMbs5yA7DAzlNHjS5LyubDXQcDfarR/VwksA6QvIVnh2akqy6TJxhPMDZFkbRl2
         Re6bhZZfyeudUfXg/bOMkINySRPr70RRgG5bjuYRRFS5T68bysvRpkKb2pspN/Db9VWg
         AcSyRVWwn3P+fiNH60tEVJRHygrwm1BJRmYFk1xZ478DzjPs8u3MTR0YIj2cxVB1JPzm
         tE5cWIH7CNzvnRyRY2g1d4HTBil2JdXSRopDKOlpHxBTR/TFciko8e6mZ04z9fGzF9et
         dwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+76LEhmQVtVbwUuq2qvswXIMQNELjwa8jYT8LCkNp0c=;
        b=CcoclmnWBV/wV6C6CYSyexpzoYzB98r9zrrf3txeWgQgHiHJ9lXD+N/uUAO4Zbiq+8
         y51A8teyX13EBnFPW3h3LCrDF+yHnq/MuO5NaUJOrnCFZzhQCaMQN6+n0Xm3Pg1y2kCt
         Z7LiiW8HzQGEk7jqNIglxwWwEvGNvJXcCI31U52Zj0+/2nOc+p+6fLYcye+i/D2IiOJk
         8w2z8s5VeolLo5Seo/XfOkTPD5MIX9a1dbOgKHtLDdm4wZ5fla3fUBYgfA5L8z6BCiEb
         GNk2dyJJyVb8YVYfNmDjJXTpZn1IaCE6UAiOuefEmCdoGbXoJyt3m4rzF/YEEPwbLY2l
         VPsg==
X-Gm-Message-State: AOAM531sTC0+NBFQ0my5oWL+kVsZEkW+iXZj8aW5H2uiekSyfTCQ8jjT
        0Hu9oPZN60Z7zM+Zdyxl0SV1/w==
X-Google-Smtp-Source: ABdhPJynT1SrcWhMhtjcMzeeIqE/f6+E7hQFk+hzymJ7Sy/E1j8F1S3HLkRGIbRau4xfLmAp5pZewA==
X-Received: by 2002:aa7:d687:: with SMTP id d7mr35827939edr.118.1617699102678;
        Tue, 06 Apr 2021 01:51:42 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id w1sm5393531edt.89.2021.04.06.01.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 01:51:42 -0700 (PDT)
Date:   Tue, 6 Apr 2021 09:51:40 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] backlight: backlight: Use DEFINE_MUTEX() for mutex
 lock
Message-ID: <20210406085140.b7zffcrkdquxxsxs@holly.lan>
References: <20210405101440.14937-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405101440.14937-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 05, 2021 at 06:14:40PM +0800, Zheng Yongjun wrote:
> mutex lock can be initialized automatically with DEFINE_MUTEX()
> rather than explicitly calling mutex_init().
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

This patch looks like a resend of this one (but with a different revision
number):
https://lkml.org/lkml/2020/12/24/229

A resend should always maintain the version number and be clearly marked
as a resend.  In this case, there is also a pending review comment that
you have ignored.  Given I also clarified when you asked (off-list) for
additional details I'm very surprised to see this patch circulated again
without modification.

I have repeated the feedback below.


> ---
>  drivers/video/backlight/backlight.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 537fe1b376ad..d7a09c422547 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -64,7 +64,7 @@
>   */
>  
>  static struct list_head backlight_dev_list;
> -static struct mutex backlight_dev_list_mutex;
> +static DEFINE_MUTEX(backlight_dev_list_mutex);
>  static struct blocking_notifier_head backlight_notifier;
>  
>  static const char *const backlight_types[] = {
> @@ -757,7 +757,6 @@ static int __init backlight_class_init(void)
>  	backlight_class->dev_groups = bl_device_groups;
>  	backlight_class->pm = &backlight_class_dev_pm_ops;
>  	INIT_LIST_HEAD(&backlight_dev_list);
> -	mutex_init(&backlight_dev_list_mutex);
>  	BLOCKING_INIT_NOTIFIER_HEAD(&backlight_notifier);

On Mon, 4 Jan 2021 at 14:19, Daniel Thompson wrote:
: the purpose of backlight_dev_list_mutex is (as the name suggests) to
: protect backlight_dev_list. It makes no sense to initialize these
: variables from different places within the code. It just makes it
: harder to reason about the lifetimes of the variables.
:
: To be clear, switching over to static initializers is a good change,
: but please change all three in one patch.


Daniel.
