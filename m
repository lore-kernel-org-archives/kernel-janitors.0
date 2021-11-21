Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145E0C433FE
	for <kernel-janitors@archiver.kernel.org>; Sun, 21 Nov 2021 23:37:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhKUXk6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 21 Nov 2021 18:40:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhKUXk6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 21 Nov 2021 18:40:58 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1EEDC061714
        for <kernel-janitors@vger.kernel.org>; Sun, 21 Nov 2021 15:37:52 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso5637426ota.5
        for <kernel-janitors@vger.kernel.org>; Sun, 21 Nov 2021 15:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NyYOvvsaAIgLW7cvFAmLIlCUPt6c1jGipU6WKm7U5Ng=;
        b=aR/Lj+d3qGsvzxgSXtWSGxaR3hG/WC6IcRuF5sSjaNO9oXXXAqbfqUUSm1kD4dQasO
         wVw/KnUhc6eOHpUZaLxj4iIO9eJzmi+AdLCCzibIO+a91fb1C+/IejEs1UXAWlR4Jg7v
         inmUq1C9uZfewOTX/S1Kw5km5m6jT38MNkRtyalvK+RXwTgh/kCCBhS8Ripno8JzF9/W
         or0K/iHTUBG93oHWExuhPAnE2SqNpC+vfq8y4PWLaoMF5OyonX7R0oTMVzSxv21v+Hsi
         bJrkur++dt2Ygwih2FvEgyX2iSH/tppzKclTehdMi2/oWYi3yvd5gi4zlSv5jlVQUJWX
         Ae7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NyYOvvsaAIgLW7cvFAmLIlCUPt6c1jGipU6WKm7U5Ng=;
        b=nsxGLwuBpfw/yqK2W/cuz6D4ZjeHdz9PcYeFVw5zL3+v8j8vb6/hYpRRz0qoZ+iTTo
         G0CnpbYJoGTD8bIyQGLUYMGi9qMdna4WrYZWOwM5KWb7atctEZipAu6a83zoZbtLK+7f
         33EgZcsvC7ApO6sxufYZifwmIN5CdwQa7j2La/5ZtE7wmD4DllRv0mmfqGI8UMlkBADj
         7ENZTPpBuryOFbbvQHT6pYddjxFQMXOFXiT0PgnRj8SCw7kI3zB/ZCh6SIh1/ggGZhZ6
         fA+d8kUuA2RsuIViIp8TWQrmY2+d6j8IG4qDk4hE0HUPPR2CDwTvHBMk8Tm75udu6nIO
         eBeA==
X-Gm-Message-State: AOAM533ozgSt39IrxH2nLT/EcjvPHVspnEoSwbfx9UiG+xQ8x2EAXzre
        nhuBRlkA8Jbr+4jXoHcrQnz52TDpkqc4ZwTvxmZe4Q==
X-Google-Smtp-Source: ABdhPJyqL0ofQJzAhskSuiogIcxhR3TLgaafImtSYOes3MSoY3O0dXFJ6HanC00mDsHa2VXyOiQ4qvRLvXgLlLDmi80=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr20028716otl.237.1637537872291;
 Sun, 21 Nov 2021 15:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20211117072604.GC5237@kili>
In-Reply-To: <20211117072604.GC5237@kili>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:37:40 +0100
Message-ID: <CACRpkdakVEfLBLZfyG1mc+kJtVOewDAV7wuZEVUq+6NSkLLHrw@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: clk-icst: use after free on error path
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Nov 17, 2021 at 8:26 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This frees "name" and then tries to display in as part of the error
> message on the next line.  Swap the order.
>
> Fixes: 1b2189f3aa50 ("clk: versatile: clk-icst: Ensure clock names are unique")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
