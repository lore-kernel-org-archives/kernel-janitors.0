Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9939DC43334
	for <kernel-janitors@archiver.kernel.org>; Sat, 25 Jun 2022 23:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbiFYXB1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 25 Jun 2022 19:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233574AbiFYXB0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 25 Jun 2022 19:01:26 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7275314080
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Jun 2022 16:01:25 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id l11so10528450ybu.13
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Jun 2022 16:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PwbpiGb/oD8HIRJr2SFQWUk8LsGUtaqCnJOZxvy/+o0=;
        b=V+yhpskio4hPlK8rjes/emBa2rjzvau3LUHIdAcBCJR3RO0/NLbqI+anJji3SQxOw2
         BBC4fMCRVdvY/C8a2G9acKeUAA9YUUPl0g+XM9HYbISGUVd4DXW3exEv55z7lYSoAvZJ
         VErONOGzTxFaFuSao0Sl+II4MZ3yUIUJe2l+3E82zPfBUpU1mSMQgOCA+/CU/XGk64du
         YWjVA7s7a2/s6unqh1LdglB1GXPMwlAqkpYjqG5yfd/+koPvJ9YudXhB/DwdJevQh2Qn
         S01GSqJBKvOG4PCHQ3EL4oxrL5tyUhDQ7Lo6iMotnR9SQV3e+Bhk/4ua8YXcB08cLyu/
         fjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PwbpiGb/oD8HIRJr2SFQWUk8LsGUtaqCnJOZxvy/+o0=;
        b=T5hpTNl4XXzU+p95tahEJ2y7NblVDolUeQUiy4K0VUBKgBPQkCDuTBLyLReA9XMyxr
         mJhbA1fDUXU1oTLUp5USzRQp+BYKxFgOgM/pG6iDpoxpwKnzs+ADyD9hQ7pcNA5H43W/
         5+KLO8mnvpWW3bSomc76p7uIpTD4jvS6a3pLLhtxyxM+gMgpWTgqPgH0ROi0Dq00XrL5
         ijxCW5Mh/OMSe4RxpkWjFFUfn1QweRauiV2MXXbXDPS5CkyvnxHyvMBUHplsSJWS1Gpr
         ye4aGtXgy/jDs+mGBSAO8fonqIG6693X0GbflYpl7hY3LtRPpE4KM7Lm7LH/sgw3Nplo
         kLhg==
X-Gm-Message-State: AJIora8dHpCsZbyrDrTGpl8ZgGRB+GwFadDqUZ/x3F8X8bS2NDSIJnmQ
        005er+tAf6E9Po6vUQ2LcXJB2fQ2sp0dJoUrRrkDMA==
X-Google-Smtp-Source: AGRyM1ugdsOA7x4YN7zvSVE7L9XjNnzE//OLJLQO6gD+BWDuV1BmbFIqcseR3ErrjUKM40mN4Ppck9IVQDTKfo2rGEY=
X-Received: by 2002:a25:8403:0:b0:66c:a405:a01e with SMTP id
 u3-20020a258403000000b0066ca405a01emr490833ybk.369.1656198084729; Sat, 25 Jun
 2022 16:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220613122955.20714-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220613122955.20714-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jun 2022 01:01:13 +0200
Message-ID: <CACRpkdZhzxxnqGrTkcekky5BCmHWegNMeTOKf-bafNb1A0DZYw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add include/dt-bindings/pinctrl to PIN
 CONTROL SUBSYSTEM
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 13, 2022 at 2:30 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Maintainers of the directory Documentation/devicetree/bindings/pinctrl
> are also the maintainers of the corresponding directory
> include/dt-bindings/pinctrl.
>
> Add the file entry for include/dt-bindings/pinctrl to the appropriate
> section in MAINTAINERS.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Linus, please pick this MAINTAINERS addition to your section.

OK then, challenge accepted, patch applied.

Yours,
Linus Walleij
