Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848A4C77B73
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 09:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbjFFJju (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 05:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236858AbjFFJjg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 05:39:36 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B404010D4
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 02:39:30 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f736e0c9b1so27572285e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686044369; x=1688636369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3pcpf/nfQVH5o9facm5XUNp2bt00pqpfnjAL4iH2IMM=;
        b=beJ6GCQJb6JI6oKdiz3NKI8YCeSybCSjnTfoMc6HKJ+Vn97C++pEV6NF7CuVSQK3h7
         H0v/X+EeDg6g5qSw3LBfJEDMPnM4sUJ3zI0DjC0TM5iFqSiVsYtfhMEiT9qj/OlWvoZo
         fvj0qg+g2gfZ7QaGwlNJ2PURIbTejfYjWqohWjPbyZgyMcb7QdzNf8RCPfD430gj1ge0
         m7+rjaO1G+fG0HXd4KNAyAbHTuxYhjd4cRPOhVDeau3J+Qve5Dp1Q3ScesCl9hQQkwjF
         qDDT6AOp0nGQlvttdWB0ODcxYD22wNNWlne6INISoTasGpf9nMznWxXTznN+v2GLhejj
         ePQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686044369; x=1688636369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pcpf/nfQVH5o9facm5XUNp2bt00pqpfnjAL4iH2IMM=;
        b=I8sYyizya+AXqDySibR+9vu8UKER+2iBbjCJvrGmb6X/7w73JPJuO90f84iExBHbRX
         Fsbqr7A8HN+7Xek7lU7EDI06EpJt86qmqHM5xW43b8CjIrofGYuD/ue2BhUc+hrL+L/o
         SCdTrJ9ZCKjKAggT/rVfzK69s1KIlvBaVc0MRQyBvefsxAdPfTcXt5kEvIyRt8aMfU1P
         fNvzxUndLshtYLpat1GchPJCHcUXuUilN5hnGFJuknQ0AEFsGOiI5xL5pTDn8sxU/5q7
         z3U31WzJybmyIAMHF4IHL/vdFyijdfIxi1iHWJM5xHjjWR+xcMXH89jZRXBwH3qKUWDx
         D9NA==
X-Gm-Message-State: AC+VfDyK/Q0uBJpQQit2/ykDIr0MW/gEmQWFwwtnxgfqoJvGNpkX2gWq
        FyIqgmxbsXSju4/0MMxnMc/Gwg==
X-Google-Smtp-Source: ACHHUZ41HJ6rW3Fz/mRlF/N2UzQtVkUG53X11gx31hlxm3xq9Lx8k1QIH1/a7kpTIkj1up6tOyzTgw==
X-Received: by 2002:a05:600c:3783:b0:3f5:fb98:729e with SMTP id o3-20020a05600c378300b003f5fb98729emr1634542wmr.22.1686044369181;
        Tue, 06 Jun 2023 02:39:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k14-20020a7bc40e000000b003f605566610sm16972165wmi.13.2023.06.06.02.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:39:26 -0700 (PDT)
Date:   Tue, 6 Jun 2023 12:39:24 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Michal Simek <michal.simek@amd.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clocksource/drivers/timer-cadence-ttc: fix a signedness
 bug in probe()
Message-ID: <afedc49d-7a6b-40ea-acee-744d92718f3e@kadam.mountain>
References: <ZH7rMgjh+z3TUKGu@moroto>
 <0cc62a35-8dcc-01ad-8db1-e9a1ee2f4e4b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cc62a35-8dcc-01ad-8db1-e9a1ee2f4e4b@amd.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 06, 2023 at 11:26:20AM +0200, Michal Simek wrote:
> 
> 
> On 6/6/23 10:15, Dan Carpenter wrote:
> > Make the "irq" variable signed so the error handling can work.
> 
> urq_of_parse_and_map returns unsigned type.
> 

Ugh...  You're right.  This is one of those return zero on error IRQ
functions.

> include/linux/of_irq.h:118:extern unsigned int irq_of_parse_and_map(struct
> device_node *node, int index);
> 
> instead of this condition should be fixed to
> 
>         irq = irq_of_parse_and_map(timer, 1);
>         if (!irq) {
> 		...
> 

Sure.  I can resend.

regards,
dan carpenter

