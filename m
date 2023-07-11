Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C6EEB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 06:27:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbjGKG1A (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 02:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbjGKG04 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 02:26:56 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32B9E73
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:26:47 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-440b54708f2so1937753137.0
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689056806; x=1691648806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14zvxAU7eiVc9OsMFSTax2qAuXB3wquFjwuS7Lf6Tlw=;
        b=nyo7b8JUKucVpxKbuCSJWPvAy9IJS992EYaGTOp4pauROAkEi4BbSwZ8X4mKR5dykP
         z/rqCAb549jGVwSoP8UDDnanb2sVGoXGjR0LJ1zs95zPkOUmZJY6C3M7VskQlBZMOiqB
         IX2QiEPYdgmHU0PWqRDw/0fxZumkEcl+rcTFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689056806; x=1691648806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14zvxAU7eiVc9OsMFSTax2qAuXB3wquFjwuS7Lf6Tlw=;
        b=Y61kUr9h/TJUZGvRwYYAlnq7l2J5j903LAIDUQf1vkMSffzkW1pKKn0R5yZD1XdIoO
         rswTBft6I7B+cL6E7KMG2lGGW2rBVQSQi07IogECEFbBnGmroEzzFh7PmxaFczWsoB8A
         D1+Zj3ueOVxF7zmqu36BFQvnhVIt9rs4YzXsj11fJIK6e7U1OaVpMH36IX+hSKOtJuV9
         q43utJf+1vgP7awoqbNrrQXcu5JJ/ITv+VlGpLGOGm7ZfigUGWx2XVsjEpOvTK9Ou73r
         iydDCdDj9gFTBnQYtoPftqcF+F57Pn22zaSKjuygBrImOYg2Ht4HCf+k4nprZcP1LJNl
         CixA==
X-Gm-Message-State: ABy/qLYza3PoOnRtry0D4yOO9m5NV9JwcGHx9eoyoT2KL6OsJNdN/PWA
        1aA6PRBjhAwBVycL9JS+klZgsqvIcDMnLxDpU1+/aQ==
X-Google-Smtp-Source: APBJJlHMaEnbxmt4E425Igz5HGD3wCNh0BoMyvBAaMvai+Tv83dzAu4AeO63cdOGIykZU4jOxYPixceOqCzy6e8qkLQ=
X-Received: by 2002:a67:f851:0:b0:443:66c5:a4e3 with SMTP id
 b17-20020a67f851000000b0044366c5a4e3mr7465305vsp.15.1689056806767; Mon, 10
 Jul 2023 23:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
In-Reply-To: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 11 Jul 2023 14:26:35 +0800
Message-ID: <CAGXv+5FcBapQSOQUU6c00Jirx+Zn9KADP2cEj9WZSs_ABiCm9g@mail.gmail.com>
Subject: Re: [PATCH] phy: phy-mtk-dp: Fix an error code in probe()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Markus Schneider-Pargmann <msp@baylibre.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Bo-Chen Chen <rex-bc.chen@mediatek.com>,
        linux-phy@lists.infradead.org, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Guillaume Ranquet <granquet@baylibre.com>,
        linux-mediatek@lists.infradead.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 11, 2023 at 2:13=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Negative -EINVAL was intended instead of positive EINVAL.
>
> Fixes: 6a23afad443a ("phy: phy-mtk-dp: Add driver for DP phy")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
