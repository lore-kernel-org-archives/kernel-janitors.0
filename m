Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF4AC433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Oct 2022 15:17:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiJNPRR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Oct 2022 11:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbiJNPRP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Oct 2022 11:17:15 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5FD1D0D44
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Oct 2022 08:17:14 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id m19so7675483lfq.9
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Oct 2022 08:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WwxuOfQonPyZlcMVaIzYc888hy9RbTZz1aHvp61ggEE=;
        b=MmLd+LMxFfVeOrhyNp7/ihG+a72N/cL5j49yO4JMkaHDP1TF8wQk1BchzbxHuC+eLC
         YOC+pZWkaCNgVlifQqHSZd3gkPf97jeYkCK/4PDxN2za/cT2V7nvzmCvsvNZri5AxQOv
         kGDS7oo4ExmqnfhNXElEdEo6vrysQ9/8TDjUIbTBV/Twd901K5Esu+la7R6cpKLIkFAP
         fNP1qBsI40rgX1JGnakDIAthxT3Lrh3CYlz3Vbwf9q4NY4f+pFI7mt9jQ3YlX+AolXfC
         kRlOfUj907z2e03cfJABK27BCI9WyjIA6C8W/sTSSb8KJ08Sly9XqYotsagilHydQXl6
         3zDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwxuOfQonPyZlcMVaIzYc888hy9RbTZz1aHvp61ggEE=;
        b=enxDrxmv07/4RMqgXPLLOMeCq2tXnKm1iYt5exVhmd1CQlDfcLqBkzQMBVHDAX4Cpl
         KWcPK8hlvi1vVWV61qnKcg1LTXqdHClR59G52J88O6/+vXKwUDiT7YOocKpE7v/lbNeb
         5ujvEQkr4Ngsdme1ay3zXEFy81XghEBJasFtnpT4H+gdStE1NPggMF39fYOME4kAD06g
         ElKHiJILrtcHvmJjQbaTxSkPhBqg9/3sFg80wg+0iXToTDLQClWz8hBPV/mBSuFFc7Mi
         i6nl9vBJxO6m2JHQJVT8sDgK/SYu9+X0LLtt2yzZ6wnC7vIBQ05QmktDUf9tZ1bz3s6L
         hkfw==
X-Gm-Message-State: ACrzQf3Fum1Qe8Ix4jZZmUMZcQ1M6+qxt9fTFnQXZ4XLWIvPsUwt7qwC
        M6UE0CK71UV33Z0bCDzz1KA1J2OMKRHnNncV3xeR8Q==
X-Google-Smtp-Source: AMsMyM7GA56OYnmfotbnpWCG+IXiPGMM+flkKnNgBV599ZwkwAmwY0SVoIcIWJpRHEKaZA7bpldirYRCjPi1azt20Do=
X-Received: by 2002:a05:6512:4019:b0:4a2:f25:4214 with SMTP id
 br25-20020a056512401900b004a20f254214mr1869456lfb.94.1665760632270; Fri, 14
 Oct 2022 08:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <Y0kt1aCTHO4r2CmL@kili>
In-Reply-To: <Y0kt1aCTHO4r2CmL@kili>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Fri, 14 Oct 2022 08:17:01 -0700
Message-ID: <CAGS_qxphzSn+ixxhnb2hEhVVye9hD6qSxdJV0vC-d2pGkERhTQ@mail.gmail.com>
Subject: Re: [PATCH] kunit: update NULL vs IS_ERR() tests
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <davidgow@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 14, 2022 at 2:37 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The alloc_string_stream() functions were changed from returning NULL on
> error to returning error pointers so these caller needs to be updated
> as well.
>
> Fixes: 78b1c6584fce ("kunit: string-stream: Simplify resource use")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Daniel Latypov <dlatypov@google.com>

Thanks for catching this.
This patch seems like it updates the only (direct) callsite for each
of the funcs, so I think we're good once it goes in.

I also tested alloc_string_stream() failing, and the output looks good:
Could not allocate stream to print failed assertion in
lib/kunit/kunit-example-test.c:29
...
---[ end trace 0000000000000000 ]---
    not ok 1 - example_simple_test
    # example_skip_test: initializing
    # example_skip_test: You should not see a line below.
