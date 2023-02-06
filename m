Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9A0C636D3
	for <kernel-janitors@archiver.kernel.org>; Mon,  6 Feb 2023 18:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbjBFSjQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 6 Feb 2023 13:39:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjBFSjN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Feb 2023 13:39:13 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCAC2DE59
        for <kernel-janitors@vger.kernel.org>; Mon,  6 Feb 2023 10:39:12 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id f15-20020a17090ac28f00b00230a32f0c9eso4747876pjt.4
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Feb 2023 10:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BrOsycn4q5Ivo7Qibu9w2XzXja/qtNtVTTbLAWUghEw=;
        b=gRUElMhMQjOsoYjJ+3e3mfQ/iFIKZKX3YIeatKgRpMVnav55bWaSgeTsuw5NbJTjTf
         Uz1WzkbEErsVOtpJcg+nmIVhFu1Z5nOgKgOusL5Ym/JO7cfnusvBH5z/vIU8qRBHwdNu
         HjkT6XKFyssmM3nixI6ScgFFPRGolvrvMUIO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrOsycn4q5Ivo7Qibu9w2XzXja/qtNtVTTbLAWUghEw=;
        b=kB2/4jyZt0XTF3kqeYoUBh1nSxgHuFYHdSJmaJUGq5nRS0b08Hmel/ZMy9pGVyNNCw
         /zFVpLkKP8MyAb0c+rqHzUhcEXo18hcw4PvROysDHQdKuH1wTIcHw1vVxquUV407vyZQ
         k0f1nxhBvNJXqfktoHm1stvHVrKRqiOovEeycAfnYdBZVlBRA9ixSAy2VJxfPDBxKp3T
         oPB6YufRnWoQF81VZrOjzqhJ0j2qP5oa2Q2XSEyNN9OSlt0jXWRm0A0j+dt42XMiY8kH
         aSiJ76pZOPGTJe40j+sm0NXIcNXirbkN2ofxbrEdQPqudmGrdMWN3eC7iQDOAkNe+62t
         ZylA==
X-Gm-Message-State: AO0yUKXVgAiBM74gV2e881ALKyg90LN6N6qzASOv6YAKmy5b9fn/GGvq
        unRJQ62gFnaxVI/S1q/fwLrm9w==
X-Google-Smtp-Source: AK7set9mkZdcs9z8Ws58hXnNJqldxEE4WUQa+6Cq/BAca9sfucyW25ikZx7HQ5xiE9bYttINglR1CA==
X-Received: by 2002:a17:903:2284:b0:198:dd3f:2829 with SMTP id b4-20020a170903228400b00198dd3f2829mr17069412plh.21.1675708752519;
        Mon, 06 Feb 2023 10:39:12 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ja18-20020a170902efd200b001990a94a487sm3268792plb.293.2023.02.06.10.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 10:39:12 -0800 (PST)
Message-ID: <63e14950.170a0220.8989d.5748@mx.google.com>
X-Google-Original-Message-ID: <202302061038.@keescook>
Date:   Mon, 6 Feb 2023 10:39:11 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Jamal Hadi Salim <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jiri Pirko <jiri@resnulli.us>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <simon.horman@corigine.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: sched: sch: Fix off by one in
 htb_activate_prios()
References: <Y+D+KN18FQI2DKLq@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+D+KN18FQI2DKLq@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Feb 06, 2023 at 04:18:32PM +0300, Dan Carpenter wrote:
> The > needs be >= to prevent an out of bounds access.
> 
> Fixes: de5ca4c3852f ("net: sched: sch: Bounds check priority")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  net/sched/sch_htb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/sched/sch_htb.c b/net/sched/sch_htb.c
> index cc28e41fb745..92f2975b6a82 100644
> --- a/net/sched/sch_htb.c
> +++ b/net/sched/sch_htb.c
> @@ -433,7 +433,7 @@ static void htb_activate_prios(struct htb_sched *q, struct htb_class *cl)
>  		while (m) {
>  			unsigned int prio = ffz(~m);
>  
> -			if (WARN_ON_ONCE(prio > ARRAY_SIZE(p->inner.clprio)))
> +			if (WARN_ON_ONCE(prio >= ARRAY_SIZE(p->inner.clprio)))

Argh, whoops. Thanks Dan!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
