Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47529C433E0
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 20:54:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14EBF64ECF
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 20:54:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbhCRUx1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Mar 2021 16:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbhCRUxX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Mar 2021 16:53:23 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDAD2C06174A
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Mar 2021 13:53:23 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id t6so6156054ilp.11
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Mar 2021 13:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=s68C8LIdgYjQlZ/0tgmZ3vAVMCRZAxeZi191vbbXE8c=;
        b=IMCH+BPEYCZbthExzw9TtGwF9BOoqqFEm6l9HMOI/8j93YzVs1RzSZ2K+Tt86w5vEA
         saFpW7MppYZN+X/4S8GsfsF95GATNwHODDZJl8YUcxQHqZfGwtkCXNC45zKNGNHAJPnk
         y3mZoh7d7NVRJUfC0sIe6Zg/Sk2e7hpRp9jilOTEYTP6VKKviUBqnU7+WdQLxG5zfTft
         g4kf/rFHTJSm6/edqVBavsaZ1T7AqG3Q1WtObH6DkoJcZ+C8P1OLMmc7P7MuyXDAivup
         EzWoxdZP6a4kdGicJi2VnVF8rNld6hMpMgk4PHsyRchLjsLMS95UeHMVEoaSj5fJdKlu
         z7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=s68C8LIdgYjQlZ/0tgmZ3vAVMCRZAxeZi191vbbXE8c=;
        b=kftum0PcDgweN3vc7Nl8BpWor8HxphXbHtpCf3xfJHi4sbpIsRcQdKTVcJdSXHLK9V
         i/iZv8rJnBdYNy9E+y1fQb2dP2uEE93gRr2HkmDtDagKF1KJzRxsYHq3o5qMXIM8GJOX
         0o8cRBcE91JgJJFktM3RpaxYjO5qxi85bt2E1KhMUsQuvD2N2cnBVqm54wedpzH+uKcz
         lFCcoVTQZ8JCu/qIFhLb7KQbJ5lVQzsnaGly6wGVmyJlr7+EemcYQ5L/aeFVVybIKOfO
         43WcC9b6WZEsdKR6MjE/QR26woDYHj/vvxt9gLz+23nXoMnTt+/fA0Js2uUTAAw+1N60
         VQow==
X-Gm-Message-State: AOAM5334oJrV8s0XiL/EhluQpqEXou9hj45PVeevoxCZmn/FApDAOkvL
        /TjB/N56CZQG6Ab3rFNSSvUNJmXabShQJHbHU1hcny84KOg=
X-Google-Smtp-Source: ABdhPJwDED6/I/gkJmrS3PqeovPFYOo+mjfwEr+pWuJy5H218E/tvYL9hbTBrYk/zlgQK5tv0D9nylo4A9pIRy/HD4A=
X-Received: by 2002:a92:d5c4:: with SMTP id d4mr362293ilq.102.1616100803117;
 Thu, 18 Mar 2021 13:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210318151626.17442-1-colin.king@canonical.com>
 <13a1d187-4d6d-9e06-b94a-553d872de756@kernel.dk> <62cd71bc-86e1-412d-b2b9-716c0f8021be@canonical.com>
 <d32641ca-e34a-2bfd-9b86-28c95546f434@kernel.dk>
In-Reply-To: <d32641ca-e34a-2bfd-9b86-28c95546f434@kernel.dk>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Thu, 18 Mar 2021 14:53:10 -0600
Message-ID: <CAOc6eta9oSxwPKma9ERP+BoXpW=PGaS8pxWiKQ3nj6BoYAu_Aw@mail.gmail.com>
Subject: Re: [PATCH][next] loop: Fix missing max_active argument in
 alloc_workqueue call
To:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Mar 18, 2021 at 2:43 PM Jens Axboe <axboe@kernel.dk> wrote:
>

> If it's being redone, would be silly to have that error in there. Do
> we have a tag that's appropriate for this? I often wonder when I'm
> folding in a fix. Ala Fixes-by: or something like that.
>

Don't want to disturb the conversation that is going on there so I am
only sending this question to janitors. What is the meaning of
"folding" in this context?

> --
> Jens Axboe
>
