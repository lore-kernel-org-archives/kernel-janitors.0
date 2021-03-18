Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEEDC433DB
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 21:12:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E1B164E98
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 21:12:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbhCRVMR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Mar 2021 17:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhCRVLw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Mar 2021 17:11:52 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDDFC06174A
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Mar 2021 14:11:50 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id z136so3836699iof.10
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Mar 2021 14:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S9HbkKo29c9l9UXTEQf/KaDb2lV6WQ6OPHcOP3KrV1g=;
        b=Tn7i2h1L/zqM3MOcFIXAHt9ZHuKcfDetzGucdZIurCekl+s2QmtTlWtz2P3SNE1Kke
         8YU0SGqK/IuYy/MZmS4CcxlKrGoJrOlDZcwLl15J3RdWLrRQnIf+ZSt9zMptl2RBsO93
         I04ZZFE23eCl91irJwy6jWf2+pgjw2fkvbW7E14aJH06iO5g/FSstyWIaRawn45PIPCz
         fVYb3Wx2i0FVSg4Zu/nn0wkGqSBMqgZrvrd+96G2XG0XXwWEF9ZOWwOeUgF0WtoOwQTa
         fZ3umAYnNv0EcJg8qWCdpgQaFP/nnh3Ze81dTTklsmishsnUSL4FdIqESi8HDqZtumLx
         I7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S9HbkKo29c9l9UXTEQf/KaDb2lV6WQ6OPHcOP3KrV1g=;
        b=mvTk4TJesn7QL9QgrTYiNNwxCgsXkbPeTMr77v9zYHFOHG2AF12a6ZTMBfwtZRCZhG
         f1AlcnMvsiCRnc1q7EZ0mIWCrUKBdDVRk9ojTLx6Y60/HKtLRQO97edkp2j2Y3XDrVLB
         pl7yyWL0Hvt2qesKGsdZN1N9QzMCNqraICqRy/rorrnXgxfhirXrKjXurRG7jsRSZGbi
         RTYh1C74fxAW/qD9DXFM8B64/O1Ls7HldB69cl79H8f9Y+qeQGKJJMDIFb+Wobh5lPAD
         RuHo9gyqIrXJtD1bDBDj9nvpGqQKnSqImyOZY6UJxjOj+TNLVxvNoySBBOfdG+QhLlI/
         11Yw==
X-Gm-Message-State: AOAM531M1zR1srw/LHqlgJ4f28tc9qtXXmzLnmMSR0OjmS6cc2V/dZL4
        pnCkhoZpq/b3NZ3lZyV78APlc4iexgqKEV4jJ9Ha87AG+QI=
X-Google-Smtp-Source: ABdhPJwutqQ8dfWuFhKOSOvM8yAS83dyuM2YAuXW4KaD+JCxdX0+WXboo+pQsiWcZxxkYVVoGdw1rvPQxPlLyDmi6nA=
X-Received: by 2002:a6b:5c0d:: with SMTP id z13mr424239ioh.6.1616101910261;
 Thu, 18 Mar 2021 14:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210318151626.17442-1-colin.king@canonical.com>
 <13a1d187-4d6d-9e06-b94a-553d872de756@kernel.dk> <62cd71bc-86e1-412d-b2b9-716c0f8021be@canonical.com>
 <d32641ca-e34a-2bfd-9b86-28c95546f434@kernel.dk> <CAOc6eta9oSxwPKma9ERP+BoXpW=PGaS8pxWiKQ3nj6BoYAu_Aw@mail.gmail.com>
 <alpine.DEB.2.22.394.2103182208470.2984@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2103182208470.2984@hadrien>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Thu, 18 Mar 2021 15:11:39 -0600
Message-ID: <CAOc6etatjKVU16CfB0LwFfBCbtdqSUVRnyhOZwjsvds8vKEj1Q@mail.gmail.com>
Subject: Re: [PATCH][next] loop: Fix missing max_active argument in
 alloc_workqueue call
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Mar 18, 2021 at 3:09 PM Julia Lawall <julia.lawall@inria.fr> wrote:
>
> I think it means that someone other than the main author of the patch
> provided an improvement.

Oh, Ok! Thanks!

>
> julia
