Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10962C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 29 Sep 2022 10:20:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbiI2KUP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 29 Sep 2022 06:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235415AbiI2KTm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 29 Sep 2022 06:19:42 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FB2EE0F;
        Thu, 29 Sep 2022 03:19:39 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id g23so475748qtu.2;
        Thu, 29 Sep 2022 03:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8GLG7G2DpP05n4xk1niTNKCRQjlEFDZ0ccIwrCXFgQA=;
        b=k2vqzLW/HsoWhWIq/V2jZO8/HE7h7dLgTYzJuIi0vNvME7lCpX5rgPXMgYwHjsxqss
         jmcxMth+GEonyN12lSCx+/Nj7LHSPWx6Ir1FgnPUwsicZQ3fDCiACvkAqVSoOxlN9Q+I
         xQMdidjl0NQOaLFayVE98NnHm/kvrjnx6TQUNl48plEBwfc8Nt3clZxIwIXhAhERp3UF
         IcRR38Ga5QFbevStQCj7Pux7mhi3pIOPDh7lzf0BBcu9w7EKNvf+VIURIN1gMIGEl5gA
         eWWGN7bI9y8suPzU5DghLmtDePaFL37hNN9u4Vu+xA2ssOYeZS63wizgFqbfO9Ry5LNX
         Llfg==
X-Gm-Message-State: ACrzQf0qgrRHm9qJDsWqRTBIXAxPjMbvt0Ba+NPX+XrmjZFLVbQwxroD
        6xl/3hFREj7sujBd5SxiuWsyp260ChxgNw==
X-Google-Smtp-Source: AMsMyM7ZHy3F6fA0JxaZxnbWD4g7bd/3nDAM4SaBww9vvEKZ4p2h7X7WgYB3MV4/1qmTdvoAhJO+PQ==
X-Received: by 2002:a05:622a:1a01:b0:35b:a454:dd01 with SMTP id f1-20020a05622a1a0100b0035ba454dd01mr1704917qtb.350.1664446778653;
        Thu, 29 Sep 2022 03:19:38 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id y123-20020a379681000000b006aedb35d8a1sm5506595qkd.74.2022.09.29.03.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 03:19:38 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-349c4310cf7so9811867b3.3;
        Thu, 29 Sep 2022 03:19:38 -0700 (PDT)
X-Received: by 2002:a81:5a57:0:b0:353:6de6:3263 with SMTP id
 o84-20020a815a57000000b003536de63263mr2384552ywb.358.1664446777926; Thu, 29
 Sep 2022 03:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220929101448.32177-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220929101448.32177-1-lukas.bulwahn@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Sep 2022 12:19:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwrUKc-o1i85n=BWDutYBS1LSwhZdkXME6hWw+7bmhsw@mail.gmail.com>
Message-ID: <CAMuHMdWwrUKc-o1i85n=BWDutYBS1LSwhZdkXME6hWw+7bmhsw@mail.gmail.com>
Subject: Re: [PATCH] m68k: update config files
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

CC Greg, as these are all coldfire or nommu defconfigs

