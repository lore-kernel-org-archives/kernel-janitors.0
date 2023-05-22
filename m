Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27880C7EE29
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 May 2023 13:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbjEVNgJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 May 2023 09:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbjEVNgF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 May 2023 09:36:05 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7EABE
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 06:36:01 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-561bd0d31c1so52700137b3.0
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 06:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684762560; x=1687354560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm6AtU2+OuBX4llFg1IO4pE7VkjWX7FicmeHdP7xHo8=;
        b=kjyW5gc66/F3uTbXesgGX49WSw+dIl51v4d/Va824zEUdwv/PfUv+MSIoJ0bvul5fO
         4GDCS2cij488fH+RgarG2Nkip2cdL4Q4WXqi78BnvfItHa4krK1XgEunE3PyPng/X//j
         sCAKGeYG2LYtOyqwzJmQffEcCi2uhjuvZN88hiFe+x42HxB7ZXAdxlP8MGHteJS9aiCg
         JJyjzdamE/qO6nYWlv6dw8c/yfES6DHR5ZFYjSFeJdlhulosXxL+jk23AfgCVX168mVt
         lXirdCfJQwYieQ2ZNtw/iNcWTyfmydWkd/sS8a/xUfW+rTfziwo+zjLbcDzy/gl27d/Y
         NGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684762560; x=1687354560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mm6AtU2+OuBX4llFg1IO4pE7VkjWX7FicmeHdP7xHo8=;
        b=mBXinU9hxqMFNE/bKISXE3iTiZDqJH6iydgdPWYe7RvDBxv8kLuqRvkmixiitf2wG5
         G6UR2gjjaVAjFHxPbC7NbRt5blF1t1wKkp/3yZqtto2eI7ljvRaoJmitH6krhOd4zj7i
         3BtfvHHiCnuAs17HrPDTQpHymGPjl1PwSoGFg40yruUO3I6jclhYqtNhbSwfbf+/rVF+
         uUlhZTk29TZ0svNI5n3NdS4lw7jl7WqTdreB40W3CLI0wFrXyxuyR3AGfSLWOy77AXZJ
         fTI9x9YCnWIiaZ4zShm92Br246HX3+ZiOYdpHfE/sIL0jN0+I25KiIRLNvMywhsjkNWm
         umtA==
X-Gm-Message-State: AC+VfDwSSJZtB6VtUhMRtMk4MJQuwV4lLNrsLRHVywgYGIJE1xKhdvpb
        NHthvXbSDQLhi7R+YEIiKafFNwLrDoOQlQu91Vqkng==
X-Google-Smtp-Source: ACHHUZ7cEG8y3tp8stsvn7L0Bpoi51bVVFj6a4KIR3GU6ZdWQMI2zycbhRo/A0NMAiSWxeSPAr7uN2ggRaMlsBN0JdY=
X-Received: by 2002:a81:8390:0:b0:561:e71d:2618 with SMTP id
 t138-20020a818390000000b00561e71d2618mr10734264ywf.8.1684762560692; Mon, 22
 May 2023 06:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <ffc1e98d-0db4-4b8a-9e49-eb87ef844cbd@kili.mountain>
In-Reply-To: <ffc1e98d-0db4-4b8a-9e49-eb87ef844cbd@kili.mountain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 May 2023 15:35:49 +0200
Message-ID: <CACRpkdYogcTJ7LLD8Fh-=KjvRJuBFP3=pi9=Pv3E9tvuk3X1Cw@mail.gmail.com>
Subject: Re: [PATCH] pwm: ab8500: Fix error code in probe()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pwm@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 22, 2023 at 1:07=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> This code accidentally return positive EINVAL instead of negative
> -EINVAL.
>
> Fixes: eb41f334589d ("pwm: ab8500: Fix register offset calculation to not=
 depend on probe order")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
