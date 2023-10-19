Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F38BCDB465
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Oct 2023 12:50:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345513AbjJSMuh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 08:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345719AbjJSMuf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 08:50:35 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF3A19B
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 05:50:31 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a7af45084eso101558487b3.0
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697719831; x=1698324631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgCsPfoiWzS7Npy3uy7jn2QXfMh0UDn2YP8vyEnEgJg=;
        b=l2mY3yWF93gVMEwO/CJpYGP88Qp5PDj9CaGz1iatslmW7D0OGA/1sysaYJCuPQsUsA
         RQXFwWWhhewYlLgzp+QO4qlcluiRc06BvlIaQIusKKytcXDo+EMRmnESkdbGLzr2qCq4
         IzTfd/z6EVqLzr/rOxHYGNgm/3AjKAQknKm6RTn4n3jBZ37q+RpVoD0V5djCGeZqobr1
         sZ1SMvIjlTw9HMHB9jg/LC0Nt+IlgwbftjrqPSjFXFGZKrNqzY/vgIlWngZr4Fd9CB9t
         MoRPx+I33eZ6FuxgjAu04VKGZtgz8rNy7ReBJUEg4TeEUyS9/3mW/ayvTPdsjF3dBcxZ
         aeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697719831; x=1698324631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgCsPfoiWzS7Npy3uy7jn2QXfMh0UDn2YP8vyEnEgJg=;
        b=bhvU5x3hET9dJNfUgIDXrW4ztnFWP1K2Sr+VQc1GwtQYkiNWuj3CEPWgnAzHOGIOaB
         O0R4b2bd+Vf2DKgCLv2fmv+JOlScNqcLwCtlPmeElao5h15K7Cw0swUuAwmpBPqp7CET
         X/lKsxLimbPwzXPaK0cB1Hxxv/+MlH50d7mdVdflikz7XdOxmZbBfMND8EtKzqG6cvry
         tdDLpC2dZXdsZJYXgucLRLC2T86KPs0QP2WHWIlf3w7F74JixZI6mXOhvZuu74XiiR9W
         r0u2i9Rdv5qmBoBm/niq8i7TstKJpx8shnbMG0LuT48t5nEqY8ZnQ3Dr3YW86+XifBfB
         1ZLQ==
X-Gm-Message-State: AOJu0Ywdv6bEKzyI4AntZiWLlhnIEX7qGG31gGhUi60g+v7ZprMHo62R
        F8IU3Z08x3q/KDmnqI2N5c6Qk5URIRSuttlJ9g8mtg==
X-Google-Smtp-Source: AGHT+IGQEwYwAgp+N6q9s55Kz5kKcDMZy5XgiShL3QSPpYFPglL8R9uoRsbEDbrmr5GMaD6hw9ENsbVWj2rPe6uTm5s=
X-Received: by 2002:a0d:e882:0:b0:5a7:bfbf:1bc2 with SMTP id
 r124-20020a0de882000000b005a7bfbf1bc2mr1901234ywe.20.1697719830827; Thu, 19
 Oct 2023 05:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
In-Reply-To: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 Oct 2023 14:50:19 +0200
Message-ID: <CACRpkdbNOmvBg+wHLHcdvp=YE=jYiKKCVWDqs2cMF85rXyv_aQ@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 19, 2023 at 6:11=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> We could add that kind of
> thing to a todo list by using a KTODO line.
>
> KTODO: add check for failure in function_something()
>
> Then people can look on lore or use lei to find small tasks to work on
> or they could use lei.
>
> lei q -I https://lore.kernel.org/all/ -o ~/Mail/KTODO --dedupe=3Dmid 'KTO=
DO AND rt:6.month.ago..'
>
> Then grep ^KTODO ~/Mail/KTODO -R and cat the filename you want.

I like it! There are too many of these things falling on the floor.
An easy way to stash it on the technological debt hitlist would be
really helpful.

Yours,
Linus Walleij
