Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D23BC352A8
	for <kernel-janitors@archiver.kernel.org>; Mon,  4 Apr 2022 21:27:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382415AbiDDV3i (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379839AbiDDSQY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Apr 2022 14:16:24 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BC03EA8F
        for <kernel-janitors@vger.kernel.org>; Mon,  4 Apr 2022 11:14:27 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id c15so14005253ljr.9
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Apr 2022 11:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jA9O88Cl7Cj3DV9YqV3pxHKzHcpN0w127uH0DJrDu6A=;
        b=cSyT5s8jfuk/1JR9/fI/Gqs9xQ74yToQSFVeEVZE16CzTs4y1cTOu7dQy0iEotcwpp
         QXie2PHfvs7leMvJi+X5kQ9GgPivCzeYCJMWlKDtfiv2fOJIgHccPOImyRc3tPvaXTWK
         I8gGR4josMrjK3iFj9rmn3/SieCQXjuOAEUL34WHsC4u4g2N1HZD+eDal9zVcALYiNGD
         z97IvYhjqplonvMwwlZxugT2/f2yTjszKbrnzmJxMKd/56uQxqNMRguv/Obf8GOX+7v/
         dUVZIvh+sRDUDSFPb/VkLSB7RsQkgdLAVyXMGApGh89rPO6CofiKvMSSLJXP4dWDEbfD
         A3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jA9O88Cl7Cj3DV9YqV3pxHKzHcpN0w127uH0DJrDu6A=;
        b=n0OkBnV7SH9+dOmv1+rUD0x9LEN5kJt+lT+85SNtFL93X2ZNzkmQnw0BvVa0bVJ4YI
         P73spvZTlZWxvuYzTlSeBk7Gk4lusXJBbo1OQiceWpXbW0W5wkc9WCmWPQEIce9i4wSh
         Sm5b8g/4imjSMTLjSVclJ4O2qn4J28pXogaOjDnlr9pvI9RKn98zBrhW8aJA8moUQ5a4
         5sRVtbmZqPA2WcY4VM++bNibTzhyF1+yksD4muUwV28JTirG6D8MAUoBcSNpZM9lJekl
         o+jJbafV6APosI9hgcq9A0A+nauvmV2igNk/vwwX9WHDriP6sKFik/IMOmGPaDwvwvzz
         0lcw==
X-Gm-Message-State: AOAM533kTWGXYURKa4w18G9jnXSh5Bl7a8luoM6/p0koY1w5+FpwpcRE
        cEdpXqFp9xVacMKA9DhDUnKt25CgM6omnQWlR2GUMg==
X-Google-Smtp-Source: ABdhPJy6X4VfItY0Exvmm9zT3KLeOkR4u/yRf3ZAF3nadtPeZPD3a5V5gvnOVvP+rwxXW2K1ofGissW4GbSk2e/aaR8=
X-Received: by 2002:a2e:611a:0:b0:249:83e5:9f9b with SMTP id
 v26-20020a2e611a000000b0024983e59f9bmr546393ljb.165.1649096065187; Mon, 04
 Apr 2022 11:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220318003927.81471-1-colin.i.king@gmail.com>
In-Reply-To: <20220318003927.81471-1-colin.i.king@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 4 Apr 2022 11:14:13 -0700
Message-ID: <CAKwvOd=jyrdkMHPR3ZNQHattOxXcS1SseAHvrXWQC2H6tDB-Xw@mail.gmail.com>
Subject: Re: [PATCH] scsi: message: fusion: mptbase: remove redundant variable dmp
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Sathya Prakash <sathya.prakash@broadcom.com>,
        Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
        Suganath Prabu Subramani 
        <suganath-prabu.subramani@broadcom.com>,
        MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Mar 17, 2022 at 5:39 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> Variable dmp is being assigned a value that is never read, the
> variable is redundant and can be removed.
>
> Cleans up clang scan build warning:
> drivers/message/fusion/mptbase.c:6667:39: warning: Although
> the value stored to 'dmp' is used in the enclosing expression,
> the value is never actually read from 'dmp' [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/message/fusion/mptbase.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/message/fusion/mptbase.c b/drivers/message/fusion/mptbase.c
> index e90adfa57950..9b3ba2df71c7 100644
> --- a/drivers/message/fusion/mptbase.c
> +++ b/drivers/message/fusion/mptbase.c
> @@ -6658,13 +6658,13 @@ static int mpt_summary_proc_show(struct seq_file *m, void *v)
>  static int mpt_version_proc_show(struct seq_file *m, void *v)
>  {
>         u8       cb_idx;
> -       int      scsi, fc, sas, lan, ctl, targ, dmp;
> +       int      scsi, fc, sas, lan, ctl, targ;
>         char    *drvname;
>
>         seq_printf(m, "%s-%s\n", "mptlinux", MPT_LINUX_VERSION_COMMON);
>         seq_printf(m, "  Fusion MPT base driver\n");
>
> -       scsi = fc = sas = lan = ctl = targ = dmp = 0;
> +       scsi = fc = sas = lan = ctl = targ = 0;
>         for (cb_idx = MPT_MAX_PROTOCOL_DRIVERS-1; cb_idx; cb_idx--) {
>                 drvname = NULL;
>                 if (MptCallbacks[cb_idx]) {
> --
> 2.35.1
>
>


-- 
Thanks,
~Nick Desaulniers
