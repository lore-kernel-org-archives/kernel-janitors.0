Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CC7C76195
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Mar 2023 10:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbjCOKUZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Mar 2023 06:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232542AbjCOKUC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Mar 2023 06:20:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B79F39283
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Mar 2023 03:19:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 43A4EB81DC0
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Mar 2023 10:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CF8C4339E
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Mar 2023 10:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678875570;
        bh=/ussKYXUoRi9/8f5OSHrM5/7XrSufnqd6npdfnXgl1k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g5b3UJMwsJ0jgNfnZ8uvE+Cz3Aq6R7LbcFB1deZ8Gfe7y7u12wk74cxWSGv4wz2f5
         WxVXTbjLcElg6MBn8dwjCCvTYpg6y7HwneGPbxlp758g2+OO4M2IhswAh8bE4uFTqy
         YvOL8fwLjb5YaCzJ6UfnlvFw+hCQmt6QfeA1L+oF4TClIlVxlsqKpzFnQNVigHjPdF
         Cd4rFRvPAfdtKr+MisifwPlO2Sed9HerZyh8zykS/jtgGHb8q7YQiZIicx8xa4AfLW
         eNhKbJ+3t+y8JmPi1kb6cQtQJpmCvuhs4rXDECXj+R43eNDNm5SzY9i1WiffKIxSfO
         Xjy8JDIoVy/KA==
Received: by mail-yb1-f180.google.com with SMTP id u32so11906685ybi.6
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Mar 2023 03:19:29 -0700 (PDT)
X-Gm-Message-State: AO0yUKV15p/usOhAsogSc3cH/7TFczpDzxmMqTHheKBjgXD7WMQfZLt8
        9AH21xgvxL0yEOtBaiLTy3kme/YhfrJ8pD0c4zY=
X-Google-Smtp-Source: AK7set/7traRT7mrw96UuGndfjQj//Zk/eGWzn/SrP0oE30xnYqD7NfDtcimPZPeVzTV2xDh4RspdgeRii7F+qBEE0I=
X-Received: by 2002:a5b:f87:0:b0:b30:8d4b:230e with SMTP id
 q7-20020a5b0f87000000b00b308d4b230emr9001232ybh.7.1678875568933; Wed, 15 Mar
 2023 03:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230314081812.26065-1-colin.i.king@gmail.com>
In-Reply-To: <20230314081812.26065-1-colin.i.king@gmail.com>
From:   Oded Gabbay <ogabbay@kernel.org>
Date:   Wed, 15 Mar 2023 12:19:02 +0200
X-Gmail-Original-Message-ID: <CAFCwf13FTaytTqoJ_C9zsSEKwuOsVY8+O52oCJH58+LRhy81AA@mail.gmail.com>
Message-ID: <CAFCwf13FTaytTqoJ_C9zsSEKwuOsVY8+O52oCJH58+LRhy81AA@mail.gmail.com>
Subject: Re: [PATCH][next] habanalabs: Fix spelling mistake "maped" -> "mapped"
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Yuri Nudelman <ynudelman@habana.ai>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Mar 14, 2023 at 10:18=E2=80=AFAM Colin Ian King <colin.i.king@gmail=
.com> wrote:
>
> There is a spelling mistake in a dev_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/accel/habanalabs/common/memory_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/accel/habanalabs/common/memory_mgr.c b/drivers/accel=
/habanalabs/common/memory_mgr.c
> index 30f8059f28c2..c4d84df355b0 100644
> --- a/drivers/accel/habanalabs/common/memory_mgr.c
> +++ b/drivers/accel/habanalabs/common/memory_mgr.c
> @@ -275,7 +275,7 @@ int hl_mem_mgr_mmap(struct hl_mem_mgr *mmg, struct vm=
_area_struct *vma,
>
>         if (atomic_cmpxchg(&buf->mmap, 0, 1)) {
>                 dev_err(mmg->dev,
> -                       "%s, Memory mmap failed, already maped to user\n"=
,
> +                       "%s, Memory mmap failed, already mapped to user\n=
",
>                         buf->behavior->topic);
>                 rc =3D -EINVAL;
>                 goto put_mem;
> --
> 2.30.2
>

Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next
Thanks,
Oded
