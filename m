Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0912C25B45
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 18:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjJWS4U (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 14:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjJWS4T (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 14:56:19 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E619102
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 11:56:17 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507b96095abso5429934e87.3
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 11:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698087375; x=1698692175; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iy/DV1+W1aTRYizOwSs6mzRycpuJfFfCR+p5jl4zqjA=;
        b=CRSN5XPJlqt0+eykqh2YRN3OsOEf3uquktFMU+XSVuq5hIlYRxTHLtgntJJQaV94a1
         RfeDr6yex8B+2mw+OX8h+XzvHDEFiDzbTcCkpJVgM7aiVRI4wWEL0/P5jEn6UphY52TA
         00//kjMq/RG6tC8Iy/WtKdMuRIUg9SyY1bbrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698087375; x=1698692175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iy/DV1+W1aTRYizOwSs6mzRycpuJfFfCR+p5jl4zqjA=;
        b=xFeDg/cOh0+gfoYuhFbrKmuitFKteMjOUvFWWm+NzFwfZvM8Ss4ygHy4Fn9W+m9WRS
         /jCN4etM93M3vZBh5hR1FLJKJuBga0AUpDj0LpKc5mEibnuWUpQxxWBFBmjerQ5l5QXP
         hiB89IJgFqv6aXJwqYUCNFd5kg4t7oM+nA04ApAUpHumvpPXqjyVsUkGb/qhOpegmaOE
         NFcLRxbYHTvD9pIpPUenwrZSwXiuRa/SjeX1T9/BXX8l+d7zdpGv0aMKBn4tZqweSE+X
         x6w5RsPS++7FG/eUQteFtiyGTELuBgN7UTrjxerkMWTDp4vyKKpZda21Q/3xFTuaGNJ6
         wEJQ==
X-Gm-Message-State: AOJu0Ywer+lU//qw6X94wNnmNVnnZvWRmj1JLhKQ8jCkb567Y+Awnk8J
        zCBgy6FhiHfteye/DA84LKdidHs7evpB2NW6NGI/gw==
X-Google-Smtp-Source: AGHT+IE1FdMrGpyIJ/JJwoWibjFbddvghMjcXsQn/Yf9vQhO5TBIorHMLkXGJCJrBdxAhCyNOLRHBg==
X-Received: by 2002:ac2:4988:0:b0:502:fdca:2eaa with SMTP id f8-20020ac24988000000b00502fdca2eaamr7167322lfl.52.1698087375446;
        Mon, 23 Oct 2023 11:56:15 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id d15-20020a056402078f00b0053d9f427a6bsm6725463edy.71.2023.10.23.11.56.14
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 11:56:15 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53ebf429b4fso5627770a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 11:56:14 -0700 (PDT)
X-Received: by 2002:a50:c35c:0:b0:53d:b6ac:5f64 with SMTP id
 q28-20020a50c35c000000b0053db6ac5f64mr7256172edb.18.1698087374654; Mon, 23
 Oct 2023 11:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain> <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
In-Reply-To: <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 23 Oct 2023 08:55:56 -1000
X-Gmail-Original-Message-ID: <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
Message-ID: <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To:     Andrew Morton <akpm@linux-foundation.org>,
        Konstantin Ryabitsev <mricon@kernel.org>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
        outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 23 Oct 2023 at 08:49, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> Well here's a task: write a bot which follows the mailing lists and
> sends people nastygrams if one of their emails is more than 95%(?)
> quoted text.

I think that might be better off as a spam filter rule.

Don't make it some after-the-fact "trawl the lists". Just make it a
bounce with a "you quoted too much". Same as the html avoidance.

Make it ok to quote 15 lines of commit message for a "Reviewed-by:"
kind of reply, but if it's more than 50 lines of quoting, trigger a
"at least equal parts new message".

I'm sure Konstantin has nothing better to do...

                Linus
