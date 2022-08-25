Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61B2ECAA24
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Aug 2022 18:01:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242796AbiHYSBe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 Aug 2022 14:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241057AbiHYSBc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Aug 2022 14:01:32 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B639E0D2
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Aug 2022 11:01:30 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id t12so279668wrm.8
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Aug 2022 11:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=V3rvlgPNKsDmC6UL5dXYZgk3cANtUxsUR90LqKgOAbQ=;
        b=a6PffmLt+X6pz4ybd2Ida2TTy6EB//YQIi59NlbWkZo+1IhI3DlfHtlSCUZMKoilxs
         AXa/bltqmk2GK6m5I7WWUWbA/bSHH81l4yL6Ti0Qz0dSRb4ohIPzKPjiMDmmfYVKvwHX
         eE0w3XkJSyYI/LNB+WneBeYxO37+MT1OxYlR7JkVCycOtILprZFng1ywVl6EEdb+r9z3
         d+GilnHv1cMTk3PiEAxyur+9vJX5TPfYM9mQFqjdhbZGEWlfxiWnxfrFsnuEngLUeU5A
         08gkkZD7c+WzIY6e3fifHlyc9xGPZWdwtPhfv/pstPL3OJed1JuzBjPQ6BvAIP1D6hEu
         uOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=V3rvlgPNKsDmC6UL5dXYZgk3cANtUxsUR90LqKgOAbQ=;
        b=Kwe7a31Jxa2B0Zin2y8yRaKNXFOcChYntDTl6O3/qoJxODOZW8mgtPuSyBECd15AFw
         YP5ZsA3NW05aFBexir/icb2/aAZRuKZiXSfQB7uCjKGNSjj5ZFAYv+GH3WUee3RRAvYJ
         YODYDkxakqMNfg4bB+LuTA+2ajXowVWt+58zR6FPWa/spqahbnGNa2iFBZpPyxMmUewP
         BJ9gyOnL5N9ECpoXtov9PogPI2wKGTYeEZdK4V7eGoaKKBWXriyguXEoqh3ttBiBY6nY
         qDMM2G5uo8SfGtUUs3kmdHP6Ve2Vpxig3oTCs2wdvAPSxu6YwduYfoWvgt/N0v0EUVcY
         pjTQ==
X-Gm-Message-State: ACgBeo0bACetWIsL+gyiJkDVuXCjNPTKNYrcwRISHGbsafmv8VMcco0P
        stLYSARK83Cllrr18xeg6MefuQ==
X-Google-Smtp-Source: AA6agR5sIba1irFAGNCFMqOXrLQiFUj+uRicgN0ULEE+D+0rOrfc8apRcnAGT9/SWC3oeu4qLWq1sg==
X-Received: by 2002:a05:6000:1ac6:b0:225:2e67:6ba4 with SMTP id i6-20020a0560001ac600b002252e676ba4mr3156298wry.321.1661450489190;
        Thu, 25 Aug 2022 11:01:29 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id r6-20020adfdc86000000b0021e13efa17esm21024963wrj.70.2022.08.25.11.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 11:01:28 -0700 (PDT)
Date:   Thu, 25 Aug 2022 20:01:27 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jamal Hadi Salim <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net_sched: remove impossible conditions
Message-ID: <Ywe495TKpyYuIWks@nanopsycho>
References: <Ywd4NIoS4aiilnMv@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ywd4NIoS4aiilnMv@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thu, Aug 25, 2022 at 03:25:08PM CEST, dan.carpenter@oracle.com wrote:
>We no longer allow "handle" to be zero, so there is no need to check
>for that.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
>This obviously is low priority so it could go to net-next instead.

It should. Does not fix anything.
