Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188D9C001DB
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Aug 2023 15:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbjHDPuG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 4 Aug 2023 11:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232122AbjHDPuD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Aug 2023 11:50:03 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DE849C1
        for <kernel-janitors@vger.kernel.org>; Fri,  4 Aug 2023 08:50:00 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-487203bfbc6so227281e0c.1
        for <kernel-janitors@vger.kernel.org>; Fri, 04 Aug 2023 08:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691164199; x=1691768999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6GtJle38GYNlw+gZNdG3pGleXzijHW2VDwwGhqBWf0=;
        b=AW5cXx0H8S0x5I+u2xfxfy1V7vR/jMhVl1HUEGEbVyMQepbBG7qwJSWaktQ6RUC0ry
         YWp/wcvzZRS0TmRJPYM7ge8Wunb/krBend8Sku8kZ9/XenVwDkKiznYril6qzO64JRls
         Q7dCK8fwLyw9HBdWcmAEtxT63VH6KCAnDDnSzC6QWOMes9rU+Bk9lh/QSwVUu/+Q9M3F
         yXe4ljZivaQrSG9TrCIM4df/WqKdrg0WjCIf3SXhO+Omc+9BDZvl7iaQ3gi46u/Wl8kv
         8M+yzJ6QwWSZYvFrole4BzasoQzljZn068wOxkBGwSzKUGLR070XifJVqziX33IlqbS0
         aaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691164199; x=1691768999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6GtJle38GYNlw+gZNdG3pGleXzijHW2VDwwGhqBWf0=;
        b=VaGDLrN64HxyCSI3lRsbDPJJ20AJxeWEQgU3vs44s3RjBqOAmrqmMZ5DfOsau+JL3n
         S4fai0nEgZ3lys6Tw++onFjswkomne490kuyKj2Xjy+TD3gTl7aZMZUB8IbFOJk9HoRf
         xXDrv6uJAwTh0j+1Z0XYAfECjlM334bvNEj1Q6vbpHJI99Sa1/Rp5dSxNzcVC0gvxYxk
         gAeDIui9fm9yqVSv341hxKBorVCqXi0oI4j7uF4qIh4Q3sJrSFSz+sy8gtJiDCNHc+F1
         4QX29pWMfa541qms4S8GvOhj2qqQWwX7Vp2++176MLzt7XqlSICaYzhSsnjhuV80Opwl
         QPWA==
X-Gm-Message-State: AOJu0YybTm8QQbwJMSiC1HNv1/WVMYfx6xtu0AvVQEKbPZj+gD1p0CTc
        rcP9Sntkg7E4vMWWN7sB+Hy3HpVDk2QZlQXD4GSerg==
X-Google-Smtp-Source: AGHT+IGtDHTDweDFtGPqweVEy6/Ojul8h7Go4cQI7kTAsF7TZW0t3PAPJCedcn9OpWUtmtIlxQmADQwpMGsPvotnBTs=
X-Received: by 2002:a1f:45d7:0:b0:487:1ae2:2ad7 with SMTP id
 s206-20020a1f45d7000000b004871ae22ad7mr1601447vka.3.1691164199316; Fri, 04
 Aug 2023 08:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230804012656.4091877-1-suhui@nfschina.com>
In-Reply-To: <20230804012656.4091877-1-suhui@nfschina.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 4 Aug 2023 08:49:48 -0700
Message-ID: <CAKwvOd=1pEE=pspfg7fcofYF5=eziFvcLJgC0_ohG7jq+rbVyg@mail.gmail.com>
Subject: Re: [PATCH v2] fs: lockd: avoid possible wrong NULL parameter
To:     Su Hui <suhui@nfschina.com>
Cc:     trond.myklebust@hammerspace.com, anna@kernel.org,
        chuck.lever@oracle.com, jlayton@kernel.org, neilb@suse.de,
        kolga@netapp.com, Dai.Ngo@oracle.com, tom@talpey.com,
        nathan@kernel.org, trix@redhat.com, bfields@fieldses.org,
        linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 3, 2023 at 6:28=E2=80=AFPM Su Hui <suhui@nfschina.com> wrote:
>
> clang's static analysis warning: fs/lockd/mon.c: line 293, column 2:
> Null pointer passed as 2nd argument to memory copy function.
>
> Assuming 'hostname' is NULL and calling 'nsm_create_handle()', this will
> pass NULL as 2nd argument to memory copy function 'memcpy()'. So return
> NULL if 'hostname' is invalid.
>
> Fixes: 77a3ef33e2de ("NSM: More clean up of nsm_get_handle()")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Thanks for the patch! And thanks for checking clang static analysis reports=
!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> v2:
>  - move NULL check to the callee "nsm_create_handle()"
>  fs/lockd/mon.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/lockd/mon.c b/fs/lockd/mon.c
> index 1d9488cf0534..87a0f207df0b 100644
> --- a/fs/lockd/mon.c
> +++ b/fs/lockd/mon.c
> @@ -276,6 +276,9 @@ static struct nsm_handle *nsm_create_handle(const str=
uct sockaddr *sap,
>  {
>         struct nsm_handle *new;
>
> +       if (!hostname)
> +               return NULL;
> +
>         new =3D kzalloc(sizeof(*new) + hostname_len + 1, GFP_KERNEL);
>         if (unlikely(new =3D=3D NULL))
>                 return NULL;
> --
> 2.30.2
>


--=20
Thanks,
~Nick Desaulniers