On Thu, Sep 29, 2022 at 12:14 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Clean up config files by:
>   - removing configs that were deleted in the past
>   - removing configs not in tree and without recently pending patches
>   - adding new configs that are replacements for old configs in the file
>
> For some detailed information, see Link.
>
> Link: https://lore.kernel.org/kernel-janitors/20220929090645.1389-1-lukas.bulwahn@gmail.com/
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  arch/m68k/configs/amcore_defconfig   | 4 ----
>  arch/m68k/configs/m5208evb_defconfig | 3 ---
>  arch/m68k/configs/m5249evb_defconfig | 3 ---
>  arch/m68k/configs/m5272c3_defconfig  | 3 ---
>  arch/m68k/configs/m5275evb_defconfig | 3 ---
>  arch/m68k/configs/m5307c3_defconfig  | 3 ---
>  arch/m68k/configs/m5407c3_defconfig  | 3 ---
>  7 files changed, 22 deletions(-)
>
> diff --git a/arch/m68k/configs/amcore_defconfig b/arch/m68k/configs/amcore_defconfig
> index 6d9ed2198170..041adcf6ecfc 100644
> --- a/arch/m68k/configs/amcore_defconfig
> +++ b/arch/m68k/configs/amcore_defconfig
> @@ -27,9 +27,6 @@ CONFIG_PACKET=y
>  CONFIG_UNIX=y
>  CONFIG_INET=y
>  CONFIG_SYN_COOKIES=y
> -# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> -# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> -# CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_WIRELESS is not set
>  # CONFIG_UEVENT_HELPER is not set
> @@ -85,7 +82,6 @@ CONFIG_ROMFS_FS=y
>  CONFIG_ROMFS_BACKED_BY_BOTH=y
>  # CONFIG_NETWORK_FILESYSTEMS is not set
>  CONFIG_PRINTK_TIME=y
> -# CONFIG_ENABLE_MUST_CHECK is not set
>  # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>  CONFIG_PANIC_ON_OOPS=y
>  # CONFIG_SCHED_DEBUG is not set
> diff --git a/arch/m68k/configs/m5208evb_defconfig b/arch/m68k/configs/m5208evb_defconfig
> index 0ee3079f6ca9..31035a0b9247 100644
> --- a/arch/m68k/configs/m5208evb_defconfig
> +++ b/arch/m68k/configs/m5208evb_defconfig
> @@ -21,9 +21,6 @@ CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
>  CONFIG_INET=y
> -# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> -# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> -# CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_FW_LOADER is not set
> diff --git a/arch/m68k/configs/m5249evb_defconfig b/arch/m68k/configs/m5249evb_defconfig
> index f84f68c04065..5706d7a1daba 100644
> --- a/arch/m68k/configs/m5249evb_defconfig
> +++ b/arch/m68k/configs/m5249evb_defconfig
> @@ -22,9 +22,6 @@ CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
>  CONFIG_INET=y
> -# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> -# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> -# CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_FW_LOADER is not set
> diff --git a/arch/m68k/configs/m5272c3_defconfig b/arch/m68k/configs/m5272c3_defconfig
> index eca65020aae3..f02fe144f4ad 100644
> --- a/arch/m68k/configs/m5272c3_defconfig
> +++ b/arch/m68k/configs/m5272c3_defconfig
> @@ -22,9 +22,6 @@ CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
>  CONFIG_INET=y
> -# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> -# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> -# CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_FW_LOADER is not set
> diff --git a/arch/m68k/configs/m5275evb_defconfig b/arch/m68k/configs/m5275evb_defconfig
> index 9402c7a3e9c7..781f307ff330 100644
> --- a/arch/m68k/configs/m5275evb_defconfig
> +++ b/arch/m68k/configs/m5275evb_defconfig
> @@ -22,9 +22,6 @@ CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
>  CONFIG_INET=y
> -# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> -# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> -# CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_FW_LOADER is not set
> diff --git a/arch/m68k/configs/m5307c3_defconfig b/arch/m68k/configs/m5307c3_defconfig
> index bb8b0eb4bdfc..6eac482356ca 100644
> --- a/arch/m68k/configs/m5307c3_defconfig
> +++ b/arch/m68k/configs/m5307c3_defconfig
> @@ -22,9 +22,6 @@ CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
>  CONFIG_INET=y
> -# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> -# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> -# CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_FW_LOADER is not set
> diff --git a/arch/m68k/configs/m5407c3_defconfig b/arch/m68k/configs/m5407c3_defconfig
> index ce9ccf13c7c0..496dcccb1c18 100644
> --- a/arch/m68k/configs/m5407c3_defconfig
> +++ b/arch/m68k/configs/m5407c3_defconfig
> @@ -23,9 +23,6 @@ CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
>  CONFIG_INET=y
> -# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> -# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> -# CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_FW_LOADER is not set
> --
> 2.17.1
