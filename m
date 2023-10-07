Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42787E95A63
	for <kernel-janitors@archiver.kernel.org>; Sat,  7 Oct 2023 15:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343696AbjJGPAk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 7 Oct 2023 11:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjJGPAj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 7 Oct 2023 11:00:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0BAB9
        for <kernel-janitors@vger.kernel.org>; Sat,  7 Oct 2023 08:00:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAA8C433C9
        for <kernel-janitors@vger.kernel.org>; Sat,  7 Oct 2023 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696690838;
        bh=keinZ0UvciTgcQt4CrzG3bkz8RSc/FRdBJoIL/+LJ0U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=P0lCBSRZY2mOYYLM5wnlvJif11ooVBRbp1zqPcXEiO/uzHl/X7YCUsdu5RVQV8Mue
         nRl7OKddHQtoF5spxrO2cXIbz5Pege5V0LL9zs9b+lbcFLc6eonEkAAXeN0lFWG6GP
         xKJRm7mZNPZfTfNZAztBR+REkiHm/9ihp0D5JycDfLeIZgjleF8dPZhT4LktC+cFJj
         NzeRvMe72HzK7rdHYIfux1xLbjmt6Kjol6MLbdvwaEwJ2e5YCLrXzGPthtbGpFIU4o
         wQi1oeVywJGP3TjN1fAkQcHD49rtbIEFFCSe+zLsbChZCWiEyA4Ocz9BOY37SdFF7u
         DUBFQifV52ZFw==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1dcead29b3eso1946933fac.3
        for <kernel-janitors@vger.kernel.org>; Sat, 07 Oct 2023 08:00:37 -0700 (PDT)
X-Gm-Message-State: AOJu0YxbB7bU82289zYK2zAXarZ4PL+YhMWncUlkTvFH0vABtoOZRIl+
        Uestk28pewnIHNUy/xNUlCwyFykw0tiiex8uETc=
X-Google-Smtp-Source: AGHT+IEojU3eGG7fagC8NDw+cO4ShXd4E3Gk5AdrSOOupiJPa+zl+ASd1yE/jgt3tGv7uWd2Hug8Y50BKL+75aSdyTM=
X-Received: by 2002:a05:6870:854d:b0:1bf:e2a6:b287 with SMTP id
 w13-20020a056870854d00b001bfe2a6b287mr11454368oaj.0.1696690837265; Sat, 07
 Oct 2023 08:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <512670ff-bdec-487c-9bac-e6b52b4b1a5d@moroto.mountain>
In-Reply-To: <512670ff-bdec-487c-9bac-e6b52b4b1a5d@moroto.mountain>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 8 Oct 2023 00:00:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNATxBV9DaAimMduuR-C+_L=CSy5UyAE31gQ8h1xEj7B8AQ@mail.gmail.com>
Message-ID: <CAK7LNATxBV9DaAimMduuR-C+_L=CSy5UyAE31gQ8h1xEj7B8AQ@mail.gmail.com>
Subject: Re: [bug report] net: liquidio: fix mixed module-builtin object
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Oct 7, 2023 at 5:58=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> Hello Masahiro Yamada,
>
> The patch f71be9d084c9: "net: liquidio: fix mixed module-builtin
> object" from Jun 7, 2023 (linux-next), leads to the following Smatch
> static checker warning:


Why is f71be9d084c9 related?

I can compile lio_main.c as built-in even before that commit.


>
>         drivers/net/ethernet/cavium/liquidio/lio_main.c:810 liquidio_watc=
hdog()
>         error: NULL dereference inside function 'module_refcount()'.
>
> drivers/net/ethernet/cavium/liquidio/lio_main.c
>     800                 disable_all_vf_links(other_oct);
>     801                 all_vf_links_are_disabled =3D true;
>     802
>     803 #ifdef CONFIG_MODULE_UNLOAD
>
> This code is old and buggy, but I think it's possibly the recent changes
> which make this bug visible.  Modules can be enabled but it doesn't mean
> that this particular driver was built as a module.  I think we want to
> test #if MODULE as well?


I do not know because I do not know what was intended
in that code.

"git show 9ff1a9bad867215e4a7ceeef4e9311d1232902fa"
lists people involved in the buggy code.
Please talk to them.


This seems a fishy driver.
drivers/net/ethernet/cavium/liquidio/lio_main.c
is the only driver code that calls module_refcount()
and checks CONFIG_MODULE_UNLOAD.




>     804                 vfs_mask1 =3D READ_ONCE(oct->sriov_info.vf_drv_lo=
aded_mask);
>     805                 vfs_mask2 =3D READ_ONCE(other_oct->sriov_info.vf_=
drv_loaded_mask);
>     806
>     807                 vfs_referencing_pf  =3D hweight64(vfs_mask1);
>     808                 vfs_referencing_pf +=3D hweight64(vfs_mask2);
>     809
> --> 810                 refcount =3D module_refcount(THIS_MODULE);
>                                                    ^^^^^^^^^^^
> This will crash because THIS_MODULE is NULL when it's built in to the
> kernel.
>
>     811                 if (refcount >=3D vfs_referencing_pf) {
>     812                         while (vfs_referencing_pf) {
>     813                                 module_put(THIS_MODULE);
>     814                                 vfs_referencing_pf--;
>     815                         }
>     816                 }
>     817 #endif
>     818         }
>     819
>     820         return 0;
>     821 }
>
> regards,
> dan carpenter



--=20
Best Regards
Masahiro Yamada
