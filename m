Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BF0C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  1 Jun 2022 10:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352160AbiFAKoQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 1 Jun 2022 06:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244283AbiFAKoM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Jun 2022 06:44:12 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF3F7C14D
        for <kernel-janitors@vger.kernel.org>; Wed,  1 Jun 2022 03:44:10 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id v9so1503934lja.12
        for <kernel-janitors@vger.kernel.org>; Wed, 01 Jun 2022 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fnL1OLV1PY9lMlL4F1psml7tqA7a4raxuISBfgJIhpI=;
        b=JPQamR7LzqBH0jJ27Q0Lo1OAV/I4In+aj2UdcEhnFoer7CxhD2/6Th9So1GleiVW0s
         UDhN164xgDIrzm42dhqzlmg6PmzohB3bxkZxWrHWgUV1R/hoQc3TNkLapmDN/NanpCh6
         GOlLZmqx2w4nUKpsIb9EcLaWMr3+f3yw5x03SXud+iPX6FRxo7JTxHv9GKmrdY99uvIi
         Eq4JaXgQscOudi91YWYXiFf0VE3WyAAJ8KiMt9Ne1Khmwu5NcwkN6jhk1o2dYXZTO1H7
         unCPHAkLVQ/vH579QAadTf3eteQfjHt/FW0uDbdh3eGRUuqWtk1vETB2+SxNo6odo0XH
         6nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fnL1OLV1PY9lMlL4F1psml7tqA7a4raxuISBfgJIhpI=;
        b=zVXeGg2KR3l5xJToWDbi7VkFL/PI1bMKnDLJyXm90tYccIvktkWkM73bXHuUlY+qgd
         E8Kh6HX08VtNXR0s5n/+02QtFYYRkS+12eIwxdob6T80FKODtNDhy15B6sZmtC6zWCRu
         vkCxNtJEisMWz0M9IBYwvKshUpEle42sKRoLu3PPKzirrQ4L7CiV3Ux/LteZuVjeclqc
         sFxCtWYlAPhHJUVcEaZyVXTjkucT4WNqIs8MvY1KpMjAHMnNE/cBuLoFulGEmcyTTGC3
         p1Skf04BE8dUmDUa0np3mUFutHaMy/UEsNNQYtbJRtPtX0igxdrhkL037p8AsUU+T40/
         rNHw==
X-Gm-Message-State: AOAM533Ka/GxMJ6xAyqgiJXRBNKqZJlXk9ymT1w0s22WrCdNOhSosLc5
        5POtKisGf/N8EKKZ4vyuvkb3Yx7wSQQ5iChyTtwBHg==
X-Google-Smtp-Source: ABdhPJzL6Hm338xmLjdt+tFgPO2JQEu2i6HOMaY+iApQ+fEFRrz+yOa5Wgm+FzcqjSzhM0e9sGs9ibkQ9ZNYB+uvycE=
X-Received: by 2002:a2e:9216:0:b0:255:6834:dcae with SMTP id
 k22-20020a2e9216000000b002556834dcaemr2925927ljg.466.1654080249243; Wed, 01
 Jun 2022 03:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220601085122.28176-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220601085122.28176-1-lukas.bulwahn@gmail.com>
From:   Anup Patel <apatel@ventanamicro.com>
Date:   Wed, 1 Jun 2022 16:13:57 +0530
Message-ID: <CAK9=C2WB2eoiFQfvSeQkioqcMuSLhP5eVKrd+eaTbuNMAXaG2w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Limit KVM RISC-V entry to existing selftests
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        KVM General <kvm@vger.kernel.org>,
        kvm-riscv@lists.infradead.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 1, 2022 at 2:21 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit fed9b26b2501 ("MAINTAINERS: Update KVM RISC-V entry to cover
> selftests support") optimistically adds a file entry for
> tools/testing/selftests/kvm/riscv/, but this directory does not exist.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference. The script is very useful to keep MAINTAINERS up to date
> and MAINTAINERS can be kept in a state where the script emits no warning.
>
> So, just drop the non-matching file entry rather than starting to collect
> exceptions of entries that may match in some close or distant future.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Anup, please consider to pick this minor clean-up patch.

Sure, I will include this as fix for 5.19-rcX

Thanks,
Anup

>
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36eab5ae237d..a8eee9d2aea5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10863,7 +10863,6 @@ F:      arch/riscv/include/asm/kvm*
>  F:     arch/riscv/include/uapi/asm/kvm*
>  F:     arch/riscv/kvm/
>  F:     tools/testing/selftests/kvm/*/riscv/
> -F:     tools/testing/selftests/kvm/riscv/
>
>  KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
>  M:     Christian Borntraeger <borntraeger@linux.ibm.com>
> --
> 2.17.1
>
