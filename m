Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5620C12002
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Jul 2021 19:59:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D02C860240
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Jul 2021 19:59:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236952AbhGNUB7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 14 Jul 2021 16:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241053AbhGNT5t (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 14 Jul 2021 15:57:49 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE4DC061794
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jul 2021 12:47:14 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x25so5563521lfu.13
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jul 2021 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wpYUDPD+jJFa/2N/K1bMkRrbiJB4ktLKot6CPD1nD6M=;
        b=d9X1AkkxxLd0ZqF7ENPdAZ7RzHjtfCRUal3ATbCVy9C01lTgr+XYPz97dBCPC0u17d
         Oee4489N1rN4EIQbTaADiwZ9iONnBd3u4ih1EiEIDsJZnPdEbKggqhrlqyGo3YmeNQmn
         Lv7q8lebn0Id8Mk+iQhS8bu0n5IlJRb+Bexe9JqeIqnh2tDKIjNSI2zqLMcKz/T9z0LZ
         VMMxKsX7PomW2xTwCtLLtf4LEURUWpSYQlfLUydIqpuKbqnfo8Bk8gfldzzwnioMrTnM
         SHHXoyzP3E9dzBllvwanZGYcfEILh8cwh1CcjtLU3E83KJTxS+kzt8Bx/Z5s9jAw9sNI
         vpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wpYUDPD+jJFa/2N/K1bMkRrbiJB4ktLKot6CPD1nD6M=;
        b=G5bXOPce3udeATX0UNd7od0UkLJ7NQHMDFu5pVPVjYNUqoaCsADyIf8ceyzIkQDyH7
         pgRkvBM3i/sJ8D8iuAloYlNddpsRXTRx+xUl+K0agKkH0JA9T0ObQXt2mBCX3O3foBro
         TaiRTI9D+OFeP1cbgV57+HMwxEW42LHGzfPWwdRPFd+v7Wnhb3GYAS+YjPR8IoGcYFho
         8bfU+D+AhdmvrA/TmRWldeuB1GHfAVrzjtva88EFzTylyhb+f+F57nBct8eaqx1PMIzM
         NiUfurdCm9MnY4gFK/0PDRp5ZuHa83QTk8FXiQv/dMxg7EXNr64x0usOGDm5Zwp21iyl
         tcCg==
X-Gm-Message-State: AOAM5331ghrZ9P1TicjLDD6XTp6o57RSlLdP6lFr2r3FqDjAZJI869Z8
        rmljE0033IO4b7onKxYYJDWna4qe2QsDHYTSARPeYQ==
X-Google-Smtp-Source: ABdhPJze67kG1uwUYVbJ6P9gS9Y103rENKreLrQvMcdWxBszP0piK2uRfZDFh75DLLud35kwXezLSncaGc+Ac8ILc4w=
X-Received: by 2002:ac2:4ac6:: with SMTP id m6mr9577331lfp.73.1626292032772;
 Wed, 14 Jul 2021 12:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210702044950.10411-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210702044950.10411-1-lukas.bulwahn@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Jul 2021 12:47:01 -0700
Message-ID: <CAKwvOdn0DPA2sk8MtmVa9shWDH7GL4t2X5K0V4T=+RnpUKJGOw@mail.gmail.com>
Subject: Re: [PATCH] gcov: clang: rectify gcov_info_add's kernel-doc
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Peter Oberparleiter <oberpar@linux.ibm.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux@googlegroups.com,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 1, 2021 at 9:50 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> For gcov_info_add, ./scripts/kernel-doc -none kernel/gcov/clang.c warns:
>
>   warning: Function parameter or member 'dst' not described in 'gcov_info_add'
>   warning: Function parameter or member 'src' not described in 'gcov_info_add'
>   warning: Excess function parameter 'dest' description in 'gcov_info_add'
>   warning: Excess function parameter 'source' description in 'gcov_info_add'
>
> Obviously, the kernel-doc's and function's parameter names slightly mismatch.
>
> Adjust the kernel-doc description to make kernel-doc happy.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks Lukas!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  kernel/gcov/clang.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/gcov/clang.c b/kernel/gcov/clang.c
> index cbb0bed958ab..214696e28ec1 100644
> --- a/kernel/gcov/clang.c
> +++ b/kernel/gcov/clang.c
> @@ -264,10 +264,10 @@ int gcov_info_is_compatible(struct gcov_info *info1, struct gcov_info *info2)
>
>  /**
>   * gcov_info_add - add up profiling data
> - * @dest: profiling data set to which data is added
> - * @source: profiling data set which is added
> + * @dst: profiling data set to which data is added
> + * @src: profiling data set which is added
>   *
> - * Adds profiling counts of @source to @dest.
> + * Adds profiling counts of @src to @dst.
>   */
>  void gcov_info_add(struct gcov_info *dst, struct gcov_info *src)
>  {
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
