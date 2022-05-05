Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7556C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 May 2022 21:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386105AbiEEV6Z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 May 2022 17:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385943AbiEEV6Y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 May 2022 17:58:24 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC20D5EDD2
        for <kernel-janitors@vger.kernel.org>; Thu,  5 May 2022 14:54:43 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2ec42eae76bso63165567b3.10
        for <kernel-janitors@vger.kernel.org>; Thu, 05 May 2022 14:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MCoDgmddTtLI0GdQtfmKUixQsE6y5QSv0lEy17c3ipQ=;
        b=lu6mB205lEz4Wg1BqujKbELrVRbwubcWwzgfdPgmVjlSIGNeqVjtkWF+FObQNiaz98
         dycvzgpN8F2gnP7KVop+Gue3xaE0k8b8zPlaIeQaAm+Et5W0Uzd6cV+qCKIcW3PGzcPY
         WTsrJx6SKQUiKSpx07cO21m+c7p5f3S/9b8PTFJ5WYT+Sh1+zjemHtVlFG+Y6wGaiyLw
         fGBF4On5MHDwT/MaJgQSA8dIzSmED/cyUKtDx+kI+esrpNRt38LYF5v+Ov+W3WilJXmi
         HDuxTURVly1cdX4MqbcXnXM9soJds3OThmXzHcH1TsW0GUYA6dRco2rEQuiCUn6pIuLU
         9weA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MCoDgmddTtLI0GdQtfmKUixQsE6y5QSv0lEy17c3ipQ=;
        b=pUCXlsYLeBUBYom8NJA08vD9n+BvEutO5hEJCOW0ym3Fedl80UtxMvjdfT5XFjdQyn
         YiJigdtmtM0hkbG9vILHUS/hAqn8f0xTpcL8HRNmu9UEPNYpgDMoe+o4zh1BugK2Td5S
         4OEUdIQYgILG3f8OjFnwFFgrL0ZFaA8crits4lDu5KpaGMsk+m3DWX7SfuDkldJKDmUy
         2AJVJIZHBcVkaBKmWGW3X5+6MqYSymS4I2zcG39hg2d31XCPJhgWI/E/WGkGMkg7Fjdb
         hqzSwoBMYdZrf4vQek3fTHs697hKEc3ro3cpn9SHDXNANUqU/nWc2N0621yO+sMyfj1A
         PWtQ==
X-Gm-Message-State: AOAM530QiwebxBozFp8oQkqfVvjSuuSE3HJHujvIiPNZSfVjP+xr2VIM
        a42gsnX2VxeF4CYdJo1ePzou2uEGemUDg8jYZNGYVQ==
X-Google-Smtp-Source: ABdhPJy7/124+1LI10Jlw8d6t97wM8daplTn9Eb7OgCD2ZOkd1qQO0Zvn53MloyRf2+Dr/cFkj/pJF6YdBjUseWWSFE=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr184278ywd.118.1651787682943; Thu, 05
 May 2022 14:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220318103729.157574-29-Julia.Lawall@inria.fr>
In-Reply-To: <20220318103729.157574-29-Julia.Lawall@inria.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 May 2022 23:54:31 +0200
Message-ID: <CACRpkdYyAhQ2MQQmBsGs9PfTEw8H8bcr4ii8WC1gMehQXr+DqQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: gemini: fix typos in comments
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        kernel-janitors@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 18, 2022 at 11:37 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:

> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Patch applied!

Yours,
Linus Walleij
