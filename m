Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A470DC6FD18
	for <kernel-janitors@archiver.kernel.org>; Wed, 29 Mar 2023 09:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjC2JiZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 29 Mar 2023 05:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjC2JiY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Mar 2023 05:38:24 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730072114
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Mar 2023 02:38:22 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id p2so10917064uap.1
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Mar 2023 02:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680082701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Kdo0962g9qjrK63Wmlr//5n9bFicAZn9s+ZEU+BxU8=;
        b=q3onjpNwj7m5wtVnisBHU/iaWonRFIgMPOAw3rp3d/782pYTSYBWvY5LfgqPeNm2RN
         gVM3r5bX4Cpl4OH9hB3g3HXP2qn9+/BjhXM22B5Uj+FxS7Q75IJp3n7osKdseE0QO5pQ
         nHHtiu4UwkZEi6LvPj3FEaXJU3sWIIiNVhCaduhGxgY6wkgT2nlOK4Bv+4EDPK7JphgV
         6TFzR7WXUBLKTS2Rud9/ilyyUZFVYeVdrgpK4hrKndbwlAlErwS2/5oGvjlDlKlzyDNx
         YVqKoKEPhpCnRwt2ETHySzBH9Q2yOCNensInbY8tHBYYCmxSAU/RwWvu6d1qqFQNXFs+
         8jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680082701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Kdo0962g9qjrK63Wmlr//5n9bFicAZn9s+ZEU+BxU8=;
        b=pvPXJ7y8xwieJ1TI5OnQZVTMTU0x9xdSJ6HnJCgNNTWOOFpN50Fr6le5Ke4t89YyF7
         6FzSoe5KX5NT68Zkq+NGNHHWJ2/oaGUfZIPTBIxsTpXyjpwFZgqH9U/W0SEliVceVgN+
         Z3naZ7R5Sxcg7LZIvKsxCi9U3ZdkSQZIBQ8KZ6/wjy+fMYtDUGE+uThLFOyVkiaY362W
         PKeKF8QPSgTxIUZkRo6WF9t2WOHO5s7NK3u7cf8pR0ZaHivh7N4X5Gt6JMu/8LxWMqm3
         c96ESTccX91NJ5dYSF11AzEy4/Ny8zg8Imb5zHDroAgb0C1FwFOa1vW9nRIJfN02yrdW
         eVpw==
X-Gm-Message-State: AAQBX9cpJMZD8DpBPNucodBBMIz4OIX/a6Dy/gF3lKhrpQWrjAlhRbg/
        mx599zlcbzB05r7QJAWiMWHdSVeFAlk0dH3iCqW2sA==
X-Google-Smtp-Source: AKy350aFwmtLvugVS91SXWv58KL7rNgH36bP8Zd/ssQQS9euHnK+TiBtfXgpvNKAwXuEGqbYg0WQqyzlGYvf7hTsufM=
X-Received: by 2002:a1f:9f52:0:b0:406:1ef2:7bc7 with SMTP id
 i79-20020a1f9f52000000b004061ef27bc7mr10108602vke.2.1680082701571; Wed, 29
 Mar 2023 02:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230329093200.419041-1-colin.i.king@gmail.com>
In-Reply-To: <20230329093200.419041-1-colin.i.king@gmail.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Wed, 29 Mar 2023 15:08:10 +0530
Message-ID: <CAFA6WYNOzJxwXA_RfAkHxp-w1Pu0UQpeZOoP7tyaGBSeBuERVQ@mail.gmail.com>
Subject: Re: [PATCH][next] optee: Fix spelling mistake "Unuspported" -> "Unsupported"
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Jens Wiklander <jens.wiklander@linaro.org>,
        op-tee@lists.trustedfirmware.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 29 Mar 2023 at 15:02, Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in a #error message. Fix it.

Thanks for catching it, it has already been fixed as part of this PR [1].

[1] https://lore.kernel.org/lkml/20230314184441.GA2936721@rayden/T/

-Sumit

>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/tee/optee/call.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
> index 290b1bb0e9cd..df5fb5410b72 100644
> --- a/drivers/tee/optee/call.c
> +++ b/drivers/tee/optee/call.c
> @@ -488,7 +488,7 @@ static bool is_normal_memory(pgprot_t p)
>  #elif defined(CONFIG_ARM64)
>         return (pgprot_val(p) & PTE_ATTRINDX_MASK) == PTE_ATTRINDX(MT_NORMAL);
>  #else
> -#error "Unuspported architecture"
> +#error "Unsupported architecture"
>  #endif
>  }
>
> --
> 2.30.2
>
