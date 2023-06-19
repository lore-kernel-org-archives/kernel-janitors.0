Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54797EB64D9
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 07:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjFSHD5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 03:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjFSHDz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 03:03:55 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8DB1AC
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 00:03:54 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-62ff0e0c5d7so25356506d6.1
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 00:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687158233; x=1689750233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BD0zn/dSyiVOCfeRhW5pho39c7q1GjuHdqlvtRu3jqA=;
        b=w4OcGG8A5Rf7WvGLN3b/lJAnbJKCrQcuVZ9HTVX1BoKvXZl63+knpSsidCVk+bAO1i
         5eOAf+3sb668V+j+R9iN/1TxwaELDHBt/ESvwlbzhwQhLRQmbZm3tTNu11Sf6zJNMCjY
         Wmo3TgS5PgYk/ZCoxlSRpeot3Nos+Fbt6MHa14ANmnz+e3dOKL9DakjoLcoxtddNSW4h
         hq6yUQz7Yk/vc9g+ExAq6w9fkPodchDJ7sbLR7E487oJ6jkgupN1gP19cav7BEtdcAiq
         3moQ8x9iT0ZzEAGHX4wuhdoGHogAfBMy2gkaGniCdeztBFZxXqP+x/locdRxtRdHT64m
         hy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687158233; x=1689750233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BD0zn/dSyiVOCfeRhW5pho39c7q1GjuHdqlvtRu3jqA=;
        b=S4ZP9UgD+uhhXZ4tMO7yQ0z/xqzB6H05a/ZvweqJpTx4Mt57dZ8+UTpaGAwFnnok1h
         QzcIOHgrdKsErO6uE+om1/4+Mg4MLaIlF2+zAeO6e0k8JRkhkMxHoy8YzO/qZOY3aHwr
         I2yTt919yv4x2UVybJx/8KW7xrLwmWaiV9rKW9xVYHy69JuIToRt79DFa2HJ6uqr6+7C
         lDDFulNiYqghTGLGFssvByJFcAMFjRMvSv3sUtHw3DR+g7VRHVxWY6bJeVG2QK5IR2Z1
         ZkaGbE38BMjz59zOGKUJA3NPYNuQNzRZ7+A8gZbiggcvYP0e+M9BafgaqI0uakycx1wj
         uCIg==
X-Gm-Message-State: AC+VfDx+NRwdpRNOZmUU975Cn+a5eBwZS1VDYe8j8TocAymygOT9wzIZ
        kY/4dBzGLz3sujwgR3iYqvdnJcjKrS15YPVuscAB8Q==
X-Google-Smtp-Source: ACHHUZ6/AZutpaAxoSSJ5rEGLJl9sCW2hxbTF0gVbt9G2whH+uajcSBro+NPrPGt1FnuvTRrnLqoZbICzlzKJ4qZMrw=
X-Received: by 2002:a05:6214:764:b0:62d:f68a:ee2d with SMTP id
 f4-20020a056214076400b0062df68aee2dmr9751586qvz.29.1687158233535; Mon, 19 Jun
 2023 00:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <8de3aaf297931d655b9ad6aed548f4de8b85425a.1686998575.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <8de3aaf297931d655b9ad6aed548f4de8b85425a.1686998575.git.christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Jun 2023 09:03:42 +0200
Message-ID: <CACRpkdZFQxRyRzxi9E9mtJA_VHKW_k0=hzMnJNGH5RFqsBSZPQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: stmpe: Fix a corner case in stmpe_probe()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Lee Jones <lee@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jun 17, 2023 at 12:43=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> In stmpe_probe(), if some regulator_enable() calls fail, probing continue=
s
> and there is only a dev_warn().
>
> So, if stmpe_probe() is called the regulator may not be enabled. It is
> cleaner to test it before calling regulator_disable() in the remove
> function.
>
> Fixes: 9c9e321455fb ("mfd: stmpe: add optional regulators")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks correct!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
