Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7530C32772
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 Aug 2022 17:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbiHWRTo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 Aug 2022 13:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbiHWRTC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Aug 2022 13:19:02 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D641156E9
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Aug 2022 06:46:57 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id n7so9389090ejh.2
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Aug 2022 06:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=7Z8NPr+FyGlQ4LB813IGE67bv/Z2mUYuQ9UU0UTK4jw=;
        b=HFPWqekEwGzcDtbuB88mnXEN/wljrABTBsHdXIODXvASscpo6LpHc6QQlKtQ8jqOSB
         XS/7CczorjNGeI9Wg4BLy2YbzCe/wkP6x3OULFEhGBlT+o0aEeXhjXnXdGoB/9glaU7O
         g+xDSt/s/uulVmf//vVDHWFj4/N0rOqiJJ+T7NVMoXpNq8jXeuk8ta8lAA25ZA3KnOEm
         4o11nbcdtnjn/enqyKw84eOXCXNtIANRipzOg+6h74rVchDbsb2Z1SZ2OIu2OmhBhvgC
         Q+r2+TSs/yCR9PeK6jvdFoaWBU8RVi8QBjYGpLSQsIrBONoVxIcYniV/1B6X3zO3W7YO
         6cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=7Z8NPr+FyGlQ4LB813IGE67bv/Z2mUYuQ9UU0UTK4jw=;
        b=S1LI/9keI2XHyjhGn4Um8V3Wmp/U2CKZVguaia0pvMuL3vd1fqIXqKxXVzyTpo5w8P
         WFAgbF95orimU0WjAg2L9Qk6KJo3ESI+fPHwNk0LTBWPy+zFzJuuMmKRDXU+r4W0vq++
         vsqT18WHw7uIie8Vzy97BKY+ir8nGSqzeefiixWg6arYhr6q+Qk3RZFM7ZjtNqyv63+T
         YGE9h1u42/IhP0M/ilKmLJORHFm8eT8rjT8MIKoIuqMaRaSbNZnvsJfBLKtlJwmUmiiY
         lwknsZO3xOiqNALbTP5yG/q6D8TgEXRVkOTQ7nt2RvNtLrNT9rdXZ2Ed2vqQuYHm3E5M
         Jfjw==
X-Gm-Message-State: ACgBeo3qD+L8C1NjQUxRB3dZacX/2MVEtQ1MpLldXLCWNLopNZQ2M5Tc
        SjF383qsOZ+iJ13+foYs4pwDCBl8Jc3SjVY5Kf0lLpflUZs+Wg==
X-Google-Smtp-Source: AA6agR7gRiqRy2NjE1wxEl8SYmLOymoPVZYY50v6SrEJeWc0Q60OQihlMMemLNj2LLKjYS50cf3VOiWYBnj3sysZ44U=
X-Received: by 2002:a17:907:6d93:b0:73d:8593:9608 with SMTP id
 sb19-20020a1709076d9300b0073d85939608mr6089094ejc.203.1661262416062; Tue, 23
 Aug 2022 06:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <YwNZezPFKq9N1/1u@kili>
In-Reply-To: <YwNZezPFKq9N1/1u@kili>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 23 Aug 2022 15:46:43 +0200
Message-ID: <CACRpkdbzGbYq7WW=VL7T1HsEeabhmo6u9YUt2ZMF9=_DfHQRLA@mail.gmail.com>
Subject: Re: [bug report] regmap: Support accelerated noinc operations
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Aug 22, 2022 at 12:25 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> drivers/base/regmap/regmap.c
>     2132 static int regmap_noinc_readwrite(struct regmap *map, unsigned int reg,
>     2133                                   void *val, unsigned int val_len, bool write)
>     2134 {
>     2135         size_t val_bytes = map->format.val_bytes;
>     2136         size_t val_count = val_len / val_bytes;
>
> val_len is bytes.  val_count is elements.

Correct

>     2194         if (!ret && regmap_should_log(map)) {
>     2195                 dev_info(map->dev, "%x %s [", reg, write ? "<=" : "=>");
>     2196                 for (i = 0; i < val_len; i++) {
>                                          ^^^^^^^
> This should be val_count or it will beyond the end of the arrays.
>
>     2197                         switch (val_bytes) {
>     2198                         case 1:
>     2199                                 pr_cont("%x", u8p[i]);
>     2200                                 break;
>     2201                         case 2:
> --> 2202                                 pr_cont("%x", u16p[i]);
>     2203                                 break;
>     2204                         case 4:
>     2205                                 pr_cont("%x", u32p[i]);
>     2206                                 break;
>     2207 #ifdef CONFIG_64BIT
>     2208                         case 8:
>     2209                                 pr_cont("%llx", u64p[i]);
>     2210                                 break;
>     2211 #endif
>     2212                         default:
>     2213                                 break;
>     2214                         }
>     2215                         if (i == (val_len - 1))
>                                            ^^^^^^^
> val_count as well probably?

Good catch, I'll send a patch!

Yours,
Linus Walleij
