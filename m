Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC016C001DE
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 Jul 2023 18:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbjGQS7S (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 Jul 2023 14:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbjGQS6m (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Jul 2023 14:58:42 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD641723
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 11:58:28 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4036bd4fff1so51721cf.0
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689620307; x=1692212307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuwZjqFiyEyrpXx4nOIByohm4B6LcWEoneOlaY2n7+k=;
        b=wUiYiLA01yLWEpdxzyYqGRSqVRUi04sm+faZToCIrlfHPCNAQlt7QG41Y0QWuMTAKH
         /BDf5sV6B8R5vb9SqAzB0u7yOHYusfjAHII+Xe3PasPxvkUp5ya66nuf/zMoPIDaI6AW
         uxAir/88AqLoA+cevKBfQN9VE5I9uvAqPpoobSZMnZGIGUJvPS//qaQqAamyex4MEauK
         jln8VICcQ+5C+0AAMWJwgJ3LRSthpYWBXn5nm7YJnwb08gxgMAO6eGTqbL7Da9yxYtVX
         aCUFyMJgpc8JOzIPRUZcjki73uwEUIeVoktB1Q5190fVH48sHdCvilKJGBby42o+/uOO
         mF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689620307; x=1692212307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuwZjqFiyEyrpXx4nOIByohm4B6LcWEoneOlaY2n7+k=;
        b=YhlDLz8iEQFY+eMA0ZBC3cFrHiYPezeWou106+d8nJabMtgabHR/dRVOfi92KmL1K5
         iaUS53XW9RoSKOd2hHAD12Yv7whOusDoCysEncvtqcddLSDffJK3ymSnfOQKzWGk+GQG
         4W0yJmZT1DZycB3q6toKtb1KZf3jWIH+KpLzV2AoubA10kDmqwEcG0Iy/WLM7f5W192N
         N6pnx/QwjQwSeftRKnpE49p4NUF4rQ4EGafW4uxIWfig1Z4q3hL9GTOJzdmMnLffLs2w
         sKD0xhWiq58wH9xnZ65J/W+lUTWT22IvhY6rQ2RGGHMEVCTMbXrjJ/mXr34a4MzrUa/G
         qkzw==
X-Gm-Message-State: ABy/qLbCalaS8DNhXtiPFId1lU9F2DlnvTTT7KRxIY987xWqhqrwTlCR
        buS/RCUhV2dh1PdtL0m1+tvI1hDw6VFk09Z2UaAyhg==
X-Google-Smtp-Source: APBJJlEEKxRtfuxj6VCiw8VVBii+GSyTsLHQqY6CjtN9MK4o17QPRiTIx3EzeHAVq8mJgGWI9jyRXiCsouXtvgyzeCk=
X-Received: by 2002:ac8:7dd6:0:b0:403:b1d0:2f0a with SMTP id
 c22-20020ac87dd6000000b00403b1d02f0amr32530qte.28.1689620307526; Mon, 17 Jul
 2023 11:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <858b140b276ceab52a84ce0d4f924b0c411560d1.1689618373.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <858b140b276ceab52a84ce0d4f924b0c411560d1.1689618373.git.christophe.jaillet@wanadoo.fr>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 17 Jul 2023 11:57:51 -0700
Message-ID: <CAGETcx91Vm60Os5fw7-kNQ6bGjYaPhOeEutyBy_GLQA62f6vfA@mail.gmail.com>
Subject: Re: [PATCH] driver core: Fix an error handling path in fw_devlink_create_devlink()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 17, 2023 at 11:26=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> All error handling paths go to 'out', except this one. Be consistent and
> also branch to 'out' here.
>
> Fixes: 74c782cff77b ("driver core: fw_devlink: Handle suppliers that don'=
t use driver core")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> /!\ Speculative /!\
>
>    This patch is based on analysis of the surrounding code and should be
>    reviewed with care !
>
>    If the patch is wrong, maybe a comment in the code could explain why.
>
> /!\ Speculative /!\

Looks okay to me, but I'd rather not much around the code for a
subjective preference. The existing code also avoids the pointless
put_device() and personally is easier to read (ok, nothing more of
relevance is done after this return) than trying to follow the
execution to the out and then realizing the put_device() is a NOP,
etc. It also means future changes to "out" will need to accommodate
for this path that doesn't really need the "out" path.

-Saravana

> ---
>  drivers/base/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 3dff5037943e..854c1fab742c 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2107,7 +2107,8 @@ static int fw_devlink_create_devlink(struct device =
*con,
>             fwnode_ancestor_init_without_drv(sup_handle)) {
>                 dev_dbg(con, "Not linking %pfwf - might never become dev\=
n",
>                         sup_handle);
> -               return -EINVAL;
> +               ret =3D -EINVAL;
> +               goto out;
>         }
>
>         ret =3D -EAGAIN;
> --
> 2.34.1
>
