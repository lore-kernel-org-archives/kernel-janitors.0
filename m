Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47FBC433E0
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Mar 2021 18:43:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72F2864F3F
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Mar 2021 18:43:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhCOSme (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Mar 2021 14:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbhCOSmK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Mar 2021 14:42:10 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B99FC06174A
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Mar 2021 11:42:10 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 18so58443896lff.6
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Mar 2021 11:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8V+rz6dHaPmJOhTso7qaASysVmTy2044POg4ldMfuo4=;
        b=jRLwWt7H0Pi4ZkUjPDCFeT16PhziKfzVweJicDH6BGT2nG7Cy/kRDUnJPioZ/JnWAn
         bwgHa+chUnQvk59xxIJpUbENzw99d0R9GTDLDRPnq7XHtxvvh3s8n3EEsGXJXEYlq4et
         hqPq8AqYf1iKq9yb7kfKB8SBpScpb+CMlOGq43zaknms2PxRynqWw9cnj6tOZeMOT/OZ
         S+yqa58GRS2ncCJBI4rmykPvMeuhGIZ2yVsPGzrLNG/8dlSApnPsJSZAnMtr+s8t+P89
         QdohGlPsG8m0y7+qonqrmrEV7aad2z3vPHEkCLlF91M5LRQEe63Df/Tq1qlBqlp2pPGp
         8J5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8V+rz6dHaPmJOhTso7qaASysVmTy2044POg4ldMfuo4=;
        b=CcLxLt9xdGnov9nw/lytkphMumPAhomDAnWhoZorS4Z/MMKMylnauPi8ipz/rvrgOO
         id2wmZFq+zta1gMX5Tl/qO/BXqTonAWyTbqrdO2mbgNs6Te7PIvv85I5YzBlRMXyVJ02
         c8EjsQ3ho6KoufeGYL7IfVa7/lMGER/8ye4Iu0Rm8MneRQBvwoEFCgTy9QAyZ+V8O6NK
         GvAMdqo3kKGdVbUD8izlmd/ZVJ103sBJ0DD6IzfzPRhuhjf41I1hqpJ0khEEBWrtwYii
         6jnAhgDthAD60A8D0SiH+PBew1lvbuAlZ1E1iDUIZwHwalEG7EHGBdeaIwhxqeVVc+Rf
         QCJw==
X-Gm-Message-State: AOAM530tHQxLrzr4P8rY1VXuwpR6MbZXc6nJgHXi+1eFkJmzCc8YQDEN
        EoOCqjPLRTOPjIMAREADK1WzGEL8RJZv0c7FPzDeBA==
X-Google-Smtp-Source: ABdhPJz2wKAyWfvmM0JOI48gzt1V0Qdip+vbLcJCzgXWjWu8sJ4chylMWs3OtOsW0Qw0gKwjeJnLXJ3gpBLK9eXKm2M=
X-Received: by 2002:ac2:549c:: with SMTP id t28mr8490298lfk.7.1615833728903;
 Mon, 15 Mar 2021 11:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210315123303.10218-1-colin.king@canonical.com>
In-Reply-To: <20210315123303.10218-1-colin.king@canonical.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 15 Mar 2021 11:41:58 -0700
Message-ID: <CALAqxLW1VaMTVx3piKnLcEqWxMcQFG9LujH1ijHP2dbXBQaxqA@mail.gmail.com>
Subject: Re: [PATCH] selftests/timers: Fix spelling mistake "clocksourc" -> "clocksource"
To:     Colin King <colin.king@canonical.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, Shuah Khan <shuah@kernel.org>,
        linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Mar 15, 2021 at 5:33 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a comment. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Akcde-yb: John Stultz <john.stultz@linaro.org>

I kid, I kid!  My apologies and thanks!

Acked-by: John Stultz <john.stultz@linaro.org>
